import 'package:equatable/equatable.dart';

class LogoutEntity extends Equatable {
  final String status;
  final String message;

  const LogoutEntity({
    required this.status,
    required this.message,
  });

  @override
  List<Object?> get props => [status, message];
}
