import '../../models/student_models/get_student_info_model.dart';

abstract class GetStudentInfoDataSource {
  Future<GetStudentInfoModel> getStudentInfo();
}
