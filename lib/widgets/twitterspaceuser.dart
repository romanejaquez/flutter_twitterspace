import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/models/usermodel.dart';
import 'package:twitter_spaces_flutter/widgets/twitteruseravatar.dart';
import 'package:twitter_spaces_flutter/widgets/twitteruserspeakingstatus.dart';

class TwitterUser extends StatelessWidget {

  final UserModel userModel;
  const TwitterUser({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        TwitterUserAvatar(user: userModel),
        const SizedBox(height: 5),
        Text(userModel.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TwitterUserSpeakingStatus(userModel: userModel),
            Text(userModel.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.grey,
              )
            )
          ],
        )
      ],
    );
  }
}
