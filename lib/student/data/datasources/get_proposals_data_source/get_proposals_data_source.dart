import 'package:projectpilot/student/data/models/team_models/get_proposals_model.dart';

abstract class GetProposalsDataSource {
  Future<GetProposalsModel> getProposals();
}
