import 'package:equatable/equatable.dart';

class GetPostCommentsEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final List<GetPostCommentsDataEntity> comments;

  const GetPostCommentsEntity(
      {required this.status,
      required this.message,
      required this.pages,
      required this.comments});

  @override
  List<Object?> get props => [status, message, pages, comments];
}

class GetPostCommentsDataEntity extends Equatable {
  final int commentID;
  final String comment;
  final String commentStudentName;
  final int commentStudentID;
  final String commentDate;

  const GetPostCommentsDataEntity(
      {required this.commentID,
      required this.comment,
      required this.commentStudentName,
      required this.commentDate,
      required this.commentStudentID});

  @override
  List<Object?> get props =>
      [commentID, comment, commentStudentName, commentStudentID, commentDate];
}
