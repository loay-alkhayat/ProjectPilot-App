import 'package:dio/dio.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../../core/functions/functions.dart';
import '../../models/blogs_model/get_blogs_model.dart';
import 'get_blog_data_source.dart';

class GetBlogsDataSourceImp implements GetBlogsDataSource {
  @override
  Future<GetBlogsModel> getBlogs() async {
    try {
      final response = await DioServices().get(
        url: ApiUrls.getBlogs,
      );
      logger.d(response.data);
      return GetBlogsModel.fromJson(response.data);
    } on DioException catch (error) {
      logger.d(
          "==================== Dio Exception ====================== \n ${error.toString()} \n ${error.response?.data}");
      throw Functions.exceptionsType(error);
    } catch (error) {
      logger.d(
          "================== Exception ======================  \n ${error.toString()} \n ${error.runtimeType}");
      if (error is TypeError) {
        throw ParsingException(parsingMessage: error.toString());
      }
      rethrow;
    }
  }
}
