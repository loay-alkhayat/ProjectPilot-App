import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/services/dio_services.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/entities/invitation_entites/send_invite_from_leader_entity.dart';
import 'package:projectpilot/student/domain/entities/invitation_entites/send_join_team_request_entity.dart';
import 'package:projectpilot/student/domain/entities/student_entities/get_all_students_entity.dart';
import 'package:projectpilot/student/domain/entities/supervisors_entities/get_engineer_entity.dart';
import 'package:projectpilot/student/domain/entities/supervisors_entities/get_supervisor_entity.dart';
import 'package:projectpilot/student/domain/entities/task_entities/creat_task_entity.dart';
import 'package:projectpilot/student/domain/entities/task_entities/get_tasks_entity.dart';
import 'package:projectpilot/student/domain/entities/team_entities/get_uni_proposals.dart';
import 'package:projectpilot/student/domain/parameters/create_team_param.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/approve_student_join_request_param.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/approve_team_join_request_parameters.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/reject_student_join_request_param.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/reject_team_join_request_parameters.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/send_invite_to_student_parameters.dart';
import 'package:projectpilot/student/domain/parameters/invitation_params/send_invite_to_supervisor_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/add_comment_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/add_like_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/delete_like_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/get_post_comments_parameters.dart';
import 'package:projectpilot/student/domain/parameters/search_students_param.dart';
import 'package:projectpilot/student/domain/parameters/search_supervisors_param.dart';
import 'package:projectpilot/student/domain/parameters/student_params/get_student_by_id_param.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/complete_sub_task_param.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/create_task_parameters.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_task_by_id_param.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_tasks_param.dart';
import 'package:projectpilot/student/domain/parameters/upload_pdf_parameters.dart';
import 'package:projectpilot/student/domain/usecases/blogs_usecase/get_blog_usecase.dart';
import 'package:projectpilot/student/domain/usecases/invitation_usecase/get_student_join_request_usecase.dart';
import 'package:projectpilot/student/domain/usecases/invitation_usecase/reject_team_join_request_usecase.dart';
import 'package:projectpilot/student/domain/usecases/invitation_usecase/send_invite_to_supervisor_usecase.dart';
import 'package:projectpilot/student/domain/usecases/invitation_usecase/send_invite_usecase.dart';
import 'package:projectpilot/student/domain/usecases/invitation_usecase/send_join_request_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/add_comment_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/add_like_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/delete_like_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/get_post_comments_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/get_posts_usecase.dart';
import 'package:projectpilot/student/domain/usecases/student_usecases/add_bio_usecase.dart';
import 'package:projectpilot/student/domain/usecases/student_usecases/get_student_by_id_usecase.dart';
import 'package:projectpilot/student/domain/usecases/student_usecases/get_student_info_usecase.dart';
import 'package:projectpilot/student/domain/usecases/task_usecases/complete_sub_task_usecase.dart';
import 'package:projectpilot/student/domain/usecases/task_usecases/create_sub_task_usecase.dart';
import 'package:projectpilot/student/domain/usecases/task_usecases/create_task_usecase.dart';
import 'package:projectpilot/student/domain/usecases/task_usecases/delete_sub_task_usecase.dart';
import 'package:projectpilot/student/domain/usecases/task_usecases/get_task_by_id_usecase.dart';
import 'package:projectpilot/student/domain/usecases/task_usecases/get_tasks_usecase.dart';
import 'package:projectpilot/student/domain/usecases/team_usecases/create_team_usecase.dart';
import 'package:projectpilot/student/domain/usecases/team_usecases/get_proposals_usecase.dart';
import 'package:projectpilot/student/domain/usecases/team_usecases/get_team_members_usecase.dart';
import 'package:projectpilot/student/domain/usecases/team_usecases/get_teams_usecase.dart';
import 'package:projectpilot/student/domain/usecases/team_usecases/upload_proposal_usecase.dart';
import 'package:projectpilot/student/presentation/blocs/main_bloc/states.dart';

import '../../../../core/models/models/message_model.dart';
import '../../../domain/entities/Post_entities/creat_Post_entity.dart';
import '../../../domain/entities/blogs_entity/get_blogs_entity.dart';
import '../../../domain/entities/invitation_entites/approve_and_reject_student_join_request_entity.dart';
import '../../../domain/entities/invitation_entites/approve_and_reject_team_join_request_entity.dart';
import '../../../domain/entities/invitation_entites/get_student_join_request_entity.dart';
import '../../../domain/entities/invitation_entites/get_team_join_requests.dart';
import '../../../domain/entities/invitation_entites/send_invite_to_engineer_entity.dart';
import '../../../domain/entities/invitation_entites/send_invite_to_supervisor_entity.dart';
import '../../../domain/entities/post_entities/add_comment_entity.dart';
import '../../../domain/entities/post_entities/get_post_comments_entity.dart';
import '../../../domain/entities/post_entities/get_posts_entity.dart';
import '../../../domain/entities/student_entities/add_bio_entitiy.dart';
import '../../../domain/entities/student_entities/get_student_by_id_entity.dart';
import '../../../domain/entities/student_entities/get_student_profile_by_token_entity.dart';
import '../../../domain/entities/task_entities/complete_sub_task_entity.dart';
import '../../../domain/entities/task_entities/create_sub_task_entity.dart';
import '../../../domain/entities/task_entities/delete_sub_task_entity.dart';
import '../../../domain/entities/task_entities/get_student_tasks_entity.dart';
import '../../../domain/entities/task_entities/get_task_by_id_entity.dart';
import '../../../domain/entities/team_entities/create_team_entity.dart';
import '../../../domain/entities/team_entities/get_team_by_id_entity.dart';
import '../../../domain/entities/team_entities/get_team_members_entity.dart';
import '../../../domain/entities/team_entities/get_teams_entity.dart';
import '../../../domain/entities/team_entities/upload_proposal_entity.dart';
import '../../../domain/parameters/add_bio_parameters.dart';
import '../../../domain/parameters/get_team_by_id_param.dart';
import '../../../domain/parameters/invitation_params/send_invite_to_engineer_param.dart';
import '../../../domain/parameters/posts_params/create_post_param.dart';
import '../../../domain/parameters/search_engineers_param.dart';
import '../../../domain/parameters/search_team_param.dart';
import '../../../domain/parameters/send_join_request_param.dart';
import '../../../domain/parameters/tasks_params/create_sub_task_param.dart';
import '../../../domain/parameters/tasks_params/delete_sub_task_param.dart';
import '../../../domain/parameters/tasks_params/delete_task_param.dart';
import '../../../domain/usecases/invitation_usecase/approve_student_join_request_usecase.dart';
import '../../../domain/usecases/invitation_usecase/approve_team_join_request_usecase.dart';
import '../../../domain/usecases/invitation_usecase/get_team_join_requests_usecase.dart';
import '../../../domain/usecases/invitation_usecase/reject_student_join_request_usecase.dart';
import '../../../domain/usecases/invitation_usecase/send_invite_to_engineer_usecase.dart';
import '../../../domain/usecases/post_usecases/create_post_usecase.dart';
import '../../../domain/usecases/student_usecases/get_students_usecase.dart';
import '../../../domain/usecases/supervisors_usecases/get_engineer_usecase.dart';
import '../../../domain/usecases/supervisors_usecases/get_supervisors_usecase.dart';
import '../../../domain/usecases/task_usecases/delete_task_usecase.dart';
import '../../../domain/usecases/task_usecases/get_student_tasks_usecase.dart';
import '../../../domain/usecases/team_usecases/get_team_by_id_usecase.dart';

class MainCubit extends Cubit<MainStates> {
  final SupervisorsUseCase supervisorsUseCase;
  final RejectTeamJoinRequestUseCase rejectTeamJoinRequestUseCase;
  final ApproveTeamJoinRequestUseCase approveTeamJoinRequestUseCase;
  final AddBioUseCase addBioUseCase;
  final CreateTeamUseCase createTeamUseCase;
  final EngineersUseCase engineersUseCase;
  final SendInviteUseCase sendInviteUseCase;
  final GetStudentsUseCase getStudentsUseCase;
  final GetProposalsUseCase getProposalsUseCase;
  final UploadProposalUseCase uploadProposalUseCase;
  final GetTasksUseCase getTasksUseCase;
  final CreateSubTaskUseCase createSubTaskUseCase;
  final CompleteSubTaskUseCase completeSubTaskUseCase;
  final DeleteSubTaskUseCase deleteSubTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final CreateTaskUseCase createTaskUseCase;
  final SendJoinRequestUseCase sendJoinRequestUseCase;
  final SendInviteToSupervisorUseCase sendInviteToSuperVisorUseCase;
  final SendInviteToEngineerUseCase sendInviteToEngineerUseCase;
  final GetTeamsUseCase getTeamsUseCase;
  final GetStudentByIdUseCase getStudentByIdUseCase;
  final GetStudentInfoUseCase getStudentInfoUseCase;
  final GetStudentTasksUseCase getStudentTasksUseCase;
  final GetBlogsUseCase getBlogsUseCase;
  final GetTeamByIdUseCase getTeamByIdUseCase;
  final GetTeamMembersUseCase getTeamMembersUseCase;
  final CreatePostUseCase createPostUseCase;
  final GetTeamJoinRequestUseCase getTeamJoinRequestsUseCase;
  final GetPostsUseCase getPostsUseCase;
  final GetPostCommentsUseCase getPostCommentsUseCase;
  final AddCommentUseCase addCommentUseCase;
  final AddLikeUseCase addLikeUseCase;
  final DeleteLikeUseCase unLikeUseCase;
  final GetStudentJoinRequestUseCase getStudentJoinRequestUseCase;
  final ApproveStudentJoinRequestUseCase approveStudentJoinRequestUseCase;
  final RejectStudentJoinRequestUseCase rejectStudentJoinRequestUseCase;
  final GetTaskByIdUseCase getTaskByIdUseCase;

  MainCubit(
    this.supervisorsUseCase,
    this.engineersUseCase,
    this.createTeamUseCase,
    this.sendInviteUseCase,
    this.sendJoinRequestUseCase,
    this.getStudentsUseCase,
    this.getStudentTasksUseCase,
    this.getStudentInfoUseCase,
    this.getTasksUseCase,
    this.getTeamJoinRequestsUseCase,
    this.createTaskUseCase,
    this.addCommentUseCase,
    this.addLikeUseCase,
    this.unLikeUseCase,
    this.deleteTaskUseCase,
    this.createSubTaskUseCase,
    this.createPostUseCase,
    this.getPostCommentsUseCase,
    this.getPostsUseCase,
    this.getTeamsUseCase,
    this.deleteSubTaskUseCase,
    this.rejectTeamJoinRequestUseCase,
    this.approveTeamJoinRequestUseCase,
    this.completeSubTaskUseCase,
    this.sendInviteToSuperVisorUseCase,
    this.sendInviteToEngineerUseCase,
    this.getTeamByIdUseCase,
    this.getStudentByIdUseCase,
    this.getBlogsUseCase,
    this.addBioUseCase,
    this.getTeamMembersUseCase,
    this.getProposalsUseCase,
    this.getStudentJoinRequestUseCase,
    this.approveStudentJoinRequestUseCase,
    this.rejectStudentJoinRequestUseCase,
    this.uploadProposalUseCase,
    this.getTaskByIdUseCase,
  ) : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);
  int indexOfTeamScreenTabBar = 0;
  int indexOfTabBarInSupervisorsScreen = 0;
  int indexOfSupervisors = 0;

  ///GetBlogs
  GetBlogsEntity? getBlogsEntity;
  bool getBlogsSuccess = false;

  Future<void> getBlogs(NoParameters parameters) async {
    getBlogsSuccess = false;
    emit(GetBlogsLoadingState());
    final result = await getBlogsUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetBlogsErrorState(l.message));
    }, (r) {
      getBlogsEntity = r;
      getBlogsSuccess = true;
      emit(GetBlogsSuccessState());
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

  ///GetProposals
  GetProposalsEntity? getProposalsEntity;
  bool getProposalsSuccess = false;

  Future<void> getProposals() async {
    getProposalsSuccess = false;
    emit(GetProposalsLoadingState());
    final result = await getProposalsUseCase(const NoParameters());
    result.fold((l) {
      logger.e(l.message);
      emit(GetProposalsErrorState(l.message));
    }, (r) {
      getProposalsEntity = r;
      getProposalsSuccess = true;
      emit(GetProposalsSuccessState());
    });
  }

  ///UploadProposals
  UploadProposalEntity? uploadProposalEntity;

  Future<void> uploadProposals(UploadProposalParameters parameters) async {
    emit(UploadProposalsLoadingState());
    final result = await uploadProposalUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(UploadProposalsErrorState(l.message));
    }, (r) {
      uploadProposalEntity = r;
      emit(UploadProposalsSuccessState());
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

  ///GetTeamMembers
  GetTeamMembersEntity? getTeamMembersEntity;
  bool getTeamsMembersSuccess = false;

  Future<void> getTeamMembers() async {
    getTeamsMembersSuccess = false;
    emit(GetTeamMembersLoadingState());
    final result = await getTeamMembersUseCase(const NoParameters());
    result.fold((l) {
      logger.e(l.message);
      emit(GetTeamMembersErrorState(l.message));
    }, (r) {
      getTeamMembersEntity = r;
      getTeamsMembersSuccess = true;
      emit(GetTeamMembersSuccessState());
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
      getTeamJoinRequestSuccess = true;
      emit(GetTeamJoinRequestsSuccessState());
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

  ///GetStudentInfo
  GetStudentInfoEntity? getStudentInfoEntity;
  bool getStudentInfosuccess = false;

  Future<void> getStudentInfo(NoParameters parameters) async {
    getStudentInfosuccess = false;
    emit(GetStudentInfoLoadingState());
    final result = await getStudentInfoUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetStudentInfoErrorState(l.message));
    }, (r) {
      getStudentInfosuccess = true;
      getStudentInfoEntity = r;
      emit(GetStudentInfoSuccessState());
    });
  }

  ///GetTasks
  GetTasksEntity? getTasksModel;
  bool getTasksSuccess = false;

  Future<void> getTasks(GetTaskParameters parameters) async {
    getTasksSuccess = false;
    emit(GetTasksLoadingState());
    final result = await getTasksUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetTasksErrorState(l.message));
    }, (r) {
      getTasksSuccess = true;
      getTasksModel = r;
      emit(GetTasksSuccessState());
    });
  }

  ///GetTaskByID
  GetTaskByIdEntity? getTaskByIdEntity;
  bool getTaskByIdSuccsess = false;

  Future<void> getTaskById(GetTaskByIDParameters parameters) async {
    getTaskByIdSuccsess = false;
    emit(GetTaskByIdLoadingState());
    final result = await getTaskByIdUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetTaskByIdErrorState(l.message));
    }, (r) {
      getTaskByIdSuccsess = true;
      getTaskByIdEntity = r;
      emit(GetTaskByIdSuccessState());
    });
  }

  ///CreateTeam
  CreateTeamEntity? createTeamEntity;
  bool creatTeamSucsses = false;

  Future<void> createTeam(CreateTeamParameters parameters) async {
    emit(CreateTeamLoadingState());

    final result = await createTeamUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(CreateTeamErrorState(l.message));
    }, (r) {
      createTeamEntity = r;
      creatTeamSucsses = true;
      emit(CreateTeamSuccessState());
    });
  }

  ///CreateTesk
  CreateTaskEntity? createTaskEntity;

  Future<void> createTask(CreateTaskParameters parameters) async {
    emit(CreateTaskLoadingState());

    final result = await createTaskUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(CreateTaskErrorState(l.message));
    }, (r) {
      createTaskEntity = r;
      emit(CreateTaskSuccessState());
    });
  }

  ///DeleteTesk

  Future<void> deleteTask(DeleteTaskParameters parameters) async {
    emit(DeleteTaskLoadingState());

    final result = await deleteTaskUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(DeleteTaskErrorState(l.message));
    }, (r) {
      emit(DeleteTaskSuccessState());
    });
  }

  ///CreateSubTesk
  CreateSubTaskEntity? createSubTaskEntity;

  Future<void> createSubTask(CreateSubTaskParameters parameters) async {
    emit(CreateSubTaskLoadingState());

    final result = await createSubTaskUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(CreateSubTaskErrorState(l.message));
    }, (r) {
      createSubTaskEntity = r;
      emit(CreateSubTaskSuccessState());
    });
  }

  ///CompleteSubTask
  CompleteSubTaskEntity? completeSubTaskEntity;

  Future<void> completeSubTask(CompleteSubTaskParameters parameters) async {
    emit(CompleteSubTaskLoadingState());

    final result = await completeSubTaskUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(CompleteSubTaskErrorState(l.message));
    }, (r) {
      completeSubTaskEntity = r;
      emit(CompleteSubTaskSuccessState());
    });
  }

  ///DeleteSubTask
  DeleteSubTaskEntity? deleteSubTaskEntity;

  Future<void> deleteSubTask(DeleteSubTaskParameters parameters) async {
    emit(DeleteSubTaskLoadingState());

    final result = await deleteSubTaskUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(DeleteSubTaskErrorState(l.message));
    }, (r) {
      deleteSubTaskEntity = r;
      emit(DeleteSubTaskSuccessState());
    });
  }

  ///GetStudent Tasks
  GetStudentTasksEntity? getStudentTasksEntity;

  Future<void> getStudentTasks(NoParameters parameters) async {
    emit(GetStudentTasksLoadingState());

    final result = await getStudentTasksUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(GetStudentTasksErrorState(l.message));
    }, (r) {
      getStudentTasksEntity = r;
      emit(GetStudentTasksSuccessState());
    });
  }

  ///CreatePost
  CreatePostEntity? createPostEntity;

  Future<void> createPost(CreatePostParameters parameters) async {
    emit(CreatePostLoadingState());

    final result = await createPostUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(CreatePostErrorState(l.message));
    }, (r) {
      createPostEntity = r;
      emit(CreatePostSuccessState());
    });
  }

  ///GetPosts
  GetPostsEntity? getPostsEntity;
  bool getPostsSuccess = false;

  Future<void> getPosts(NoParameters parameters) async {
    emit(GetPostsLoadingState());

    final result = await getPostsUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(GetPostsErrorState(l.message));
    }, (r) {
      getPostsSuccess = true;
      getPostsEntity = r;
      emit(GetPostsSuccessState());
    });
  }

  ///AddLike
  PostMethodResponsePostsScreensEntity? addLikeEntity;
  bool addLikeSuccess = false;

  Future<void> addLike(AddLikeParameters parameters) async {
    addLikeSuccess = false;
    emit(AddLikeLoadingState());
    final result = await addLikeUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(AddLikeErrorState(l.message));
    }, (r) {
      addLikeSuccess = true;
      addLikeEntity = r;
      emit(AddLikeSuccessState());
    });
  }

  ///DeleteLike
  PostMethodResponsePostsScreensEntity? unLikeEntity;

  Future<void> unLike(UnLikeParameters parameters) async {
    emit(UnLikeLoadingState());
    final result = await unLikeUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(UnLikeErrorState(l.message));
    }, (r) {
      unLikeEntity = r;
      emit(UnLikeSuccessState());
    });
  }

  ///AddComment
  PostMethodResponsePostsScreensEntity? addCommentEntity;
  bool addCommentSuccess = false;
  int postID = 0;

  Future<void> addComment(AddCommentParameters parameters) async {
    addCommentSuccess = false;
    emit(AddCommentLoadingState());
    final result = await addCommentUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(AddCommentErrorState(l.message));
    }, (r) {
      addCommentSuccess = true;
      addCommentEntity = r;
      emit(AddCommentSuccessState());
    });
  }

  ///GetPostComments
  GetPostCommentsEntity? getPostCommentsEntity;
  bool getPostCommentsSuccess = false;

  Future<void> getPostComments(GetPostCommentsParameters parameters) async {
    getPostCommentsSuccess = false;
    emit(GetPostCommentsLoadingState());
    final result = await getPostCommentsUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetPostCommentsErrorState(l.message));
    }, (r) {
      getPostCommentsSuccess = true;
      getPostCommentsEntity = r;
      emit(GetPostCommentsSuccessState());
    });
  }

  ///SendInvite
  SendInviteEntity? sendInviteEntity;
  bool invited = false;

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

  ///SendInviteToSupervisor
  SendInviteToSuperVisorEntity? sendInviteToSuperVisorEntity;

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

  ///SendInviteToEngineer
  SendInviteToEngineerEntity? sendInviteToEngineerEntity;

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

  ///SendJoinRequest
  SendJoinRequestEntity? sendJoinRequestEntity;

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

  ///AddBio
  BioEntity? bioEntity;

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

  void sendMessage({required String text}) async {
    emit(SendMessageLoadingState());
    MessageModel model = MessageModel(
      DateTime.now().toString(),
      getStudentInfoEntity!.data.teamID.toString(),
      getStudentInfoEntity!.data.studentID.toString(),
      text,
    );
    await FirebaseFirestore.instance
        .collection('teams')
        .doc(getStudentInfoEntity!.data.teamID.toString())
        .collection('messages')
        .add(model.toMap());
    emit(SendMessageSuccessState());
  }

  List<MessageModel> messages = [];
  bool getMessagesSuccess = false;
  void getMessages() {
    FirebaseFirestore.instance
        .collection('teams')
        .doc(getStudentInfoEntity?.data.teamID.toString())
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      getMessagesSuccess = true;
      messages = [];
      for (var element in event.docs) {
        messages.add(MessageModel.fromJson(element.data()));
      }
      emit(GetMessagesSuccessState());
    });
  }
}
