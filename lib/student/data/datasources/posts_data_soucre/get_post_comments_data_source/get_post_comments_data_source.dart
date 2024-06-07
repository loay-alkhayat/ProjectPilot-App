import 'package:projectpilot/student/domain/parameters/posts_params/get_post_comments_parameters.dart';

import '../../../models/posts_models/get_post_comments_model.dart';

abstract class GetPostCommentsDataSource {
  Future<GetPostCommentsModel> getPostComments(
      GetPostCommentsParameters parameters);
}
