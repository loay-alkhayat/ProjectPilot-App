import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/team_entities/upload_proposal_entity.dart';
import '../../parameters/upload_pdf_parameters.dart';

abstract class UploadProposalRepository {
  Future<Either<Failure, UploadProposalEntity>> uploadProposal(
      UploadProposalParameters parameters);
}
