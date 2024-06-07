import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/invitation_entites/send_invite_to_engineer_entity.dart';
import '../../parameters/invitation_params/send_invite_to_engineer_param.dart';
import '../../repositories/invitation_repos/send_invite_to_engineer_repo.dart';

class SendInviteToEngineerUseCase extends BaseUseCase<
    SendInviteToEngineerEntity, SendInviteToEngineerParameters> {
  final SendInviteToEngineerRepository sendInviteToEngineerRepository;

  SendInviteToEngineerUseCase(this.sendInviteToEngineerRepository);

  @override
  Future<Either<Failure, SendInviteToEngineerEntity>> call(
      SendInviteToEngineerParameters parameters) async {
    return await sendInviteToEngineerRepository
        .sendInviteToEngineer(parameters);
  }
}
