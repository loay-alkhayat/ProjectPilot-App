import 'package:equatable/equatable.dart';

class CreateTaskEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final CreateTasktData data;

  const CreateTaskEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, message, data, pages];
}

class CreateTasktData extends Equatable {
  final int id;
  final String title;
  final String description;
  final int progress;

  CreateTasktData({
    required this.id,
    required this.title,
    required this.description,
    required this.progress,
  });

  @override
  List<Object?> get props => [id, title, description, progress];
}
