import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/errors/failures.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/domain/entities/team_entities/get_team_members_entity.dart';

abstract class GetTeamMembersRepository {
  Future<Either<Failure, GetTeamMembersEntity>> getTeamMembers(
      NoParameters parameters);
}
