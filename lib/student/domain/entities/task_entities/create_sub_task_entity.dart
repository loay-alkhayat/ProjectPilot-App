import 'package:equatable/equatable.dart';

class CreateSubTaskEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final CreateSubTasktData data;

  const CreateSubTaskEntity(
      {required this.status,
      required this.message,
      required this.data,
      required this.pages});

  @override
  List<Object?> get props => [status, message, data, pages];
}

class CreateSubTasktData extends Equatable {
  final int id;
  final String title;
  final String description;
  final int completed;

  CreateSubTasktData({
    required this.id,
    required this.title,
    required this.description,
    required this.completed,
  });

  @override
  List<Object?> get props => [id, title, description, completed];
}
