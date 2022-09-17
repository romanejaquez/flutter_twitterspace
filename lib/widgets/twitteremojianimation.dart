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
  
  late AnimationController emojiScaleFromCenter;
  late AnimationController emojiScaleSmallToCorner;
  
  Timer emojiTimer1 = Timer(Duration.zero, () {});
  Timer emojiTimer2 = Timer(Duration.zero, () {});
  Timer emojiTimer3 = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();

    emojiScaleFromCenter = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250)
    );

    emojiScaleSmallToCorner = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250)
    );

    executeEmojiAnimation();
  }

  void executeEmojiAnimation() {

    // first animation: scale from the center
    emojiScaleFromCenter.forward().then((s) {
      emojiTimer1 = Timer(const Duration(seconds: 2), () {
        
        // second animation: scale to corner
        emojiScaleSmallToCorner.forward().then((f) {

         emojiTimer2 = Timer(const Duration(seconds: 2), () {
            
            // third animation: reverse the emoji scale
            emojiScaleFromCenter.reverse().then((value) {
              
              emojiTimer3 = Timer(const Duration(seconds: 1), () {
                
                // at the end, reset both animations
                emojiScaleFromCenter.reset();
                emojiScaleSmallToCorner.reset();

                // notify the parent to remove this widget
                widget.onAnimationDone(widget.key!);
              });
            });
          });
        });
      });
    });
  }

  void resetEmojiAnimation() {
    emojiScaleFromCenter.reset();
    emojiScaleSmallToCorner.reset();

    emojiTimer1.cancel();
    emojiTimer2.cancel();
    emojiTimer3.cancel();
  }

  @override
  void dispose() {
    emojiScaleFromCenter.dispose();
    emojiScaleSmallToCorner.dispose();

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
      ).animate(CurvedAnimation(parent: emojiScaleSmallToCorner, curve: Curves.easeInOut)),
      child: ScaleTransition(
        scale: Tween<double>(begin: 1.0, end: 0.5).
          animate(CurvedAnimation(parent: emojiScaleSmallToCorner, curve: Curves.easeInOut)),
        child: ScaleTransition(
          scale: Tween<double>(begin: 0.0, end: 1.01).
          animate(CurvedAnimation(parent: emojiScaleFromCenter, curve: Curves.easeInOut)),
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