import 'package:projectpilot/student/domain/parameters/posts_params/delete_like_param.dart';

import '../../../models/posts_models/add_comment_model.dart';

abstract class DeletePostLikeDataSource {
  Future<AddCommentOrLikeModel> deleteLike(UnLikeParameters parameters);
}
