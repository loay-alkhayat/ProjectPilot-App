import '../../../../domain/parameters/get_team_by_id_param.dart';
import '../../../models/team_models/get_team_by_id_model.dart';

abstract class GetTeamByIdDataSource {
  Future<GetTeamByIdModel> getTeamById(GetTeamByIdParameters parameters);
}
