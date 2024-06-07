import 'package:dartz/dartz.dart';
import 'package:projectpilot/core/usecase/base_usecase.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/student_entities/logout_entity.dart';

abstract class LogoutRepository {
  Future<Either<Failure, LogoutEntity>> logout(NoParameters parameters);
}
