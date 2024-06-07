import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/entities/team_entities/get_team_members_entity.dart';
import 'package:projectpilot/student/domain/repositories/team_repos/get_team_members_repo.dart';

class GetTeamMembersUseCase
    extends BaseUseCase<GetTeamMembersEntity, NoParameters> {
  final GetTeamMembersRepository getTeamMembersRepository;

  GetTeamMembersUseCase(this.getTeamMembersRepository);

  @override
  Future<Either<Failure, GetTeamMembersEntity>> call(
      NoParameters parameters) async {
    return await getTeamMembersRepository.getTeamMembers(parameters);
  }
}
