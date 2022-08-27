import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/models/usermodel.dart';
import 'package:twitter_spaces_flutter/widgets/twitteruseravatar.dart';
import 'package:twitter_spaces_flutter/widgets/twitteruserspeakingstatus.dart';

class TwitterUser extends StatefulWidget {

  UserModel userModel;
  TwitterUser({Key? key, required this.userModel}) : super(key: key);

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
          TwitterUserAvatar(user: widget.userModel),
          SizedBox(height: 5),
          Text(widget.userModel.name,
            style: TextStyle(
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
                style: TextStyle(
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
