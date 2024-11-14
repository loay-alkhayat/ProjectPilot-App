import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projectpilot/student/domain/entities/post_entities/add_comment_entity.dart';
import 'package:projectpilot/student/domain/entities/post_entities/get_post_comments_entity.dart';
import 'package:projectpilot/student/domain/parameters/posts_params/add_like_param.dart';
import 'package:projectpilot/student/presentation/layouts/posts_screens/post_actions_cubit/post_actions_state.dart';

import '../../../../../core/services/dio_services.dart';
import '../../../../../core/usecase/base_usecase.dart';
import '../../../../domain/entities/Post_entities/creat_Post_entity.dart';
import '../../../../domain/entities/post_entities/get_posts_entity.dart';
import '../../../../domain/parameters/posts_params/add_comment_param.dart';
import '../../../../domain/parameters/posts_params/create_post_param.dart';
import '../../../../domain/parameters/posts_params/delete_like_param.dart';
import '../../../../domain/parameters/posts_params/get_post_comments_parameters.dart';
import '../../../../domain/usecases/post_usecases/add_comment_usecase.dart';
import '../../../../domain/usecases/post_usecases/add_like_usecase.dart';
import '../../../../domain/usecases/post_usecases/create_post_usecase.dart';
import '../../../../domain/usecases/post_usecases/delete_like_usecase.dart';
import '../../../../domain/usecases/post_usecases/get_post_comments_usecase.dart';
import '../../../../domain/usecases/post_usecases/get_posts_usecase.dart';

class PostActionsCubit extends Cubit<PostActionsState> {
  final CreatePostUseCase createPostUseCase;
  final AddCommentUseCase addCommentUseCase;
  final GetPostCommentsUseCase getPostCommentsUseCase;
  final AddLikeUseCase addLikeUseCase;
  final DeleteLikeUseCase unLikeUseCase;
  final GetPostsUseCase getPostsUseCase;

  // متغيرات لكل عملية
  PostMethodResponsePostsScreensEntity? addLikeEntity;
  PostMethodResponsePostsScreensEntity? unLikeEntity;
  PostMethodResponsePostsScreensEntity? addCommentEntity;
  GetPostCommentsEntity? getPostCommentsEntity;

  bool addLikeSuccess = false;
  bool addCommentSuccess = false;
  bool getPostCommentsSuccess = false;
  static PostActionsCubit get(context) => BlocProvider.of(context);

  PostActionsCubit(
    this.createPostUseCase,
    this.unLikeUseCase,
    this.addLikeUseCase,
    this.addCommentUseCase,
    this.getPostCommentsUseCase,
    this.getPostsUseCase,
  ) : super(PostActionsInitialState());

  // إضافة لايك
  Future<void> addLike(AddLikeParameters parameters) async {
    addLikeSuccess = false;
    emit(AddLikeLoadingState());
    final result = await addLikeUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(AddLikeErrorState(l.message));
    }, (r) {
      addLikeSuccess = true;
      addLikeEntity = r;
      emit(AddLikeSuccessState());
    });
  }

  // إلغاء لايك
  Future<void> unLike(UnLikeParameters parameters) async {
    emit(UnLikeLoadingState());
    final result = await unLikeUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(UnLikeErrorState(l.message));
    }, (r) {
      unLikeEntity = r;
      emit(UnLikeSuccessState());
    });
  }

  // إضافة تعليق
  int postID = 0;

  Future<void> addComment(AddCommentParameters parameters) async {
    addCommentSuccess = false;
    emit(AddCommentLoadingState());
    final result = await addCommentUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(AddCommentErrorState(l.message));
    }, (r) {
      addCommentSuccess = true;
      addCommentEntity = r;
      emit(AddCommentSuccessState());
    });
  }

  // الحصول على تعليقات البوست
  Future<void> getPostComments(GetPostCommentsParameters parameters) async {
    getPostCommentsSuccess = false;
    emit(GetPostCommentsLoadingState());
    final result = await getPostCommentsUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);
      emit(GetPostCommentsErrorState(l.message));
    }, (r) {
      getPostCommentsSuccess = true;
      getPostCommentsEntity = r;
      emit(GetPostCommentsSuccessState());
    });
  }

  ///CreatePost
  CreatePostEntity? createPostEntity;

  Future<void> createPost(CreatePostParameters parameters) async {
    emit(CreatePostLoadingState());

    final result = await createPostUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(CreatePostErrorState(l.message));
    }, (r) {
      createPostEntity = r;
      emit(CreatePostSuccessState());
    });
  }

  ///GetPosts
  GetPostsEntity? getPostsEntity;
  bool getPostsSuccess = false;

  Future<void> getPosts(NoParameters parameters) async {
    emit(GetPostsLoadingState());

    final result = await getPostsUseCase(parameters);
    result.fold((l) {
      logger.e(l.message);

      emit(GetPostsErrorState(l.message));
    }, (r) {
      getPostsSuccess = true;
      getPostsEntity = r;
      emit(GetPostsSuccessState());
    });
  }
}
