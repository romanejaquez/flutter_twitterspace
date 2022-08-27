import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:twitter_spaces_flutter/pages/twitterspacehome.dart';
import 'package:twitter_spaces_flutter/services/emojiselectorservice.dart';
import 'package:twitter_spaces_flutter/services/emojiservice.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => EmojiService()
      ),
      ChangeNotifierProvider(
        create: (_) => EmojiSelectorService()
      )
    ],
    child: const TwitterSpaceApp()
  ));
}

class TwitterSpaceApp extends StatelessWidget {
  const TwitterSpaceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TwitterSpaceHome(),
    );
  }
}

