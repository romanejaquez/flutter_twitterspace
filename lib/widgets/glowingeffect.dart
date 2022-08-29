import 'dart:async';
import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/helpers/twitter_space_icons.dart';
import 'package:twitter_spaces_flutter/helpers/twittercolors.dart';

class GlowingEffect extends StatefulWidget {

  final IconData? icon;
  final double? size;
  final Function? onTap;

  const GlowingEffect({Key? key, 
  this.size = 50,
  this.onTap,
  this.icon = TwitterSpace.twitterspace }) : super(key: key);

  @override
  State<GlowingEffect> createState() => _GlowingEffectState();
}

class _GlowingEffectState extends State<GlowingEffect> with TickerProviderStateMixin {
  
  late AnimationController innerCircle;
  late AnimationController outerCircle;
  late AnimationController thirdCircle;
  late Timer outerTimer;
  late Timer innerTimer;

  @override
  void initState() {
    super.initState();

    innerCircle = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000)
    )..repeat(reverse: false);

    outerCircle = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000)
    );

    thirdCircle = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 2000)
    );
  }

  @override
  void dispose() {
    outerTimer.cancel();
    innerTimer.cancel();

    innerCircle.dispose();
    outerCircle.dispose();
    thirdCircle.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    outerTimer = Timer(const Duration(milliseconds: 500), () {
      outerCircle.repeat(reverse: false);

      innerTimer = Timer(const Duration(milliseconds: 500), () {
        thirdCircle.repeat(reverse: false);
      });
    });

    return GestureDetector(
      onTap: widget.onTap != null ? () { widget.onTap!(); } : null,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Stack(
          children: [
            FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0)
              .animate(CurvedAnimation(parent: thirdCircle, curve: Curves.easeInOut)),
              child: ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 2.0)
                .animate(CurvedAnimation(parent: thirdCircle, curve: Curves.easeInOut)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipOval(
                    child: Container(
                      color: TwitterColors.mainColor.withOpacity(0.5)
                    ),
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0)
              .animate(CurvedAnimation(parent: outerCircle, curve: Curves.easeInOut)),
              child: ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 2.0)
                .animate(CurvedAnimation(parent: outerCircle, curve: Curves.easeInOut)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipOval(
                    child: Container(
                      color: TwitterColors.mainColor.withOpacity(0.5)
                    ),
                  ),
                ),
              ),
            ),
            FadeTransition(
              opacity: Tween<double>(begin: 1.0, end: 0.0)
              .animate(CurvedAnimation(parent: innerCircle, curve: Curves.easeInOut)),
              child: ScaleTransition(
                scale: Tween<double>(begin: 1.0, end: 2.0)
                .animate(CurvedAnimation(parent: innerCircle, curve: Curves.easeInOut)),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ClipOval(
                    child: Container(
                      color: TwitterColors.mainColor.withOpacity(0.5)
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipOval(
                child: Container(
                  color: TwitterColors.mainColor
                ),
              ),
            ),
            Center(
              child: Icon(widget.icon, 
              color: Colors.white,
              size: widget.size),
            )
          ],
        )
      ),
    );
  }
}