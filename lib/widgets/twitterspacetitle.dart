import 'package:flutter/material.dart';

class TwitterSpaceTitle extends StatefulWidget {
  const TwitterSpaceTitle({Key? key}) : super(key: key);

  @override
  State<TwitterSpaceTitle> createState() => _TwitterSpaceTitleState();
}

class _TwitterSpaceTitleState extends State<TwitterSpaceTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SizedBox(height: 10),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(text: 'Flutter Space ', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              TextSpan(text: '@FlutterDev', style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold)),
              TextSpan(text: ' Building a TwitterSpace Clone in Flutter', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ]
          ),
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.left,
        ),
        SizedBox(height: 10),
        Text('Technology  •  Flutter  •  Development',
          style: TextStyle(color: Colors.grey)
        ),
        SizedBox(height: 20)
      ],
    );
  }
}

