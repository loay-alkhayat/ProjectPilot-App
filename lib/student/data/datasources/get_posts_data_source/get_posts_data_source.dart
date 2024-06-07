import '../../models/posts_models/get_posts_model.dart';

abstract class GetPostsDataSource {
  Future<GetPostsModel> getPosts();
}
