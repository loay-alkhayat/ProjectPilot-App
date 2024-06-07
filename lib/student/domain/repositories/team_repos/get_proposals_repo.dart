import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/team_entities/get_uni_proposals.dart';

abstract class GetProposalsRepository {
  Future<Either<Failure, GetProposalsEntity>> getProposals();
}
