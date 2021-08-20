import 'package:flutter/material.dart';
import 'package:provider_architecture/core/models/post.dart';
import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/view_model/home_model.dart';
import 'package:provider_architecture/enums/view_state.dart';
import 'package:provider_architecture/ui/shared/app_colors.dart';
import 'package:provider_architecture/ui/shared/text_styles.dart';
import 'package:provider_architecture/ui/shared/ui_helpers.dart';
import 'package:provider_architecture/ui/views/base_view.dart';
import 'package:provider/provider.dart';
import 'package:provider_architecture/ui/widgets/postlist_item.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseView<HomeModel>(
      onModalReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
        body: model.state == viewState.busy ? Center(child: CircularProgressIndicator()) :
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            UIHelper.verticalSpaceLarge(),
            Padding(padding: EdgeInsets.only(left: 20),
            child: Text('Welcome ${Provider.of<User>(context).name}', style: headerStyle,),),
            Padding(padding: EdgeInsets.only(left: 20),
              child: Text('Here are all your Posts', style: subHeaderStyle,),),
            UIHelper.verticalSpaceSmall(),
            Expanded(child: getPostUi(model.posts))
          ],
        ),
      ),
    );
  }

  Widget getPostUi(List<Post> posts) => ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) => PostListItem(
        post: posts[index],
        onTap: (){
          Navigator.pushNamed(context, '/post', arguments: posts[index]);
        },
      ));
}
