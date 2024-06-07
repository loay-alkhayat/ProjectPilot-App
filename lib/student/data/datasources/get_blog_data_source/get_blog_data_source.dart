import '../../models/blogs_model/get_blogs_model.dart';

abstract class GetBlogsDataSource {
  Future<GetBlogsModel> getBlogs();
}
