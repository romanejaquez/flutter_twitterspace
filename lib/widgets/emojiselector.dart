import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_spaces_flutter/helpers/emojis.dart';
import 'package:twitter_spaces_flutter/services/emojiselectorservice.dart';
import 'package:twitter_spaces_flutter/services/emojiservice.dart';

class EmojiSelector extends StatefulWidget {
  const EmojiSelector({Key? key}) : super(key: key);

  @override
  State<EmojiSelector> createState() => _EmojiSelectorState();
}

class _EmojiSelectorState extends State<EmojiSelector> with SingleTickerProviderStateMixin {
  late AnimationController emojiSelectorCtrl;

  @override
  void initState() {
    super.initState();

    emojiSelectorCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250)
    );
  }

  @override
  void dispose() {
    emojiSelectorCtrl.dispose();
    super.dispose();
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Consumer<EmojiSelectorService>(
      builder: (context, service, child) {

        if (service.isVisible) {
          emojiSelectorCtrl.forward();
        }
        else {
          emojiSelectorCtrl.reverse();
        }

        return ScaleTransition(
          alignment: Alignment.bottomRight,
          scale: Tween<double>(begin: 0.0, end: 1.0)
          .animate(CurvedAnimation(parent: emojiSelectorCtrl, curve: Curves.easeInOut)),
          child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  Emojis.values.length,
                  (index) {
                    return ClipOval(
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {
                            service.setEmojiSelectorVisibility(false);
                            var emojiService = Provider.of<EmojiService>(context, listen: false);
                            emojiService.setCurrentMessage(Emojis.values[index]);
                          },
                          highlightColor: Colors.white.withOpacity(0.2),
                          splashColor: Colors.white.withOpacity(0.2),
                          child: Container(
                            alignment: Alignment.center,
                            width: 50,
                            height: 50,
                            child: Image.asset('assets/imgs/emoji_${Emojis.values[index].name}.png',
                              width: 35, height: 35
                            )
                          )
                        ),
                      ),
                    );
                  }
                )
              ),
            ),
        );
      }
    );
  }
}