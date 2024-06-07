import '../../../../domain/parameters/upload_pdf_parameters.dart';
import '../../../models/team_models/upload_proposal_model.dart';

abstract class UploadProposalDataSource {
  Future<UploadProposalModel> uploadProposal(
      UploadProposalParameters parameters);
}
