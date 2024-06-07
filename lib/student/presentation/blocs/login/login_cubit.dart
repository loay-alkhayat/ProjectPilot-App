import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/services/cache_storage_services.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/entities/student_entities/logout_entity.dart';
import 'package:projectpilot/student/domain/parameters/login_parameters.dart';
import 'package:projectpilot/student/domain/usecases/auth_usecase/logout_usecase.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/services/dio_services.dart';
import '../../../domain/entities/student_entities/login_entity.dart';
import '../../../domain/usecases/auth_usecase/login_usecase.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginUseCase loginUseCase;
  final LogoutUseCase logoutUseCase;

  LoginCubit(this.loginUseCase, this.logoutUseCase)
      : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  StudentEntity? loginModel;
  bool loginSuccsess = false;

  Future<void> login(LoginParameters parameters) async {
    emit(LoginLoadingState());
    final result = await loginUseCase.call(parameters);
    result.fold((l) {
      logger.e(l.message);
      loginSuccsess = false;
      emit(LoginErrorState(l.message));
    }, (r) {
      loginModel = r;
      CacheHelper.saveData(
          key: "studentToken", value: loginModel!.data.barrertoken);
      CacheHelper.saveData(
          key: "studentTeam", value: loginModel!.data.user.teamID);
      CacheHelper.saveData(
          key: "studentLeader", value: loginModel!.data.user.isLeader);
      AppConstants.userToken = loginModel!.data.barrertoken;
      AppConstants.userTeam = loginModel!.data.user.teamID;
      AppConstants.userLeader = loginModel!.data.user.isLeader;
      loginSuccsess = true;
      emit(LoginSuccessState());
    });
  }

  LogoutEntity? logoutEntity;

  Future<void> logout(NoParameters parameters) async {
    emit(LogoutLoadingState());
    final result = await logoutUseCase.call(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(LogoutErrorState(l.message));
    }, (r) {
      logoutEntity = r;
      CacheHelper.removeData(key: "studentToken");
      CacheHelper.removeData(key: "studentTeam");
      CacheHelper.removeData(key: "studentLeader");

      emit(LogoutSuccessState());
    });
  }
}
