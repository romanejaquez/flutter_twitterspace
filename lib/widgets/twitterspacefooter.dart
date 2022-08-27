
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_spaces_flutter/helpers/twitter_space_icons.dart';
import 'package:twitter_spaces_flutter/services/emojiselectorservice.dart';

class TwitterSpaceFooter extends StatelessWidget {
  const TwitterSpaceFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    EmojiSelectorService ejService = Provider.of<EmojiSelectorService>(context, listen: false);
    
    return Container(
      color: Colors.black,
      padding: const EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Material(
            color: Colors.white.withOpacity(0.1),
            clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(50),
            child: InkWell(
              highlightColor: Colors.white.withOpacity(0.1),
              splashColor: Colors.white.withOpacity(0.1),
              onTap: () {}, 
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: const Icon(TwitterSpace.mic_off, color: Colors.red))
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(TwitterSpace.people, color: Colors.white, size: 20),
                SizedBox(width: 20),
                IconButton(
                  onPressed: () {
                    ejService.setEmojiSelectorVisibility(true);
                  },
                  icon: Icon(
                    TwitterSpace.emotion_add, 
                    color: Colors.white, 
                    size: 20
                  )
                ),
                SizedBox(width: 10),
                Container(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                    color: Color(0xFF7366D7),
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(TwitterSpace.messages, color: Colors.white, size: 20),
                      SizedBox(width: 10),
                      Text('17', style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
