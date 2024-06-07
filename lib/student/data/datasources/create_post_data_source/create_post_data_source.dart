import '../../../domain/parameters/posts_params/create_post_param.dart';
import '../../models/posts_models/create_post_model.dart';

abstract class CreatePostDataSource {
  Future<CreatePostModel> createPost(CreatePostParameters parameters);
}
