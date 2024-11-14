import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/core/services/dio_services.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/entities/task_entities/creat_task_entity.dart';
import 'package:projectpilot/student/domain/entities/task_entities/get_tasks_entity.dart';
import 'package:projectpilot/student/domain/entities/team_entities/get_uni_proposals.dart';
import 'package:projectpilot/student/domain/parameters/create_team_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/add_comment_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/add_like_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/delete_like_param.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/get_post_comments_parameters.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/complete_sub_task_param.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/create_task_parameters.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_task_by_id_param.dart';
import 'package:projectpilot/student/domain/parameters/tasks_params/get_tasks_param.dart';
import 'package:projectpilot/student/domain/parameters/upload_pdf_parameters.dart';
import 'package:projectpilot/student/domain/usecases/blogs_usecase/get_blog_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/add_comment_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/add_like_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/delete_like_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/get_post_comments_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/get_posts_usecase.dart';
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

import '../../../../core/constants/app_constants.dart';
import '../../../domain/entities/Post_entities/creat_Post_entity.dart';
import '../../../domain/entities/blogs_entity/get_blogs_entity.dart';
import '../../../domain/entities/post_entities/add_comment_entity.dart';
import '../../../domain/entities/post_entities/get_post_comments_entity.dart';
import '../../../domain/entities/post_entities/get_posts_entity.dart';
import '../../../domain/entities/student_entities/get_student_profile_by_token_entity.dart';
import '../../../domain/entities/task_entities/complete_sub_task_entity.dart';
import '../../../domain/entities/task_entities/create_sub_task_entity.dart';
import '../../../domain/entities/task_entities/delete_sub_task_entity.dart';
import '../../../domain/entities/task_entities/get_student_tasks_entity.dart';
import '../../../domain/entities/task_entities/get_task_by_id_entity.dart';
import '../../../domain/entities/team_entities/create_team_entity.dart';
import '../../../domain/entities/team_entities/get_team_members_entity.dart';
import '../../../domain/entities/team_entities/upload_proposal_entity.dart';
import '../../../domain/parameters/posts_params/create_post_param.dart';
import '../../../domain/parameters/tasks_params/create_sub_task_param.dart';
import '../../../domain/parameters/tasks_params/delete_sub_task_param.dart';
import '../../../domain/parameters/tasks_params/delete_task_param.dart';
import '../../../domain/usecases/post_usecases/create_post_usecase.dart';
import '../../../domain/usecases/task_usecases/delete_task_usecase.dart';
import '../../../domain/usecases/task_usecases/get_student_tasks_usecase.dart';

class MainCubit extends Cubit<MainStates> {
  final CreateTeamUseCase createTeamUseCase;
  final GetProposalsUseCase getProposalsUseCase;
  final UploadProposalUseCase uploadProposalUseCase;
  final GetTasksUseCase getTasksUseCase;
  final CreateSubTaskUseCase createSubTaskUseCase;
  final CompleteSubTaskUseCase completeSubTaskUseCase;
  final DeleteSubTaskUseCase deleteSubTaskUseCase;
  final DeleteTaskUseCase deleteTaskUseCase;
  final CreateTaskUseCase createTaskUseCase;
  final GetTeamsUseCase getTeamsUseCase;
  final GetStudentInfoUseCase getStudentInfoUseCase;
  final GetStudentTasksUseCase getStudentTasksUseCase;
  final GetBlogsUseCase getBlogsUseCase;
  final GetTeamMembersUseCase getTeamMembersUseCase;
  final CreatePostUseCase createPostUseCase;
  final GetPostsUseCase getPostsUseCase;
  final GetPostCommentsUseCase getPostCommentsUseCase;
  final AddCommentUseCase addCommentUseCase;
  final AddLikeUseCase addLikeUseCase;
  final DeleteLikeUseCase unLikeUseCase;
  final GetTaskByIdUseCase getTaskByIdUseCase;

  MainCubit(
    this.createTeamUseCase,
    this.getStudentTasksUseCase,
    this.getStudentInfoUseCase,
    this.getTasksUseCase,
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
    this.completeSubTaskUseCase,
    this.getBlogsUseCase,
    this.getTeamMembersUseCase,
    this.getProposalsUseCase,
    this.uploadProposalUseCase,
    this.getTaskByIdUseCase,
  ) : super(MainInitialState());

  static MainCubit get(context) => BlocProvider.of(context);
  int indexOfTeamScreenTabBar = 0;

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
      AppConstants.userLeader = getStudentInfoEntity!.data.isLeader;
      AppConstants.userTeam = getStudentInfoEntity!.data.teamID;
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
}
