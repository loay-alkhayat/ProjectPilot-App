import 'package:dio/dio.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../../core/functions/functions.dart';
import '../../models/posts_models/get_posts_model.dart';
import 'get_posts_data_source.dart';

class GetPostsDataSourceImp implements GetPostsDataSource {
  @override
  Future<GetPostsModel> getPosts() async {
    try {
      final response = await DioServices().get(
        url: ApiUrls.getPosts,
      );
      logger.d(response.data);
      return GetPostsModel.fromJson(response.data);
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
