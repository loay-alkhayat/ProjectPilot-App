import 'package:dio/dio.dart';
import 'package:projectpilot/core/functions/functions.dart';

import '../../../../core/constants/apis_url.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/services/dio_services.dart';
import '../../models/team_models/get_proposals_model.dart';
import 'get_proposals_data_source.dart';

class GetProposalsDataSourceImp implements GetProposalsDataSource {
  @override
  Future<GetProposalsModel> getProposals() async {
    try {
      final response = await DioServices().get(
        url: ApiUrls.getProposals,
      );
      logger.d(
          "==================== Response Successfully ====================== \n ${response.data}");
      return GetProposalsModel.fromJson(response.data);
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
