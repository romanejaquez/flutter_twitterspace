
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_spaces_flutter/models/usermodel.dart';
import 'package:twitter_spaces_flutter/services/emojiservice.dart';

class TwitterUserAvatar extends StatefulWidget {

  final UserModel user;
  const TwitterUserAvatar({Key? key, required this.user}) : super(key: key);

  @override
  State<TwitterUserAvatar> createState() => _TwitterUserAvatarState();
}

class _TwitterUserAvatarState extends State<TwitterUserAvatar> with TickerProviderStateMixin {
  
  late AnimationController emojiCtrl;
  late AnimationController emojiScaleSmaller;
  late AnimationController emojiMove;
  Timer emojiTimer1 = Timer(Duration.zero, () {});
  Timer emojiTimer2 = Timer(Duration.zero, () {});
  Timer emojiTimer3 = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();

    emojiCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250)
    );


    emojiScaleSmaller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250)
    );

    emojiMove = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250)
    );
  }

  void executeEmojiAnimation() {
    emojiCtrl.forward().then((s) {
      emojiTimer1 = Timer(const Duration(seconds: 2), () {
        emojiScaleSmaller.forward().then((f) {

         emojiTimer2 = Timer(const Duration(seconds: 2), () {
            emojiMove.forward();
            emojiCtrl.reverse().then((value) {
              
              emojiTimer3 = Timer(const Duration(seconds: 1), () {
                emojiCtrl.reset();
                emojiScaleSmaller.reset();
                emojiMove.reset();
              });
            });
          });
        });
      });
    });
  }

  void resetEmojiAnimation() {
    emojiCtrl.reset();
    emojiScaleSmaller.reset();
    emojiMove.reset();

    emojiTimer1.cancel();
    emojiTimer2.cancel();
    emojiTimer3.cancel();
  }

  @override
  void dispose() {
    emojiCtrl.dispose();
    emojiScaleSmaller.dispose();
    emojiMove.dispose();

    emojiTimer1.cancel();
    emojiTimer2.cancel();
    emojiTimer3.cancel();

    super.dispose();
  }

  bool animationsAreDone() {
    return (!emojiCtrl.isAnimating && emojiCtrl.isCompleted) ||
    (!emojiScaleSmaller.isAnimating && emojiScaleSmaller.isCompleted) || 
    (!emojiMove.isAnimating && emojiMove.isCompleted);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 70,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          ClipOval(
            child: Image.asset('assets/imgs/' + widget.user.img + '.png',
              width: 70,
              height: 70,
              fit: BoxFit.cover
            ),
          ),
          Consumer<EmojiService>(
            builder: (context, eService, child) {

              if (eService.currentMessage.uId == widget.user.uid) {
                //if (animationsAreDone()) {
                  resetEmojiAnimation();
                  executeEmojiAnimation();
                //}
                
              }
              else {
                resetEmojiAnimation();
              }

              return SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(0.0, 0.0),
                  end: const Offset(0.30, -0.30)
                ).animate(CurvedAnimation(parent: emojiScaleSmaller, curve: Curves.easeInOut)),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: 0.5).
                    animate(CurvedAnimation(parent: emojiScaleSmaller, curve: Curves.easeInOut)),
                  child: ScaleTransition(
                    scale: Tween<double>(begin: 0.0, end: 1.01).
                    animate(CurvedAnimation(parent: emojiCtrl, curve: Curves.easeInOut)),
                    child: ClipOval(
                      child: Container(
                        color: Colors.black,
                        width: 70,
                        alignment: Alignment.center,
                          height: 70,
                          child: Image.asset('assets/imgs/emoji_${eService.currentMessage.emoji.name}.png',
                            width: 45,
                            height: 45,
                            fit: BoxFit.contain
                          )
                      )
                    ),
                  ),
                ),
              );
            }
          )
        ]
      ),
    );
  }
}