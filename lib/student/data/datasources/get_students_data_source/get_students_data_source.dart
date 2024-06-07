import 'package:projectpilot/student/data/models/student_models/get_students_model.dart';
import 'package:projectpilot/student/domain/parameters/search_students_param.dart';

abstract class GetStudentsDataSource {
  Future<GetStudentsModel> getStudents(SearchStudentsParameters parameters);
}
