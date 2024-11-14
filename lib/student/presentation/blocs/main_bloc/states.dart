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
