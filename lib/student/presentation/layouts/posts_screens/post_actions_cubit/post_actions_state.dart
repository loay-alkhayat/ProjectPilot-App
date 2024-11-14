abstract class PostActionsState {}

class PostActionsInitialState extends PostActionsState {}

class AddLikeLoadingState extends PostActionsState {}

class AddLikeSuccessState extends PostActionsState {}

class AddLikeErrorState extends PostActionsState {
  final String message;
  AddLikeErrorState(this.message);
}

class UnLikeLoadingState extends PostActionsState {}

class UnLikeSuccessState extends PostActionsState {}

class UnLikeErrorState extends PostActionsState {
  final String message;
  UnLikeErrorState(this.message);
}

class AddCommentLoadingState extends PostActionsState {}

class AddCommentSuccessState extends PostActionsState {}

class AddCommentErrorState extends PostActionsState {
  final String message;
  AddCommentErrorState(this.message);
}

class GetPostCommentsLoadingState extends PostActionsState {}

class GetPostCommentsSuccessState extends PostActionsState {}

class GetPostCommentsErrorState extends PostActionsState {
  final String message;
  GetPostCommentsErrorState(this.message);
}

///CreatePost States
class CreatePostLoadingState extends PostActionsState {}

class CreatePostSuccessState extends PostActionsState {}

class CreatePostErrorState extends PostActionsState {
  final String error;

  CreatePostErrorState(this.error);
}

///GetPosts States
class GetPostsLoadingState extends PostActionsState {}

class GetPostsSuccessState extends PostActionsState {}

class GetPostsErrorState extends PostActionsState {
  final String error;

  GetPostsErrorState(this.error);
}
