import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/team_entities/get_uni_proposals.dart';
import 'package:projectpilot/student/domain/repositories/team_repos/get_proposals_repo.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';

class GetProposalsUseCase
    extends BaseUseCase<GetProposalsEntity, NoParameters> {
  final GetProposalsRepository getProposalsRepository;

  GetProposalsUseCase(this.getProposalsRepository);

  @override
  Future<Either<Failure, GetProposalsEntity>> call(parameters) async {
    return await getProposalsRepository.getProposals();
  }
}
