import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/entities/student_entities/add_bio_entitiy.dart';
import 'package:projectpilot/student/domain/parameters/add_bio_parameters.dart';

import '../../../../../../core/errors/failures.dart';

abstract class BioRepository {
  Future<Either<Failure, BioEntity>> addBio(BioParameters parameters);
}
