import 'package:projectpilot/student/domain/parameters/posts_params/add_like_param.dart';

import '../../../models/posts_models/add_comment_model.dart';

abstract class AddPostLikeDataSource {
  Future<AddCommentOrLikeModel> addLike(AddLikeParameters parameters);
}
