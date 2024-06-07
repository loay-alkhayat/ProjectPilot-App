import 'package:dartz/dartz.dart';
import 'package:projectpilot/student/domain/repositories/invitation_repos/send_invite_repository.dart';

import '../../../../../../core/errors/failures.dart';
import '../../../../../../core/usecase/base_usecase.dart';
import '../../entities/invitation_entites/send_invite_from_leader_entity.dart';
import '../../parameters/invitation_params/send_invite_to_student_parameters.dart';

class SendInviteUseCase
    extends BaseUseCase<SendInviteEntity, SendInviteParameters> {
  final SendInviteRepository sendInviteRepository;

  SendInviteUseCase(this.sendInviteRepository);

  @override
  Future<Either<Failure, SendInviteEntity>> call(
      SendInviteParameters parameters) async {
    return await sendInviteRepository.sendInvite(parameters);
  }
}
