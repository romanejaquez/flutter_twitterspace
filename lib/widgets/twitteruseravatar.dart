
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_spaces_flutter/models/usermodel.dart';
import 'package:twitter_spaces_flutter/services/emojiservice.dart';
import 'package:twitter_spaces_flutter/widgets/twitteremojianimation.dart';

class TwitterUserAvatar extends StatefulWidget {

  final UserModel user;
  const TwitterUserAvatar({Key? key, required this.user}) : super(key: key);

  @override
  State<TwitterUserAvatar> createState() => _TwitterUserAvatarState();
}

class _TwitterUserAvatarState extends State<TwitterUserAvatar> {
  
  List<Widget> emojiMsgWidgets = [];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: Image.asset('assets/imgs/${widget.user.img}.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover
            ),
          ),
          Consumer<EmojiService>(
            builder: (context, eService, child) {

              if (eService.currentMessage.uId == widget.user.uid) {
                
                var emoji = eService.currentMessage.emoji;
                var emojiKey = GlobalKey();

                emojiMsgWidgets.add(
                  TwitterEmojiAnimation(
                    key: emojiKey,
                    emoji: emoji,
                    onAnimationDone: (Key? key) {
                      if (emojiMsgWidgets.where((e) => e.key == key).isNotEmpty) {
                        var doneEmoji = emojiMsgWidgets.where((e) => e.key == key).first;
                        emojiMsgWidgets.remove(doneEmoji);
                      }
                    }
                  )
                );
              }

              return Stack(
                children: emojiMsgWidgets
              );
            }
          ),
        ]
      ),
    );
  }
}