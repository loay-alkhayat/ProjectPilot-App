import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/student_entities/logout_entity.dart';
import 'package:projectpilot/student/domain/repositories/auth_repos/logout_repo.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';

class LogoutUseCase extends BaseUseCase<LogoutEntity, NoParameters> {
  final LogoutRepository logoutRepository;

  LogoutUseCase(this.logoutRepository);

  @override
  Future<Either<Failure, LogoutEntity>> call(NoParameters parameters) async {
    return await logoutRepository.logout(parameters);
  }
}
