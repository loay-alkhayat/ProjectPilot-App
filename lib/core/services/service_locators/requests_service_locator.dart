import 'package:get_it/get_it.dart';
import 'package:projectpilot/student/data/datasources/invitations_data_source/approve_student_join_request_data_source/approve_student_join_request_data_source.dart';
import 'package:projectpilot/student/data/datasources/invitations_data_source/approve_student_join_request_data_source/approve_student_join_request_data_source_imp.dart';
import 'package:projectpilot/student/data/datasources/invitations_data_source/approve_team_join_request_data_source/approve_team_join_request_data_source_imp.dart';
import 'package:projectpilot/student/data/datasources/invitations_data_source/get_student_join_request_data_source/get_student_join_request_data_source_imp.dart';
import 'package:projectpilot/student/data/datasources/invitations_data_source/reject_student_join_request_data_source/reject_student_join_request_data_source_imp.dart';
import 'package:projectpilot/student/data/repositories/invitation_repos_imp/approve_student_join_request_repo_imp.dart';
import 'package:projectpilot/student/data/repositories/invitation_repos_imp/approve_team_join_request_repo_imp.dart';
import 'package:projectpilot/student/data/repositories/invitation_repos_imp/get_student_join_request_repo_imp.dart';
import 'package:projectpilot/student/data/repositories/invitation_repos_imp/reject_student_join_request_repo_imp.dart';
import 'package:projectpilot/student/domain/repositories/invitation_repos/approve_student_join_request_repo.dart';
import 'package:projectpilot/student/domain/repositories/invitation_repos/approve_team_join_request_repository.dart';
import 'package:projectpilot/student/domain/usecases/invitation_usecase/approve_student_join_request_usecase.dart';
import 'package:projectpilot/student/domain/usecases/invitation_usecase/approve_team_join_request_usecase.dart';
import 'package:projectpilot/student/domain/usecases/invitation_usecase/get_team_join_requests_usecase.dart';
import 'package:projectpilot/student/domain/usecases/invitation_usecase/reject_team_join_request_usecase.dart';

import '../../../student/data/datasources/invitations_data_source/approve_team_join_request_data_source/approve_team_join_request_data_source.dart';
import '../../../student/data/datasources/invitations_data_source/get_student_join_request_data_source/get_student_join_request_data_source.dart';
import '../../../student/data/datasources/invitations_data_source/get_team_join_requests_data_source/get_team_join_requests_data_source.dart';
import '../../../student/data/datasources/invitations_data_source/get_team_join_requests_data_source/get_team_join_requests_data_source_imp.dart';
import '../../../student/data/datasources/invitations_data_source/reject_student_join_request_data_source/reject_student_join_request_data_source.dart';
import '../../../student/data/datasources/invitations_data_source/reject_team_join_request_data_source/reject_team_join_request_data_source.dart';
import '../../../student/data/datasources/invitations_data_source/reject_team_join_request_data_source/reject_team_join_request_data_source_imp.dart';
import '../../../student/data/datasources/invitations_data_source/send_invite_data_source/send_invite_data_source.dart';
import '../../../student/data/datasources/invitations_data_source/send_invite_data_source/send_invite_data_source_imp.dart';
import '../../../student/data/datasources/invitations_data_source/send_invite_to_engineer_data_source/send_invite_to_engineer_data_source.dart';
import '../../../student/data/datasources/invitations_data_source/send_invite_to_engineer_data_source/send_invite_to_engineer_data_source_imp.dart';
import '../../../student/data/datasources/invitations_data_source/send_invite_to_supervisor_data_source/send_invite_to_supervisor_data_source.dart';
import '../../../student/data/datasources/invitations_data_source/send_invite_to_supervisor_data_source/send_invite_to_supervisor_data_source_imp.dart';
import '../../../student/data/datasources/invitations_data_source/send_join_request_data_source/send_join_request_data_source.dart';
import '../../../student/data/datasources/invitations_data_source/send_join_request_data_source/send_join_request_data_source_imp.dart';
import '../../../student/data/repositories/invitation_repos_imp/get_team_join_requests_repo_imp.dart';
import '../../../student/data/repositories/invitation_repos_imp/reject_team_join_request_repo_imp.dart';
import '../../../student/data/repositories/invitation_repos_imp/send_invite_repository_imp.dart';
import '../../../student/data/repositories/invitation_repos_imp/send_invite_to_engineer_repo_imp.dart';
import '../../../student/data/repositories/invitation_repos_imp/send_invite_to_supervisor_repo_imp.dart';
import '../../../student/data/repositories/invitation_repos_imp/send_join_request_repo_imp.dart';
import '../../../student/domain/repositories/invitation_repos/get_student_join_request_repo.dart';
import '../../../student/domain/repositories/invitation_repos/get_team_join_requests.dart';
import '../../../student/domain/repositories/invitation_repos/reject_student_join_request_repo.dart';
import '../../../student/domain/repositories/invitation_repos/reject_team_join_request_repository.dart';
import '../../../student/domain/repositories/invitation_repos/send_invite_repository.dart';
import '../../../student/domain/repositories/invitation_repos/send_invite_to_engineer_repo.dart';
import '../../../student/domain/repositories/invitation_repos/send_invite_to_supervisor_repo.dart';
import '../../../student/domain/repositories/invitation_repos/send_join_request_repo.dart';
import '../../../student/domain/usecases/invitation_usecase/get_student_join_request_usecase.dart';
import '../../../student/domain/usecases/invitation_usecase/reject_student_join_request_usecase.dart';
import '../../../student/domain/usecases/invitation_usecase/send_invite_to_engineer_usecase.dart';
import '../../../student/domain/usecases/invitation_usecase/send_invite_to_supervisor_usecase.dart';
import '../../../student/domain/usecases/invitation_usecase/send_invite_usecase.dart';
import '../../../student/domain/usecases/invitation_usecase/send_join_request_usecase.dart';

final sl = GetIt.instance;

class RequestsServicesLocator {
  static RequestsServicesLocator? _instance;

  RequestsServicesLocator._();

  factory RequestsServicesLocator() =>
      _instance ??= RequestsServicesLocator._();

  static void init() {
    /// Use Cases

    sl.registerLazySingleton(() => SendInviteUseCase(sl()));
    sl.registerLazySingleton(() => SendInviteToSupervisorUseCase(sl()));
    sl.registerLazySingleton(() => SendInviteToEngineerUseCase(sl()));
    sl.registerLazySingleton(() => SendJoinRequestUseCase(sl()));
    sl.registerLazySingleton(() => GetTeamJoinRequestUseCase(sl()));
    sl.registerLazySingleton(() => RejectTeamJoinRequestUseCase(sl()));
    sl.registerLazySingleton(() => ApproveTeamJoinRequestUseCase(sl()));
    sl.registerLazySingleton(() => ApproveStudentJoinRequestUseCase(sl()));
    sl.registerLazySingleton(() => RejectStudentJoinRequestUseCase(sl()));
    sl.registerLazySingleton(() => GetStudentJoinRequestUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<SendInviteRepository>(
        () => SendInviteRepositoryImp(sl()));
    sl.registerLazySingleton<SendInviteToSupervisorRepository>(
        () => SendInviteToSupervisorRepositoryImp(sl()));

    sl.registerLazySingleton<SendInviteToEngineerRepository>(
        () => SendInviteToEngineerRepositoryImp(sl()));
    sl.registerLazySingleton<RejectTeamJoinRequestRepository>(
        () => RejectTeamJoinRequestRepositoryImp(sl()));

    sl.registerLazySingleton<SendJoinRequestRepository>(
        () => SendJoinRequestRepositoryImp(sl()));
    sl.registerLazySingleton<GetTeamJoinRequestRepository>(
        () => GetTeamJoinRequestRepositoryImp(sl()));
    sl.registerLazySingleton<ApproveTeamJoinRequestRepository>(
        () => ApproveTeamJoinRequestRepositoryImp(sl()));
    sl.registerLazySingleton<ApproveStudentJoinRequestRepository>(
        () => ApproveStudentJoinRequestRepositoryImp(sl()));
    sl.registerLazySingleton<RejectStudentJoinRequestRepository>(
        () => RejectStudentJoinRequestRepositoryImp(sl()));
    sl.registerLazySingleton<GetStudentJoinRequestRepository>(
        () => GetStudentJoinRequestRepositoryImp(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<SendInviteDataSource>(
        () => SendInviteDataSourceImp());
    sl.registerLazySingleton<SendInviteToSupervisorDataSource>(
        () => SendInviteToSupervisorDataSourceImp());
    sl.registerLazySingleton<SendInviteToEngineerDataSource>(
        () => SendInviteToEngineerDataSourceImp());
    sl.registerLazySingleton<SendJoinRequestDataSource>(
        () => SendJoinRequestDataSourceImp());
    sl.registerLazySingleton<GetTeamJoinRequestDataSource>(
        () => GetTeamJoinRequestDataSourceImp());
    sl.registerLazySingleton<RejectTeamJoinRequestDataSource>(
        () => RejectTeamJoinRequestDataSourceImp());
    sl.registerLazySingleton<ApproveTeamJoinRequestDataSource>(
        () => ApproveTeamJoinRequestDataSourceImp());
    sl.registerLazySingleton<ApproveStudentJoinRequestDataSource>(
        () => ApproveStudentJoinRequestDataSourceImp());
    sl.registerLazySingleton<RejectStudentJoinRequestDataSource>(
        () => RejectStudentJoinRequestDataSourceImp());
    sl.registerLazySingleton<GetStudentJoinRequestDataSource>(
        () => GetStudentJoinRequestDataSourceImp());
  }
}
