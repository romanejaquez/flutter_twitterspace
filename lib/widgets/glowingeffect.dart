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

class _GlowingEffectState extends State<GlowingEffect> with SingleTickerProviderStateMixin {
  
  late AnimationController glowingCircle;

  @override
  void initState() {
    super.initState();

    glowingCircle = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000)
    )..repeat(reverse: false);
  }

  @override
  void dispose() {
    glowingCircle.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: widget.onTap != null ? () { widget.onTap!(); } : null,
      child: SizedBox(
        width: 150,
        height: 150,
        child: Stack(
          children: [
            ...List.generate(3, (index) {
              return FadeTransition(
                opacity: Tween<double>(begin: 1.0, end: 0.0)
                .animate(CurvedAnimation(
                  parent: glowingCircle, 
                  curve: Interval(index * 0.2, (index * 0.2 + 0.6), curve: Curves.easeInOut))),
                child: ScaleTransition(
                  scale: Tween<double>(begin: 1.0, end: 2.0)
                  .animate(CurvedAnimation(
                    parent: glowingCircle, 
                    curve: Interval(index * 0.2, (index * 0.2 + 0.6), curve: Curves.easeInOut))),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipOval(
                      child: Container(
                        color: TwitterColors.mainColor.withOpacity(0.5)
                      ),
                    ),
                  ),
                ),
              );
            }),
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