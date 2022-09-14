
import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/helpers/twittercolors.dart';

class TwitterSpaceSoundWaves extends StatefulWidget {
  const TwitterSpaceSoundWaves({Key? key}) : super(key: key);

  @override
  State<TwitterSpaceSoundWaves> createState() => _TwitterSpaceSoundWavesState();
}

class _TwitterSpaceSoundWavesState extends State<TwitterSpaceSoundWaves> with TickerProviderStateMixin {
  late AnimationController ctrlSide;
  late AnimationController ctrlMiddle;
  List<AnimationController> barCtrls = [];

  @override
  void initState() {
    super.initState();

    ctrlSide = AnimationController(
      vsync: this,
      lowerBound: 2,
      upperBound: 10,
      duration: const Duration(milliseconds: 250)
    )..repeat(reverse: true);
    
    ctrlSide.addListener(() {
      setState(() {});
    });

    ctrlMiddle = AnimationController(
      vsync: this,
      lowerBound: 2,
      upperBound: 10,
      duration: const Duration(milliseconds: 250)
    )..repeat(reverse: false);
    
    barCtrls.add(ctrlSide);
    barCtrls.add(ctrlMiddle);
    barCtrls.add(ctrlSide);
    barCtrls.add(ctrlMiddle);
    barCtrls.add(ctrlSide);
  }


  @override
  void dispose() {
    ctrlSide.dispose();
    ctrlMiddle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 2),
      child: Row(
        children: List.generate(5, (index) {
          return Container(
            margin: const EdgeInsets.only(left: 1, right: 1),
            width: 3,
            height: barCtrls[index].value,
            decoration: BoxDecoration(
              color: TwitterColors.mainColor,
              borderRadius: BorderRadius.circular(20)
            )
          );
        }),
      ),
    );
  }
}
