import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/invitation_entites/send_join_team_request_entity.dart';
import '../../parameters/send_join_request_param.dart';
import '../../repositories/invitation_repos/send_join_request_repo.dart';

class SendJoinRequestUseCase
    extends BaseUseCase<SendJoinRequestEntity, SendJoinRequestParameters> {
  final SendJoinRequestRepository sendJoinRequestRepository;

  SendJoinRequestUseCase(this.sendJoinRequestRepository);

  @override
  Future<Either<Failure, SendJoinRequestEntity>> call(
      SendJoinRequestParameters parameters) async {
    return await sendJoinRequestRepository.sendJoinRequest(parameters);
  }
}
