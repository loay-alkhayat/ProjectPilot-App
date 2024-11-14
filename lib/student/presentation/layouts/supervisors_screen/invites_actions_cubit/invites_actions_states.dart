abstract class InviteActionsState {}

class InviteActionsInitialState extends InviteActionsState {}

class SendInviteLoadingState extends InviteActionsState {}

class SendInviteSuccessState extends InviteActionsState {}

class SendInviteErrorState extends InviteActionsState {
  final String error;
  SendInviteErrorState(this.error);
}

class SendInviteToSupervisorLoadingState extends InviteActionsState {}

class SendInviteToSupervisorSuccessState extends InviteActionsState {}

class SendInviteToSupervisorErrorState extends InviteActionsState {
  final String error;
  SendInviteToSupervisorErrorState(this.error);
}

class SendInviteToEngineerLoadingState extends InviteActionsState {}

class SendInviteToEngineerSuccessState extends InviteActionsState {}

class SendInviteToEngineerErrorState extends InviteActionsState {
  final String error;
  SendInviteToEngineerErrorState(this.error);
}

class SendJoinRequestLoadingState extends InviteActionsState {}

class SendJoinRequestSuccessState extends InviteActionsState {}

class SendJoinRequestErrorState extends InviteActionsState {
  final String error;
  SendJoinRequestErrorState(this.error);
}

/////GetTeamsJoinRequests States
class GetTeamJoinRequestsLoadingState extends InviteActionsState {}

class GetTeamJoinRequestsSuccessState extends InviteActionsState {}

class GetTeamJoinRequestsErrorState extends InviteActionsState {
  final String error;

  GetTeamJoinRequestsErrorState(this.error);
}

/////RejectTeamJoinRequests States
class RejectTeamJoinRequestLoadingState extends InviteActionsState {}

class RejectTeamJoinRequestSuccessState extends InviteActionsState {}

class RejectTeamJoinRequestErrorState extends InviteActionsState {
  final String error;

  RejectTeamJoinRequestErrorState(this.error);
}

/////ApproveTeamJoinRequests States
class ApproveTeamJoinRequestLoadingState extends InviteActionsState {}

class ApproveTeamJoinRequestSuccessState extends InviteActionsState {}

class ApproveTeamJoinRequestErrorState extends InviteActionsState {
  final String error;

  ApproveTeamJoinRequestErrorState(this.error);
} /////ApproveStudentJoinRequests States

class ApproveStudentJoinRequestLoadingState extends InviteActionsState {}

class ApproveStudentJoinRequestSuccessState extends InviteActionsState {}

class ApproveStudentJoinRequestErrorState extends InviteActionsState {
  final String error;

  ApproveStudentJoinRequestErrorState(this.error);
}

/////GetStudentJoinRequests States
class GetStudentJoinRequestsLoadingState extends InviteActionsState {}

class GetStudentJoinRequestsSuccessState extends InviteActionsState {}

class GetStudentJoinRequestsErrorState extends InviteActionsState {
  final String error;

  GetStudentJoinRequestsErrorState(this.error);
}

/////RejectStudentJoinRequests States
class RejectStudentJoinRequestLoadingState extends InviteActionsState {}

class RejectStudentJoinRequestSuccessState extends InviteActionsState {}

class RejectStudentJoinRequestErrorState extends InviteActionsState {
  final String error;

  RejectStudentJoinRequestErrorState(this.error);
}

/////GetTeams States
class GetTeamsLoadingState extends InviteActionsState {}

class GetTeamsSuccessState extends InviteActionsState {}

class GetTeamsErrorState extends InviteActionsState {
  final String error;

  GetTeamsErrorState(this.error);
}

///Engineers States
class GetEngineersLoadingState extends InviteActionsState {}

class GetEngineersSuccessState extends InviteActionsState {}

class GetEngineersErrorState extends InviteActionsState {
  final String error;

  GetEngineersErrorState(this.error);
}

///SuperVisors States
class GetSupervisorsLoadingState extends InviteActionsState {}

class GetSupervisorsSuccessState extends InviteActionsState {}

class GetSupervisorsErrorState extends InviteActionsState {
  final String error;

  GetSupervisorsErrorState(this.error);
}

///GetStudents States
class GetStudentsLoadingState extends InviteActionsState {}

class GetStudentsSuccessState extends InviteActionsState {}

class GetStudentsErrorState extends InviteActionsState {
  final String error;

  GetStudentsErrorState(this.error);
}

/////GetTeamsByID States
class GetTeamByIdLoadingState extends InviteActionsState {}

class GetTeamByIdSuccessState extends InviteActionsState {}

class GetTeamByIdErrorState extends InviteActionsState {
  final String error;

  GetTeamByIdErrorState(this.error);
}

/////GetStudentByID States
class GetStudentByIdLoadingState extends InviteActionsState {}

class GetStudentByIdSuccessState extends InviteActionsState {}

class GetStudentByIdErrorState extends InviteActionsState {
  final String error;

  GetStudentByIdErrorState(this.error);
}
