import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/invitation_entites/send_invite_to_supervisor_entity.dart';
import '../../parameters/invitation_params/send_invite_to_supervisor_param.dart';
import '../../repositories/invitation_repos/send_invite_to_supervisor_repo.dart';

class SendInviteToSupervisorUseCase extends BaseUseCase<
    SendInviteToSuperVisorEntity, SendInviteToSuperVisorParameters> {
  final SendInviteToSupervisorRepository sendInviteToSuperVisorRepository;

  SendInviteToSupervisorUseCase(this.sendInviteToSuperVisorRepository);

  @override
  Future<Either<Failure, SendInviteToSuperVisorEntity>> call(
      SendInviteToSuperVisorParameters parameters) async {
    return await sendInviteToSuperVisorRepository
        .sendInviteToSuperVisor(parameters);
  }
}
