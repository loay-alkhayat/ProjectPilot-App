import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/student_entities/login_entity.dart';
import 'package:projectpilot/student/domain/parameters/login_parameters.dart';

import '../../../../../../core/errors/failures.dart';

abstract class AuthRepository {
  Future<Either<Failure, StudentEntity>> login(LoginParameters parameters);
}
