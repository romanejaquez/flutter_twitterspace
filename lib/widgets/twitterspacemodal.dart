
import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/widgets/emojiselector.dart';
import 'package:twitter_spaces_flutter/widgets/twitterspaceconversation.dart';
import 'package:twitter_spaces_flutter/widgets/twitterspacefooter.dart';
import 'package:twitter_spaces_flutter/widgets/twitterspaceheader.dart';
import 'package:twitter_spaces_flutter/widgets/twitterspacetitle.dart';

class TwitterSpaceModal extends StatelessWidget {
  const TwitterSpaceModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.height * 0.25),
      padding: const EdgeInsets.all(24),
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20)
        )
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const TwitterSpaceHeader(),
          const TwitterSpaceTitle(),
          Expanded(
            child: Stack(
              children: const [
                TwitterSpaceConversation(),
                Align(
                  alignment: Alignment.bottomRight,
                  child: EmojiSelector()
                )
              ],
            ),
          ),
          const TwitterSpaceFooter()
        ],
      )
    );
  }
}

