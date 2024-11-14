import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/services/dio_services.dart';
import 'package:projectpilot/student/domain/entities/invitation_entites/send_invite_from_leader_entity.dart';
import 'package:projectpilot/student/domain/entities/invitation_entites/send_invite_to_engineer_entity.dart';
import 'package:projectpilot/student/domain/entities/invitation_entites/send_invite_to_supervisor_entity.dart';
import 'package:projectpilot/student/domain/entities/invitation_entites/send_join_team_request_entity.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/send_invite_to_engineer_param.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/send_invite_to_student_parameters.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/send_invite_to_supervisor_param.dart';
import 'package:projectpilot/student/domain/parameters/send_join_request_param.dart';
import 'package:projectpilot/student/presentation/layouts/supervisors_screen/invites_actions_cubit/invites_actions_states.dart';

import '../../../../../core/usecase/base_usecase.dart';
import '../../../../domain/entities/invitation_entites/approve_and_reject_student_join_request_entity.dart';
import '../../../../domain/entities/invitation_entites/approve_and_reject_team_join_request_entity.dart';
import '../../../../domain/entities/invitation_entites/get_student_join_request_entity.dart';
import '../../../../domain/entities/invitation_entites/get_team_join_requests.dart';
import '../../../../domain/entities/student_entities/get_all_students_entity.dart';
import '../../../../domain/entities/student_entities/get_student_by_id_entity.dart';
import '../../../../domain/entities/supervisors_entities/get_engineer_entity.dart';
import '../../../../domain/entities/supervisors_entities/get_supervisor_entity.dart';
import '../../../../domain/entities/team_entities/get_team_by_id_entity.dart';
import '../../../../domain/entities/team_entities/get_teams_entity.dart';
import '../../../../domain/parameters/get_team_by_id_param.dart';
import '../../../../domain/parameters/invitation_params/approve_student_join_request_param.dart';
import '../../../../domain/parameters/invitation_params/approve_team_join_request_parameters.dart';
import '../../../../domain/parameters/invitation_params/reject_student_join_request_param.dart';
import '../../../../domain/parameters/invitation_params/reject_team_join_request_parameters.dart';
import '../../../../domain/parameters/search_engineers_param.dart';
import '../../../../domain/parameters/search_students_param.dart';
import '../../../../domain/parameters/search_supervisors_param.dart';
import '../../../../domain/parameters/search_team_param.dart';
import '../../../../domain/parameters/student_params/get_student_by_id_param.dart';
import '../../../../domain/usecases/invitation_usecase/approve_student_join_request_usecase.dart';
import '../../../../domain/usecases/invitation_usecase/approve_team_join_request_usecase.dart';
import '../../../../domain/usecases/invitation_usecase/get_student_join_request_usecase.dart';
import '../../../../domain/usecases/invitation_usecase/get_team_join_requests_usecase.dart';
import '../../../../domain/usecases/invitation_usecase/reject_student_join_request_usecase.dart';
import '../../../../domain/usecases/invitation_usecase/reject_team_join_request_usecase.dart';
import '../../../../domain/usecases/invitation_usecase/send_invite_to_engineer_usecase.dart';
import '../../../../domain/usecases/invitation_usecase/send_invite_to_supervisor_usecase.dart';
import '../../../../domain/usecases/invitation_usecase/send_invite_usecase.dart';
import '../../../../domain/usecases/invitation_usecase/send_join_request_usecase.dart';
import '../../../../domain/usecases/student_usecases/get_student_by_id_usecase.dart';
import '../../../../domain/usecases/student_usecases/get_students_usecase.dart';
import '../../../../domain/usecases/supervisors_usecases/get_engineer_usecase.dart';
import '../../../../domain/usecases/supervisors_usecases/get_supervisors_usecase.dart';
import '../../../../domain/usecases/team_usecases/get_team_by_id_usecase.dart';
import '../../../../domain/usecases/team_usecases/get_teams_usecase.dart';

class InviteActionsCubit extends Cubit<InviteActionsState> {
  final SendInviteUseCase sendInviteUseCase;
  final SendInviteToSupervisorUseCase sendInviteToSuperVisorUseCase;
  final SendInviteToEngineerUseCase sendInviteToEngineerUseCase;
  final SendJoinRequestUseCase sendJoinRequestUseCase;
  final GetTeamJoinRequestUseCase getTeamJoinRequestsUseCase;
  final ApproveStudentJoinRequestUseCase approveStudentJoinRequestUseCase;
  final RejectTeamJoinRequestUseCase rejectTeamJoinRequestUseCase;
  final ApproveTeamJoinRequestUseCase approveTeamJoinRequestUseCase;
  final EngineersUseCase engineersUseCase;
  final GetStudentJoinRequestUseCase getStudentJoinRequestUseCase;
  final SupervisorsUseCase supervisorsUseCase;
  final GetTeamsUseCase getTeamsUseCase;
  final GetStudentByIdUseCase getStudentByIdUseCase;
  final GetTeamByIdUseCase getTeamByIdUseCase;

  final RejectStudentJoinRequestUseCase rejectStudentJoinRequestUseCase;

  final GetStudentsUseCase getStudentsUseCase;

  SendInviteEntity? sendInviteEntity;
  SendInviteToSuperVisorEntity? sendInviteToSuperVisorEntity;
  SendInviteToEngineerEntity? sendInviteToEngineerEntity;
  SendJoinRequestEntity? sendJoinRequestEntity;
  static InviteActionsCubit get(context) => BlocProvider.of(context);
  int indexOfTabBarInSupervisorsScreen = 0;
  int indexOfSupervisors = 0;

  bool invited = false;

  InviteActionsCubit(
    this.getTeamsUseCase,
    this.getTeamByIdUseCase,
    this.sendJoinRequestUseCase,
    this.sendInviteUseCase,
    this.approveTeamJoinRequestUseCase,
    this.getStudentsUseCase,
    this.sendInviteToSuperVisorUseCase,
    this.getStudentJoinRequestUseCase,
    this.supervisorsUseCase,
    this.sendInviteToEngineerUseCase,
    this.rejectStudentJoinRequestUseCase,
    this.getStudentByIdUseCase,
    this.rejectTeamJoinRequestUseCase,
    this.engineersUseCase,
    this.approveStudentJoinRequestUseCase,
    this.getTeamJoinRequestsUseCase,
  ) : super(InviteActionsInitialState());

  // إرسال دعوة
  Future<void> sendInvite(SendInviteParameters parameters) async {
    emit(SendInviteLoadingState());
    final result = await sendInviteUseCase(parameters);
    result.fold((l) {
      invited = false;
      logger.e(l.message);
      emit(SendInviteErrorState(l.message));
    }, (r) {
      invited = true;
      sendInviteEntity = r;
      emit(SendInviteSuccessState());
    });
  }

  // إرسال دعوة للمشرف
  Future<void> sendInviteToSupervisor(
      SendInviteToSuperVisorParameters parameters) async {
    emit(SendInviteToSupervisorLoadingState());
    final result = await sendInviteToSuperVisorUseCase(parameters);
    result.fold((l) {
      invited = false;
      logger.e(l.message);
      emit(SendInviteToSupervisorErrorState(l.message));
    }, (r) {
      invited = true;
      sendInviteToSuperVisorEntity = r;
      emit(SendInviteToSupervisorSuccessState());
    });
  }

  // إرسال دعوة للمهندس
  Future<void> sendInviteToEngineer(
      SendInviteToEngineerParameters parameters) async {
    emit(SendInviteToEngineerLoadingState());
    final result = await sendInviteToEngineerUseCase(parameters);
    result.fold((l) {
      invited = false;
      logger.e(l.message);
      emit(SendInviteToEngineerErrorState(l.message));
    }, (r) {
      invited = true;
      sendInviteToEngineerEntity = r;
      emit(SendInviteToEngineerSuccessState());
    });
  }

  // إرسال طلب انضمام
  Future<void> sendJoinRequest(SendJoinRequestParameters parameters) async {
    emit(SendJoinRequestLoadingState());
    final result = await sendJoinRequestUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(SendJoinRequestErrorState(l.message));
    }, (r) {
      sendJoinRequestEntity = r;
      emit(SendJoinRequestSuccessState());
    });
  }

  ///GetTeamJoinRequests
  GetTeamJoinRequestEntity? getTeamJoinRequestEntity;
  bool getTeamJoinRequestSuccess = false;

  Future<void> getTeamJoinRequest() async {
    getTeamJoinRequestSuccess = false;
    emit(GetTeamJoinRequestsLoadingState());
    final result = await getTeamJoinRequestsUseCase(const NoParameters());
    result.fold((l) {
      logger.e(l.message);
      emit(GetTeamJoinRequestsErrorState(l.message));
    }, (r) {
      getTeamJoinRequestEntity = r;
      logger.i(r.data[0].requestID);
      getTeamJoinRequestSuccess = true;
      emit(GetTeamJoinRequestsSuccessState());
    });
  }

  ///GetStudentJoinRequestsToTeam
  GetStudentJoinRequestEntity? getStudentJoinRequestEntity;
  bool getStudentJoinRequestSuccsess = false;

  Future<void> getStudentJoinRequest(NoParameters parameters) async {
    getStudentJoinRequestSuccsess = false;
    emit(GetStudentJoinRequestsLoadingState());
    final result = await getStudentJoinRequestUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetStudentJoinRequestsErrorState(l.message));
    }, (r) {
      getStudentJoinRequestSuccsess = true;
      getStudentJoinRequestEntity = r;
      emit(GetStudentJoinRequestsSuccessState());
    });
  }

  ///RejectStudentJoinRequestsForTeam
  ApproveAndRejectTeamJoinRequestEntity? rejectTeamJoinRequestEntity;

  Future<void> rejectTeamJoinRequest(
      RejectTeamJoinRequestParameters parameters) async {
    emit(RejectTeamJoinRequestLoadingState());
    final result = await rejectTeamJoinRequestUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(RejectTeamJoinRequestErrorState(l.message));
    }, (r) {
      rejectTeamJoinRequestEntity = r;
      emit(RejectTeamJoinRequestSuccessState());
    });
  }

  ///ApproveStudentJoinRequestsForTeam
  ApproveAndRejectTeamJoinRequestEntity? approveTeamJoinRequestEntity;

  Future<void> approveTeamJoinRequest(
      ApproveTeamJoinRequestParameters parameters) async {
    emit(ApproveTeamJoinRequestLoadingState());
    final result = await approveTeamJoinRequestUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(ApproveTeamJoinRequestErrorState(l.message));
    }, (r) {
      approveTeamJoinRequestEntity = r;
      emit(ApproveTeamJoinRequestSuccessState());
    });
  }

  ///ApproveStudentJoinRequestsToTeam
  ApproveAndRejectStudentJoinRequestEntity? approveStudentJoinRequestEntity;

  Future<void> approveStudentJoinRequest(
      ApproveStudentJoinRequestParameters parameters) async {
    emit(ApproveStudentJoinRequestLoadingState());
    final result = await approveStudentJoinRequestUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(ApproveStudentJoinRequestErrorState(l.message));
    }, (r) {
      approveStudentJoinRequestEntity = r;
      emit(ApproveStudentJoinRequestSuccessState());
    });
  }

  ///RejectStudentJoinRequestsToTeam
  ApproveAndRejectStudentJoinRequestEntity? rejectStudentJoinRequestEntity;

  Future<void> rejectStudentJoinRequest(
      RejectStudentJoinRequestParameters parameters) async {
    emit(RejectStudentJoinRequestLoadingState());
    final result = await rejectStudentJoinRequestUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(RejectStudentJoinRequestErrorState(l.message));
    }, (r) {
      rejectStudentJoinRequestEntity = r;
      emit(RejectStudentJoinRequestSuccessState());
    });
  }

  ///GetTeams
  GetTeamsEntity? getTeamsEntity;
  bool getTeamsSuccess = false;

  Future<void> getTeams(SearchTeamParameters? parameters) async {
    getTeamsSuccess = false;
    emit(GetTeamsLoadingState());
    final result = await getTeamsUseCase(parameters!);
    result.fold((l) {
      logger.e(l.message);
      emit(GetTeamsErrorState(l.message));
    }, (r) {
      getTeamsEntity = r;
      getTeamsSuccess = true;
      emit(GetTeamsSuccessState());
    });
  }

  ///Engineers

  EngineerEntity? engineerEntity;
  bool getEngineersSuccess = false;

  Future<void> getEngineers(SearchEngineersParameters parameters) async {
    getEngineersSuccess = false;
    emit(GetEngineersLoadingState());
    final result = await engineersUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetEngineersErrorState(l.message));
    }, (r) {
      engineerEntity = r;
      getEngineersSuccess = true;
      emit(GetEngineersSuccessState());
    });
  }

  ///Supervisors
  SupervisorEntity? supervisorEntity;
  bool getSupervisorsSuccess = false;

  Future<void> getSupervisors(SearchSupervisorsParameters parameters) async {
    getSupervisorsSuccess = false;

    emit(GetSupervisorsLoadingState());
    final result = await supervisorsUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetSupervisorsErrorState(l.message));
    }, (r) {
      supervisorEntity = r;
      getSupervisorsSuccess = true;
      emit(GetSupervisorsSuccessState());
    });
  }

  ///GetStudents

  GetStudentsEntity? getStudentEntity;
  bool getStudentsSuccess = false;

  Future<void> getStudents(SearchStudentsParameters parameters) async {
    getStudentsSuccess = false;
    emit(GetStudentsLoadingState());
    final result = await getStudentsUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetStudentsErrorState(l.message));
    }, (r) {
      getStudentEntity = r;
      getStudentsSuccess = true;
      emit(GetStudentsSuccessState());
    });
  }

  ///GetTeamByID
  GetTeamByIdEntity? getTeamByIdEntity;
  bool getTeamsByIdSuccess = false;

  Future<void> getTeamById(GetTeamByIdParameters parameters) async {
    getTeamsByIdSuccess = false;
    emit(GetTeamByIdLoadingState());
    final result = await getTeamByIdUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetTeamByIdErrorState(l.message));
    }, (r) {
      getTeamByIdEntity = r;
      getTeamsByIdSuccess = true;
      emit(GetTeamByIdSuccessState());
    });
  }

  ///GetStudentByID
  GetStudentByIdEntity? getStudentByIdEntity;
  bool getStudentByIdSuccess = false;

  Future<void> getStudentById(GetStudentByIdParameters parameters) async {
    getStudentByIdSuccess = false;
    emit(GetStudentByIdLoadingState());
    final result = await getStudentByIdUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetStudentByIdErrorState(l.message));
    }, (r) {
      getStudentByIdEntity = r;
      getStudentByIdSuccess = true;
      emit(GetStudentByIdSuccessState());
    });
  }
}
