import 'package:dio/dio.dart';
import 'package:projectpilot/student/data/datasources/team_data_sources/upload_proposal_data_source/upload_proposal_data_source.dart';

import '../../../../../../core/constants/apis_url.dart';
import '../../../../../../core/errors/exceptions.dart';
import '../../../../../../core/services/dio_services.dart';
import '../../../../../core/functions/functions.dart';
import '../../../../domain/parameters/upload_pdf_parameters.dart';
import '../../../models/team_models/upload_proposal_model.dart';

class UploadProposalDataSourceImp implements UploadProposalDataSource {
  @override
  Future<UploadProposalModel> uploadProposal(
      UploadProposalParameters parameters) async {
    try {
      final formData = FormData.fromMap(parameters.toJson());

      final response = await DioServices().postFile(
        url: ApiUrls.uploadProposal,
        data: formData,
      );
      logger.d(response.data);
      return UploadProposalModel.fromJson(response.data);
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
