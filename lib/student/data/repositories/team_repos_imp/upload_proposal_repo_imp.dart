import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/repositories/team_repos/upload_proposal_repository.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/errors/failures.dart';
import '../../../../../core/services/dio_services.dart';
import '../../../domain/parameters/upload_pdf_parameters.dart';
import '../../datasources/team_data_sources/upload_proposal_data_source/upload_proposal_data_source.dart';
import '../../models/team_models/upload_proposal_model.dart';

class UploadProposalRepositoryImp implements UploadProposalRepository {
  final UploadProposalDataSource uploadProposalDataSource;

  UploadProposalRepositoryImp(this.uploadProposalDataSource);

  @override
  Future<Either<Failure, UploadProposalModel>> uploadProposal(
      UploadProposalParameters parameters) async {
    try {
      final result = await uploadProposalDataSource.uploadProposal(parameters);
      return Right(result);
    } catch (e) {
      logger.d(
          "================== in handleEither Exception ====================== \n ${e.runtimeType} \n ${e.toString()}");
      if (e is UnAuthorizedException) {
        return Left(UnAuthorizedFailure(e.message));
      }
      if (e is ServerException) {
        return Left(ServerFailure(e.errorMessageModel.statusMessage));
      }
      if (e is MethodNotAllowedExepction) {
        return Left(MethodNotAllowedFailure(e.message));
      }
      if (e is ForbiddenException) {
        return Left(ForbiddenFailure(e.message));
      }
      if (e is NotFoundException) {
        return Left(NotFoundFailure(e.message));
      }
      if (e is InternalServerErrorException) {
        return Left(InternalServerErrorFailure(e.message));
      }
      if (e is NoInternetConnectionException) {
        return Left(NoInternetConnectionFailure(e.message));
      }
      if (e is ParsingException) {
        return Left(ParsingFailure(e.message));
      }
      if (e is UnknownException) {
        return Left(UnknownFailure(e.message));
      }
      return Left(Failure(e.toString()));
    }
  }
}
