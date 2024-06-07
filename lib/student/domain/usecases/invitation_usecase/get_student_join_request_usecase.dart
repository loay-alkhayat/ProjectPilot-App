import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/invitation_entites/get_student_join_request_entity.dart';
import '../../repositories/invitation_repos/get_student_join_request_repo.dart';

class GetStudentJoinRequestUseCase
    extends BaseUseCase<GetStudentJoinRequestEntity, NoParameters> {
  final GetStudentJoinRequestRepository getStudentJoinRequestRepository;

  GetStudentJoinRequestUseCase(this.getStudentJoinRequestRepository);

  @override
  Future<Either<Failure, GetStudentJoinRequestEntity>> call(parameters) async {
    return await getStudentJoinRequestRepository.getStudentJoinRequest();
  }
}
