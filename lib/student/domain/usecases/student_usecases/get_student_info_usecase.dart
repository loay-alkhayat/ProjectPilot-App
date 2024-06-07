import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/student_entities/get_student_profile_by_token_entity.dart';
import '../../repositories/student_repos/get_student_info_repo.dart';

class GetStudentInfoUseCase
    extends BaseUseCase<GetStudentInfoEntity, NoParameters> {
  final GetStudentInfoRepository getStudentInfoRepository;

  GetStudentInfoUseCase(this.getStudentInfoRepository);

  @override
  Future<Either<Failure, GetStudentInfoEntity>> call(parameters) async {
    return await getStudentInfoRepository.getStudentInfo();
  }
}
