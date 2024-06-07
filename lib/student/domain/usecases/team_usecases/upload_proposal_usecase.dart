import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/team_entities/upload_proposal_entity.dart';
import '../../parameters/upload_pdf_parameters.dart';
import '../../repositories/team_repos/upload_proposal_repository.dart';

class UploadProposalUseCase
    extends BaseUseCase<UploadProposalEntity, UploadProposalParameters> {
  final UploadProposalRepository uploadProposalRepository;

  UploadProposalUseCase(this.uploadProposalRepository);

  @override
  Future<Either<Failure, UploadProposalEntity>> call(
      UploadProposalParameters parameters) async {
    return await uploadProposalRepository.uploadProposal(parameters);
  }
}
