import 'package:provider_architecture/core/models/comment.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/view_model/base_mode.dart';
import 'package:provider_architecture/enums/view_state.dart';
import 'package:provider_architecture/locator.dart';

class CommentsModel extends BaseModel{
  Api _api = locator<Api>();
  List<Comment> comments;

  Future getComments(int postId) async{
    setState(viewState.busy);
    comments = await _api.getCommentsForPost(postId);
    setState(viewState.idle);
  }
}