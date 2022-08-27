
import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/widgets/glowingeffect.dart';
import 'package:twitter_spaces_flutter/widgets/twitterspacemodal.dart';

class TwitterSpaceHome extends StatelessWidget {
  const TwitterSpaceHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 47, 47, 47),
      body: Center(
        child: GlowingEffect(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,
              backgroundColor: Colors.transparent,
              context: context, 
              builder: (context) {
                return const TwitterSpaceModal();
              });
          },
        )
      )
    );
  }
}
