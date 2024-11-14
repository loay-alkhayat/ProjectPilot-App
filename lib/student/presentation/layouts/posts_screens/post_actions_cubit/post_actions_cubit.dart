// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:projectpilot/student/domain/entities/post_entities/add_comment_entity.dart';
// import 'package:projectpilot/student/domain/entities/post_entities/get_post_comments_entity.dart';
// import 'package:projectpilot/student/domain/parameters/posts_params/add_like_param.dart';
// import 'package:projectpilot/student/presentation/layouts/posts_screens/post_actions_cubit/post_actions_state.dart';
//
// import '../../../../../core/services/dio_services.dart';
// import '../../../../domain/parameters/posts_params/add_comment_param.dart';
// import '../../../../domain/parameters/posts_params/delete_like_param.dart';
// import '../../../../domain/parameters/posts_params/get_post_comments_parameters.dart';
//
// class PostActionsCubit extends Cubit<PostActionsState> {
//   // متغيرات لكل عملية
//   PostMethodResponsePostsScreensEntity? addLikeEntity;
//   PostMethodResponsePostsScreensEntity? unLikeEntity;
//   PostMethodResponsePostsScreensEntity? addCommentEntity;
//   GetPostCommentsEntity? getPostCommentsEntity;
//
//   bool addLikeSuccess = false;
//   bool addCommentSuccess = false;
//   bool getPostCommentsSuccess = false;
//
//   PostActionsCubit() : super(PostActionsInitialState());
//
//   // إضافة لايك
//   Future<void> addLike(AddLikeParameters parameters) async {
//     addLikeSuccess = false;
//     emit(AddLikeLoadingState());
//     final result = await addLikeUseCase(parameters);
//     result.fold((l) {
//       logger.e(l.message);
//       emit(AddLikeErrorState(l.message));
//     }, (r) {
//       addLikeSuccess = true;
//       addLikeEntity = r;
//       emit(AddLikeSuccessState());
//     });
//   }
//
//   // إلغاء لايك
//   Future<void> unLike(UnLikeParameters parameters) async {
//     emit(UnLikeLoadingState());
//     final result = await unLikeUseCase(parameters);
//     result.fold((l) {
//       logger.e(l.message);
//       emit(UnLikeErrorState(l.message));
//     }, (r) {
//       unLikeEntity = r;
//       emit(UnLikeSuccessState());
//     });
//   }
//
//   // إضافة تعليق
//   Future<void> addComment(AddCommentParameters parameters) async {
//     addCommentSuccess = false;
//     emit(AddCommentLoadingState());
//     final result = await addCommentUseCase(parameters);
//     result.fold((l) {
//       logger.e(l.message);
//       emit(AddCommentErrorState(l.message));
//     }, (r) {
//       addCommentSuccess = true;
//       addCommentEntity = r;
//       emit(AddCommentSuccessState());
//     });
//   }
//
//   // الحصول على تعليقات البوست
//   Future<void> getPostComments(GetPostCommentsParameters parameters) async {
//     getPostCommentsSuccess = false;
//     emit(GetPostCommentsLoadingState());
//     final result = await getPostCommentsUseCase(parameters);
//     result.fold((l) {
//       logger.e(l.message);
//       emit(GetPostCommentsErrorState(l.message));
//     }, (r) {
//       getPostCommentsSuccess = true;
//       getPostCommentsEntity = r;
//       emit(GetPostCommentsSuccessState());
//     });
//   }
// }
