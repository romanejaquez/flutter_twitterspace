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
  
  List<int> randomUserIndexes = [];

  EmojiService() {
    
    var randomUserCount = Random();
    while (randomUserIndexes.length < Utils.getUsers().length) {
      int userIndex = randomUserCount.nextInt(Utils.getUsers().length);
      if (!randomUserIndexes.contains(userIndex)) {
        randomUserIndexes.add(userIndex);
      }
    }

    int count = 0;
    Timer.periodic(const Duration(seconds: 5), (timer) {

      if (count == randomUserIndexes.length - 1) {
        timer.cancel();
      }

      var random = Random();
      var randomUser = Utils.getUsers()[randomUserIndexes[count]];
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