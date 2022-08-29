
import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/helpers/twitter_space_icons.dart';
import 'package:twitter_spaces_flutter/helpers/twittercolors.dart';
import 'package:twitter_spaces_flutter/models/usermodel.dart';
import 'package:twitter_spaces_flutter/widgets/twitterspacesoundwaves.dart';

class TwitterUserSpeakingStatus extends StatelessWidget {
  final UserModel userModel;
  const TwitterUserSpeakingStatus({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userModel.isSpeaking ? TwitterSpaceSoundWaves() :
    userModel.isMuted ? Container(
      margin: const EdgeInsets.only(right: 2),
      child: const Icon(TwitterSpace.mic_off,
        size: 15,
        color: TwitterColors.micOffColor,
      ),
    ) : const SizedBox();
  }
}
