import 'package:equatable/equatable.dart';

class CompleteSubTaskEntity extends Equatable {
  final int id;
  final int completed;

  const CompleteSubTaskEntity({required this.id, required this.completed});

  @override
  List<Object?> get props => [completed, id];
}
