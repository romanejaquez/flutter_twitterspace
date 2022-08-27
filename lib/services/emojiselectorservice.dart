import 'package:flutter/material.dart';

class EmojiSelectorService extends ChangeNotifier {

  bool isVisible = false;

  void setEmojiSelectorVisibility(bool visible) {
    isVisible = visible;
    notifyListeners();
  }
}