import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/helpers/emojis.dart';
import 'package:twitter_spaces_flutter/helpers/utils.dart';
import 'package:twitter_spaces_flutter/models/emojimessagemodel.dart';

class EmojiService extends ChangeNotifier {

  EmojiMessage currentMessage = EmojiMessage(
    emoji: Emojis.blueheart,
    uId: '-1'
  );
  
  EmojiService() {

    var users = Utils.getUsers();

    int count = 0;
    Timer.periodic(const Duration(seconds: 5), (timer) {

      if (count == users.length - 1) {
        timer.cancel();
      }

      var random = Random();
      var randomUser = users[random.nextInt(users.length)];
      var randomEmoji = Emojis.values[random.nextInt(Emojis.values.length)];
      currentMessage = EmojiMessage(uId: randomUser.uid, emoji: randomEmoji);
      count++;

      notifyListeners();
      
    });
  }

  void setCurrentMessage(Emojis emoji) {
    var randomUser = Utils.getUsers()[0];
    var randomEmoji = emoji;
    currentMessage = EmojiMessage(uId: randomUser.uid, emoji: randomEmoji);
    notifyListeners();
  }
}