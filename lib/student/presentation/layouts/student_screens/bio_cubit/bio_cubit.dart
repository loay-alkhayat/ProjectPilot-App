import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/services/dio_services.dart';
import '../../../../domain/entities/student_entities/add_bio_entitiy.dart';
import '../../../../domain/parameters/add_bio_parameters.dart';
import '../../../../domain/usecases/student_usecases/add_bio_usecase.dart';
import 'bio_states.dart';

class BioCubit extends Cubit<BioState> {
  BioEntity? bioEntity;
  final AddBioUseCase addBioUseCase;

  BioCubit(
    this.addBioUseCase,
  ) : super(BioInitialState());
  static BioCubit get(context) => BlocProvider.of(context);

  Future<void> addBio(BioParameters parameters) async {
    emit(AddBioLoadingState());
    final result = await addBioUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(AddBioErrorState(l.message));
    }, (r) {
      bioEntity = r;
      emit(AddBioSuccessState());
    });
  }
}
