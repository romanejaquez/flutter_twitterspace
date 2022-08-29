import 'dart:async';
import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/helpers/emojis.dart';

class TwitterEmojiAnimation extends StatefulWidget {

  final Emojis emoji;
  final Function onAnimationDone;

  const TwitterEmojiAnimation({
    Key? key, 
    required this.emoji,
    required this.onAnimationDone
  }) : super(key: key);

  @override
  State<TwitterEmojiAnimation> createState() => _TwitterEmojiAnimationState();
}

class _TwitterEmojiAnimationState extends State<TwitterEmojiAnimation> with TickerProviderStateMixin {
  
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

    executeEmojiAnimation();
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

                widget.onAnimationDone(widget.key!);
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
  
  @override
  Widget build(BuildContext context) {
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
                child: Image.asset('assets/imgs/emoji_${widget.emoji.name}.png',
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
}