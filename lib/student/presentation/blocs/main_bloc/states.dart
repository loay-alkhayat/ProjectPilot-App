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
class GetTeamMembersLoadingState extends MainStates {}

class GetTeamMembersSuccessState extends MainStates {}

class GetTeamMembersErrorState extends MainStates {
  final String error;

  const GetTeamMembersErrorState(this.error);
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

///AddBio States
class AddBioLoadingState extends MainStates {}

class AddBioSuccessState extends MainStates {}

class AddBioErrorState extends MainStates {
  final String error;

  const AddBioErrorState(this.error);
}

///SendMessage States
class SendMessageLoadingState extends MainStates {}

class SendMessageSuccessState extends MainStates {}

class SendMessageErrorState extends MainStates {
  final String error;

  const SendMessageErrorState(this.error);
}

///getMessages States
class GetMessagesLoadingState extends MainStates {}

class GetMessagesSuccessState extends MainStates {}

class GetAllMessagesSuccessState extends MainStates {}

class GetMessagesErrorState extends MainStates {
  final String error;

  const GetMessagesErrorState(this.error);
}
