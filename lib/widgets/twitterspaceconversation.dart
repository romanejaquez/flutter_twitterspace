
import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/helpers/utils.dart';
import 'package:twitter_spaces_flutter/widgets/twitterspaceuser.dart';

class TwitterSpaceConversation extends StatelessWidget {
  const TwitterSpaceConversation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.80,
      crossAxisCount: 4,
      mainAxisSpacing: 40,
      children: List.generate(Utils.getUsers().length,
        (index) {
    
          var userModel = Utils.getUsers()[index];
          return TwitterUser(userModel: userModel);
        })
    );
  }
}
