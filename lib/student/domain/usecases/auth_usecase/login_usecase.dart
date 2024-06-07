import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/student_entities/login_entity.dart';
import '../../parameters/login_parameters.dart';
import '../../repositories/auth_repos/auth_repository.dart';

class LoginUseCase extends BaseUseCase<StudentEntity, LoginParameters> {
  final AuthRepository authRepository;

  LoginUseCase(this.authRepository);

  @override
  Future<Either<Failure, StudentEntity>> call(
      LoginParameters parameters) async {
    return await authRepository.login(parameters);
  }
}
