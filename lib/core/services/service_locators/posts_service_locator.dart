import 'package:get_it/get_it.dart';
import 'package:projectpilot/student/data/datasources/add_comment_data_source/add_comment_data_source.dart';
import 'package:projectpilot/student/data/datasources/add_comment_data_source/add_comment_data_source_imp.dart';
import 'package:projectpilot/student/data/datasources/get_posts_data_source/get_posts_data_source.dart';
import 'package:projectpilot/student/data/datasources/get_posts_data_source/get_posts_data_source_imp.dart';
import 'package:projectpilot/student/data/datasources/posts_data_soucre/add_post_like_data_source/add_post_like_data_source.dart';
import 'package:projectpilot/student/data/datasources/posts_data_soucre/add_post_like_data_source/add_post_like_data_source_imp.dart';
import 'package:projectpilot/student/data/repositories/post_repos_imp/add_comment_repo_imp.dart';
import 'package:projectpilot/student/data/repositories/post_repos_imp/add_like_repo_imp.dart';
import 'package:projectpilot/student/data/repositories/post_repos_imp/get_posts_repo_imp.dart';
import 'package:projectpilot/student/domain/repositories/post_repos/add_comment_repo.dart';
import 'package:projectpilot/student/domain/repositories/post_repos/add_like_repo.dart';
import 'package:projectpilot/student/domain/repositories/post_repos/get_posts_repo.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/add_comment_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/add_like_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/delete_like_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/get_post_comments_usecase.dart';
import 'package:projectpilot/student/domain/usecases/post_usecases/get_posts_usecase.dart';

import '../../../student/data/datasources/create_post_data_source/create_post_data_source.dart';
import '../../../student/data/datasources/create_post_data_source/create_post_data_source_imp.dart';
import '../../../student/data/datasources/posts_data_soucre/delete_post_like_data_source/delete_post_like_data_source.dart';
import '../../../student/data/datasources/posts_data_soucre/delete_post_like_data_source/delete_post_like_data_source_imp.dart';
import '../../../student/data/datasources/posts_data_soucre/get_post_comments_data_source/get_post_comments_data_source.dart';
import '../../../student/data/datasources/posts_data_soucre/get_post_comments_data_source/get_post_comments_data_source_imp.dart';
import '../../../student/data/repositories/post_repos_imp/create_post_repo_imp.dart';
import '../../../student/data/repositories/post_repos_imp/delete_like_repo_imp.dart';
import '../../../student/data/repositories/post_repos_imp/get_post_comments_repo_imp.dart';
import '../../../student/domain/repositories/post_repos/create_post_repo.dart';
import '../../../student/domain/repositories/post_repos/delete_like_repo.dart';
import '../../../student/domain/repositories/post_repos/get_post_comments_repo.dart';
import '../../../student/domain/usecases/post_usecases/create_post_usecase.dart';
import '../../../student/presentation/layouts/posts_screens/post_actions_cubit/post_actions_cubit.dart';

final sl = GetIt.instance;

class PostsServicesLocator {
  static PostsServicesLocator? _instance;

  PostsServicesLocator._();

  factory PostsServicesLocator() => _instance ??= PostsServicesLocator._();

  static void init() {
    sl.registerFactory(() => PostActionsCubit(
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
          sl(),
        ));

    /// Use Cases
    sl.registerLazySingleton(() => CreatePostUseCase(sl()));
    sl.registerLazySingleton(() => GetPostsUseCase(sl()));
    sl.registerLazySingleton(() => AddCommentUseCase(sl()));
    sl.registerLazySingleton(() => GetPostCommentsUseCase(sl()));
    sl.registerLazySingleton(() => AddLikeUseCase(sl()));
    sl.registerLazySingleton(() => DeleteLikeUseCase(sl()));

    /// Repository
    sl.registerLazySingleton<CreatePostRepository>(
        () => CreatePostRepositoryImp(sl()));
    sl.registerLazySingleton<GetPostsRepository>(
        () => GetPostsRepositoryImp(sl()));
    sl.registerLazySingleton<AddCommentRepository>(
        () => AddCommentRepositoryImp(sl()));
    sl.registerLazySingleton<GetPostCommentsRepository>(
        () => GetPostCommentsRepositoryImp(sl()));
    sl.registerLazySingleton<AddLikeRepository>(
        () => AddLikeRepositoryImp(sl()));
    sl.registerLazySingleton<DeleteLikeRepository>(
        () => DeleteLikeRepositoryImp(sl()));

    /// DATA SOURCE
    sl.registerLazySingleton<CreatePostDataSource>(
        () => CreatePostDataSourceImp());
    sl.registerLazySingleton<GetPostsDataSource>(() => GetPostsDataSourceImp());
    sl.registerLazySingleton<AddCommentDataSource>(
        () => AddCommentDataSourceImp());
    sl.registerLazySingleton<GetPostCommentsDataSource>(
        () => GetPostCommentsDataSourceImp());
    sl.registerLazySingleton<AddPostLikeDataSource>(
        () => AddPostLikeDataSourceImp());
    sl.registerLazySingleton<DeletePostLikeDataSource>(
        () => DeletePostLikeDataSourceImp());
  }
}
