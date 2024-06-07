import 'package:equatable/equatable.dart';

class DeleteSubTaskEntity extends Equatable {
  final String status;
  final int message;

  const DeleteSubTaskEntity({required this.status, required this.message});

  @override
  List<Object?> get props => [status, message];
}
