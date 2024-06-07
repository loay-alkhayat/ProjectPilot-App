import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../entities/invitation_entites/get_student_join_request_entity.dart';

abstract class GetStudentJoinRequestRepository {
  Future<Either<Failure, GetStudentJoinRequestEntity>> getStudentJoinRequest();
}
