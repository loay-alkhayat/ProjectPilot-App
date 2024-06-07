import '../../../domain/parameters/posts_params/add_comment_param.dart';
import '../../models/posts_models/add_comment_model.dart';

abstract class AddCommentDataSource {
  Future<AddCommentOrLikeModel> addComment(AddCommentParameters parameters);
}
