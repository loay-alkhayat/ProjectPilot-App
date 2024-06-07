import 'package:equatable/equatable.dart';

class GetPostsEntity extends Equatable {
  final String status;
  final String message;
  final int pages;
  final List<GetPostsDataEntity> posts;

  const GetPostsEntity(
      {required this.status,
      required this.message,
      required this.pages,
      required this.posts});

  @override
  List<Object?> get props => [status, message, pages, posts];
}

class GetPostsDataEntity extends Equatable {
  final int postID;
  final String post;
  final String postStudentName;
  final bool isLiked;
  final int postLikesCount;
  final int postCommentsCount;

  const GetPostsDataEntity(
      {required this.postID,
      required this.post,
      required this.postLikesCount,
      required this.postCommentsCount,
      required this.isLiked,
      required this.postStudentName});

  @override
  List<Object?> get props => [
        postID,
        postLikesCount,
        isLiked,
        postCommentsCount,
        post,
        postStudentName
      ];
}
