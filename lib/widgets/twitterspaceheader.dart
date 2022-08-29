
import 'package:flutter/material.dart';
import 'package:twitter_spaces_flutter/helpers/twitter_space_icons.dart';

class TwitterSpaceHeader extends StatelessWidget {
  const TwitterSpaceHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(icon: const Icon(TwitterSpace.hide, color: Colors.white, size: 12),
        onPressed: () {
          Navigator.of(context).pop();
        }),
        Row(
          children: const [
            Icon(TwitterSpace.share, color: Colors.white),
            SizedBox(width: 15),
            Icon(TwitterSpace.more, color: Colors.white, size: 30),
            SizedBox(width: 15),
            Text('Leave', style: TextStyle(
              fontSize: 16,
              color: Colors.red, fontWeight: FontWeight.bold
            ))
          ],
        )
      ],
    );
  }
}
