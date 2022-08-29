
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_spaces_flutter/helpers/twittercolors.dart';
import 'package:twitter_spaces_flutter/services/emojiselectorservice.dart';
import 'package:twitter_spaces_flutter/widgets/glowingeffect.dart';
import 'package:twitter_spaces_flutter/widgets/twitterspacemodal.dart';

class TwitterSpaceHome extends StatelessWidget {
  const TwitterSpaceHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TwitterColors.mainBgColor,
      body: Center(
        child: GlowingEffect(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context, 
              builder: (context) {
                return const TwitterSpaceModal();
              }
            ).whenComplete(() {
              // clean up, i.e: close the emoji selector
              var emojiSelectorService = Provider.of<EmojiSelectorService>(context, listen: false);
              emojiSelectorService.setEmojiSelectorVisibility(false);
            });
          },
        )
      )
    );
  }
}
