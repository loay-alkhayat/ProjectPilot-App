import 'package:projectpilot/student/domain/parameters/student_params/get_student_by_id_param.dart';

import '../../models/student_models/get_student_by_id_model.dart';

abstract class GetStudentByIdDataSource {
  Future<GetStudentByIdModel> getStudentById(
      GetStudentByIdParameters parameters);
}
