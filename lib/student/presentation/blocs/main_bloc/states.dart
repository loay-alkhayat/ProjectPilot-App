import 'package:equatable/equatable.dart';

abstract class MainStates extends Equatable {
  const MainStates();

  @override
  List<Object> get props {
    return [];
  }
}

class MainInitialState extends MainStates {}

///GetBlogs States
class GetBlogsLoadingState extends MainStates {}

class GetBlogsSuccessState extends MainStates {}

class GetBlogsErrorState extends MainStates {
  final String error;

  const GetBlogsErrorState(this.error);
}

///SuperVisors States
class GetSupervisorsLoadingState extends MainStates {}

class GetSupervisorsSuccessState extends MainStates {}

class GetSupervisorsErrorState extends MainStates {
  final String error;

  const GetSupervisorsErrorState(this.error);
}

///Engineers States
class GetEngineersLoadingState extends MainStates {}

class GetEngineersSuccessState extends MainStates {}

class GetEngineersErrorState extends MainStates {
  final String error;

  const GetEngineersErrorState(this.error);
}

///GetStudents States
class GetStudentsLoadingState extends MainStates {}

class GetStudentsSuccessState extends MainStates {}

class GetStudentsErrorState extends MainStates {
  final String error;

  const GetStudentsErrorState(this.error);
}

///GetProposals States
class GetProposalsLoadingState extends MainStates {}

class GetProposalsSuccessState extends MainStates {}

class GetProposalsErrorState extends MainStates {
  final String error;

  const GetProposalsErrorState(this.error);
}

///UploadProposals States
class UploadProposalsLoadingState extends MainStates {}

class UploadProposalsSuccessState extends MainStates {}

class UploadProposalsErrorState extends MainStates {
  final String error;

  const UploadProposalsErrorState(this.error);
}

/////GetTeams States
class GetTeamsLoadingState extends MainStates {}

class GetTeamsSuccessState extends MainStates {}

class GetTeamsErrorState extends MainStates {
  final String error;

  const GetTeamsErrorState(this.error);
}

/////GetTeams States
class GetTeamMembersLoadingState extends MainStates {}

class GetTeamMembersSuccessState extends MainStates {}

class GetTeamMembersErrorState extends MainStates {
  final String error;

  const GetTeamMembersErrorState(this.error);
}

/////GetTeamsJoinRequests States
class GetTeamJoinRequestsLoadingState extends MainStates {}

class GetTeamJoinRequestsSuccessState extends MainStates {}

class GetTeamJoinRequestsErrorState extends MainStates {
  final String error;

  const GetTeamJoinRequestsErrorState(this.error);
}

/////GetStudentJoinRequests States
class GetStudentJoinRequestsLoadingState extends MainStates {}

class GetStudentJoinRequestsSuccessState extends MainStates {}

class GetStudentJoinRequestsErrorState extends MainStates {
  final String error;

  const GetStudentJoinRequestsErrorState(this.error);
}

/////RejectTeamJoinRequests States
class RejectTeamJoinRequestLoadingState extends MainStates {}

class RejectTeamJoinRequestSuccessState extends MainStates {}

class RejectTeamJoinRequestErrorState extends MainStates {
  final String error;

  const RejectTeamJoinRequestErrorState(this.error);
}

/////RejectStudentJoinRequests States
class RejectStudentJoinRequestLoadingState extends MainStates {}

class RejectStudentJoinRequestSuccessState extends MainStates {}

class RejectStudentJoinRequestErrorState extends MainStates {
  final String error;

  const RejectStudentJoinRequestErrorState(this.error);
}

/////ApproveTeamJoinRequests States
class ApproveTeamJoinRequestLoadingState extends MainStates {}

class ApproveTeamJoinRequestSuccessState extends MainStates {}

class ApproveTeamJoinRequestErrorState extends MainStates {
  final String error;

  const ApproveTeamJoinRequestErrorState(this.error);
}

/////ApproveStudentJoinRequests States
class ApproveStudentJoinRequestLoadingState extends MainStates {}

class ApproveStudentJoinRequestSuccessState extends MainStates {}

class ApproveStudentJoinRequestErrorState extends MainStates {
  final String error;

  const ApproveStudentJoinRequestErrorState(this.error);
}

/////GetTeamsByID States
class GetTeamByIdLoadingState extends MainStates {}

class GetTeamByIdSuccessState extends MainStates {}

class GetTeamByIdErrorState extends MainStates {
  final String error;

  const GetTeamByIdErrorState(this.error);
}

/////GetStudentByID States
class GetStudentByIdLoadingState extends MainStates {}

class GetStudentByIdSuccessState extends MainStates {}

class GetStudentByIdErrorState extends MainStates {
  final String error;

  const GetStudentByIdErrorState(this.error);
}

/////GetStudentInfo States
class GetStudentInfoLoadingState extends MainStates {}

class GetStudentInfoSuccessState extends MainStates {}

class GetStudentInfoErrorState extends MainStates {
  final String error;

  const GetStudentInfoErrorState(this.error);
}

///GetTasks States
class GetTasksLoadingState extends MainStates {}

class GetTasksSuccessState extends MainStates {}

class GetTasksErrorState extends MainStates {
  final String error;

  const GetTasksErrorState(this.error);
}

///GetTaskByID States
class GetTaskByIdLoadingState extends MainStates {}

class GetTaskByIdSuccessState extends MainStates {}

class GetTaskByIdErrorState extends MainStates {
  final String error;

  const GetTaskByIdErrorState(this.error);
}

///CreateTeam States
class CreateTeamLoadingState extends MainStates {}

class CreateTeamSuccessState extends MainStates {}

class CreateTeamErrorState extends MainStates {
  final String error;

  const CreateTeamErrorState(this.error);
}

///CreateTask States
class CreateTaskLoadingState extends MainStates {}

class CreateTaskSuccessState extends MainStates {}

class CreateTaskErrorState extends MainStates {
  final String error;

  const CreateTaskErrorState(this.error);
}

///DeleteTask States
class DeleteTaskLoadingState extends MainStates {}

class DeleteTaskSuccessState extends MainStates {}

class DeleteTaskErrorState extends MainStates {
  final String error;

  const DeleteTaskErrorState(this.error);
}

///CreateSubTask States
class CreateSubTaskLoadingState extends MainStates {}

class CreateSubTaskSuccessState extends MainStates {}

class CreateSubTaskErrorState extends MainStates {
  final String error;

  const CreateSubTaskErrorState(this.error);
}

///CompleteSubTask States
class CompleteSubTaskLoadingState extends MainStates {}

class CompleteSubTaskSuccessState extends MainStates {}

class CompleteSubTaskErrorState extends MainStates {
  final String error;

  const CompleteSubTaskErrorState(this.error);
}

///CreateSubTask States
class DeleteSubTaskLoadingState extends MainStates {}

class DeleteSubTaskSuccessState extends MainStates {}

class DeleteSubTaskErrorState extends MainStates {
  final String error;

  const DeleteSubTaskErrorState(this.error);
}

///GetStudentTasks States
class GetStudentTasksLoadingState extends MainStates {}

class GetStudentTasksSuccessState extends MainStates {}

class GetStudentTasksErrorState extends MainStates {
  final String error;

  const GetStudentTasksErrorState(this.error);
}

///CreatePost States
class CreatePostLoadingState extends MainStates {}

class CreatePostSuccessState extends MainStates {}

class CreatePostErrorState extends MainStates {
  final String error;

  const CreatePostErrorState(this.error);
}

///GetPosts States
class GetPostsLoadingState extends MainStates {}

class GetPostsSuccessState extends MainStates {}

class GetPostsErrorState extends MainStates {
  final String error;

  const GetPostsErrorState(this.error);
}

///AddComment States
class AddCommentLoadingState extends MainStates {}

class AddCommentSuccessState extends MainStates {}

class AddCommentErrorState extends MainStates {
  final String error;

  const AddCommentErrorState(this.error);
}

///AddLike States
class AddLikeLoadingState extends MainStates {}

class AddLikeSuccessState extends MainStates {}

class AddLikeErrorState extends MainStates {
  final String error;

  const AddLikeErrorState(this.error);
}

///UnLike States
class UnLikeLoadingState extends MainStates {}

class UnLikeSuccessState extends MainStates {}

class UnLikeErrorState extends MainStates {
  final String error;

  const UnLikeErrorState(this.error);
}

///GetPostComments States
class GetPostCommentsLoadingState extends MainStates {}

class GetPostCommentsSuccessState extends MainStates {}

class GetPostCommentsErrorState extends MainStates {
  final String error;

  const GetPostCommentsErrorState(this.error);
}

///Sendinvite States
class SendInviteLoadingState extends MainStates {}

class SendInviteSuccessState extends MainStates {}

class SendInviteErrorState extends MainStates {
  final String error;

  const SendInviteErrorState(this.error);
}

///Sendinvite To Supervisor States
class SendInviteToSupervisorLoadingState extends MainStates {}

class SendInviteToSupervisorSuccessState extends MainStates {}

class SendInviteToSupervisorErrorState extends MainStates {
  final String error;

  const SendInviteToSupervisorErrorState(this.error);
}

///Sendinvite To Supervisor States
class SendInviteToEngineerLoadingState extends MainStates {}

class SendInviteToEngineerSuccessState extends MainStates {}

class SendInviteToEngineerErrorState extends MainStates {
  final String error;

  const SendInviteToEngineerErrorState(this.error);
}

///Sendinvite States
class SendJoinRequestLoadingState extends MainStates {}

class SendJoinRequestSuccessState extends MainStates {}

class SendJoinRequestErrorState extends MainStates {
  final String error;

  const SendJoinRequestErrorState(this.error);
}

///AddBio States
class AddBioLoadingState extends MainStates {}

class AddBioSuccessState extends MainStates {}

class AddBioErrorState extends MainStates {
  final String error;

  const AddBioErrorState(this.error);
}
