import 'package:projectpilot/student/data/models/student_models/bio_model.dart';
import 'package:projectpilot/student/domain/parameters/add_bio_parameters.dart';

abstract class BioDataSource {
  Future<BioModel> addBio(BioParameters parameters);
}
