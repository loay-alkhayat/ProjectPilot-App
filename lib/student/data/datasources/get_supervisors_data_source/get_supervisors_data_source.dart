import 'package:projectpilot/student/data/models/supervisors_models/supervisor_model.dart';
import 'package:projectpilot/student/domain/parameters/search_supervisors_param.dart';

abstract class SupervisorDataSource {
  Future<SupervisorModel> getSupervisors(
      SearchSupervisorsParameters parameters);
}
