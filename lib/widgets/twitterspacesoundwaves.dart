
import 'package:flutter/material.dart';

class TwitterSpaceSoundWaves extends StatefulWidget {
  TwitterSpaceSoundWaves({Key? key}) : super(key: key);

  @override
  State<TwitterSpaceSoundWaves> createState() => _TwitterSpaceSoundWavesState();
}

class _TwitterSpaceSoundWavesState extends State<TwitterSpaceSoundWaves> with TickerProviderStateMixin {
  late AnimationController ctrlSide;
  late AnimationController ctrlMiddle;
  late AnimationController ctrlCenter;
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
    ctrlMiddle.addListener(() {
      setState(() {});
    });

    ctrlCenter = AnimationController(
      vsync: this,
      lowerBound: 2,
      upperBound: 10,
      duration: const Duration(milliseconds: 250)
    )..repeat(reverse: true);
    ctrlCenter.addListener(() {
      setState(() {});
    });
    
    barCtrls.add(ctrlSide);
    barCtrls.add(ctrlMiddle);
    barCtrls.add(ctrlCenter);
    barCtrls.add(ctrlMiddle);
    barCtrls.add(ctrlSide);
  }


  @override
  void dispose() {
    ctrlSide.dispose();
    ctrlMiddle.dispose();
    ctrlCenter.dispose();
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
              color: Color(0xFF7366D7),
              borderRadius: BorderRadius.circular(20)
            )
          );
        }),
      ),
    );
  }
}
