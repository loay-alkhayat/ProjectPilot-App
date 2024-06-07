import 'package:get_it/get_it.dart';
import 'package:projectpilot/student/data/datasources/team_data_sources/upload_proposal_data_source/upload_proposal_data_source.dart';
import 'package:projectpilot/student/data/datasources/team_data_sources/upload_proposal_data_source/upload_proposal_data_source_imp.dart';
import 'package:projectpilot/student/domain/repositories/team_repos/upload_proposal_repository.dart';
import 'package:projectpilot/student/domain/usecases/team_usecases/upload_proposal_usecase.dart';

import '../../../student/data/datasources/team_data_sources/creat_team_data_source/creat_team_data_source.dart';
import '../../../student/data/datasources/team_data_sources/creat_team_data_source/creat_team_data_source_imp.dart';
import '../../../student/data/datasources/team_data_sources/get_team_by_id_data_source/get_team_by_id_data_source.dart';
import '../../../student/data/datasources/team_data_sources/get_team_by_id_data_source/get_team_by_id_data_source_imp.dart';
import '../../../student/data/datasources/team_data_sources/get_team_members_data_source/get_team_members_data_source.dart';
import '../../../student/data/datasources/team_data_sources/get_team_members_data_source/get_team_members_data_source_imp.dart';
import '../../../student/data/datasources/team_data_sources/get_teams_data_source/get_teams_data_source.dart';
import '../../../student/data/datasources/team_data_sources/get_teams_data_source/get_teams_data_source_imp.dart';
import '../../../student/data/repositories/create_team_repo_imp.dart';
import '../../../student/data/repositories/team_repos_imp/get_team_by_id_repo_imp.dart';
import '../../../student/data/repositories/team_repos_imp/get_team_members_repo_imp.dart';
import '../../../student/data/repositories/team_repos_imp/get_teams_repo_imp.dart';
import '../../../student/data/repositories/team_repos_imp/upload_proposal_repo_imp.dart';
import '../../../student/domain/repositories/team_repos/create_team_repository.dart';
import '../../../student/domain/repositories/team_repos/get_team_by_id_repo.dart';
import '../../../student/domain/repositories/team_repos/get_team_members_repo.dart';
import '../../../student/domain/repositories/team_repos/get_teams_repo.dart';
import '../../../student/domain/usecases/team_usecases/create_team_usecase.dart';
import '../../../student/domain/usecases/team_usecases/get_team_by_id_usecase.dart';
import '../../../student/domain/usecases/team_usecases/get_team_members_usecase.dart';
import '../../../student/domain/usecases/team_usecases/get_teams_usecase.dart';

final sl = GetIt.instance;

class TeamsServicesLocator {
  static TeamsServicesLocator? _instance;

  TeamsServicesLocator._();

  factory TeamsServicesLocator() => _instance ??= TeamsServicesLocator._();

  static void init() {
    /// Use Cases

    sl.registerLazySingleton(() => CreateTeamUseCase(sl()));
    sl.registerLazySingleton(() => GetTeamByIdUseCase(sl()));
    sl.registerLazySingleton(() => GetTeamsUseCase(sl()));
    sl.registerLazySingleton(() => GetTeamMembersUseCase((sl())));
    sl.registerLazySingleton(() => UploadProposalUseCase((sl())));

    /// Repository
    sl.registerLazySingleton<CreatTeamRepository>(
        () => CreateTeamRepositoryImp(sl()));
    sl.registerLazySingleton<GetTeamByIdRepository>(
        () => GetTeamByIdRepositoryImp(sl()));
    sl.registerLazySingleton<GetTeamsRepository>(
        () => GetTeamsRepositoryImp(sl()));
    sl.registerLazySingleton<GetTeamMembersRepository>(
        () => GetTeamMembersRepositoryImp(sl()));
    sl.registerLazySingleton<UploadProposalRepository>(
        () => UploadProposalRepositoryImp(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<CreateTeamDataSource>(
        () => CreatTeamDataSourceImp());

    sl.registerLazySingleton<GetTeamByIdDataSource>(
        () => GetTeamByIdDataSourceImp());
    sl.registerLazySingleton<GetTeamsDataSource>(() => GetTeamsDataSourceImp());
    sl.registerLazySingleton<GetTeamMembersDataSource>(
        () => GetTeamMembersDataSourceImp());
    sl.registerLazySingleton<UploadProposalDataSource>(
        () => UploadProposalDataSourceImp());
  }
}
