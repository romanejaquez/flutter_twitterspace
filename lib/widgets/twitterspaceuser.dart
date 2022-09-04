import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/models/usermodel.dart';
import 'package:twitter_spaces_flutter/widgets/twitteruseravatar.dart';
import 'package:twitter_spaces_flutter/widgets/twitteruserspeakingstatus.dart';

class TwitterUser extends StatefulWidget {

  final UserModel userModel;
  const TwitterUser({Key? key, required this.userModel}) : super(key: key);

  @override
  State<TwitterUser> createState() => _TwitterUserState();
}

class _TwitterUserState extends State<TwitterUser> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(child: TwitterUserAvatar(user: widget.userModel)),
          const SizedBox(height: 5),
          Text(widget.userModel.name,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            )
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TwitterUserSpeakingStatus(userModel: widget.userModel),
              Text(widget.userModel.title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.grey,
                )
              )
            ],
          )
        ],
      ),
    );
  }
}
