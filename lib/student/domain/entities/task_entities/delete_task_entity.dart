import 'package:equatable/equatable.dart';

class DeleteTaskEntity extends Equatable {
  final String status;
  final int message;

  const DeleteTaskEntity({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}
