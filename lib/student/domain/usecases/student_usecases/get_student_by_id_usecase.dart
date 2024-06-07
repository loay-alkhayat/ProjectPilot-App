import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/parameters/student_params/get_student_by_id_param.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/student_entities/get_student_by_id_entity.dart';
import '../../repositories/student_repos/get_student_by_id_repo.dart';

class GetStudentByIdUseCase
    extends BaseUseCase<GetStudentByIdEntity, GetStudentByIdParameters> {
  final GetStudentByIdRepository getStudentByIdRepository;

  GetStudentByIdUseCase(this.getStudentByIdRepository);

  @override
  Future<Either<Failure, GetStudentByIdEntity>> call(parameters) async {
    return await getStudentByIdRepository.getStudentById(parameters);
  }
}
