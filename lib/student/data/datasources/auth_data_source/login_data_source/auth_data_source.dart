import '../../../../domain/parameters/login_parameters.dart';
import '../../../models/auth_models/user_model.dart';

abstract class AuthDataSource {
  Future<StudentModel> login(LoginParameters parameters);
}
