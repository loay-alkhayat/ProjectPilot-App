import 'package:projectpilot/student/data/models/supervisors_models/engineer_model.dart';
import 'package:projectpilot/student/domain/parameters/search_engineers_param.dart';

abstract class EngineerDataSource {
  Future<EngineerModel> getEngineers(SearchEngineersParameters parameters);
}
