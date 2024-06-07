import 'package:projectpilot/core/usecase/base_usecase.dart';
import 'package:projectpilot/student/data/models/auth_models/logout_model.dart';

abstract class LogoutDataSource {
  Future<LogoutModel> logout(NoParameters parameters);
}
