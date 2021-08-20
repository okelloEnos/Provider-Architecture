import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/view_model/base_mode.dart';
import 'package:provider_architecture/enums/view_state.dart';
import 'package:provider_architecture/locator.dart';

class HomeModel extends BaseModel{
  Api _api = locator<Api>();
  List<Post> posts;

  Future getPosts(int userId) async{
    setState(viewState.busy);
    posts = await _api.getPostsForUser(userId);
    setState(viewState.idle);
  }
}