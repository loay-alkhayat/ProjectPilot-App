import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecase/base_usecase.dart';
import '../../entities/team_entities/get_team_by_id_entity.dart';
import '../../parameters/get_team_by_id_param.dart';
import '../../repositories/team_repos/get_team_by_id_repo.dart';

class GetTeamByIdUseCase
    extends BaseUseCase<GetTeamByIdEntity, GetTeamByIdParameters> {
  final GetTeamByIdRepository getTeamByIdRepository;

  GetTeamByIdUseCase(this.getTeamByIdRepository);

  @override
  Future<Either<Failure, GetTeamByIdEntity>> call(
      GetTeamByIdParameters parameters) async {
    return await getTeamByIdRepository.getTeamById(parameters);
  }
}
