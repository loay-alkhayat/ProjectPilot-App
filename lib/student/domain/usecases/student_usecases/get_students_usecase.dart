import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/student_entities/get_all_students_entity.dart';
import 'package:projectpilot/student/domain/parameters/search_students_param.dart';
import 'package:projectpilot/student/domain/repositories/student_repos/get_students_repo.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';

class GetStudentsUseCase
    extends BaseUseCase<GetStudentsEntity, SearchStudentsParameters> {
  final GetStudentsRepository getStudentsRepository;

  GetStudentsUseCase(this.getStudentsRepository);

  @override
  Future<Either<Failure, GetStudentsEntity>> call(parameters) async {
    return await getStudentsRepository.getStudents(parameters);
  }
}
