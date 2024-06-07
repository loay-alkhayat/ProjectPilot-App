import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/student_entities/add_bio_entitiy.dart';
import 'package:projectpilot/student/domain/parameters/add_bio_parameters.dart';
import 'package:projectpilot/student/domain/repositories/student_repos/add_bio_repository.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';

class AddBioUseCase extends BaseUseCase<BioEntity, BioParameters> {
  final BioRepository bioRepository;

  AddBioUseCase(this.bioRepository);

  @override
  Future<Either<Failure, BioEntity>> call(BioParameters parameters) async {
    return await bioRepository.addBio(parameters);
  }
}
