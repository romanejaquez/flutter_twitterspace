import 'package:twitter_spaces_flutter/models/usermodel.dart';

class Utils {

  static List<UserModel> getUsers() {
    return [
      UserModel(
        uid: '101',
        name: 'Roman',
        title: 'Host',
        img: 'user_1',
        isMuted: false,
        isSpeaking: true
      ),
      UserModel(
        uid: '102',
        name: 'Josh',
        title: 'Co-host',
        img: 'user_2',
        isMuted: false,
        isSpeaking: false
      ),
      UserModel(
        uid: '103',
        name: 'Carl',
        title: 'Co-host',
        img: 'user_3',
        isMuted: false,
        isSpeaking: false
      ),
      UserModel(
        uid: '104',
        name: 'John',
        title: 'Speaker',
        img: 'user_4',
        isMuted: false,
        isSpeaking: true
      ),
      UserModel(
        uid: '104',
        name: 'Devin',
        title: 'Listener',
        img: 'user_5',
        isMuted: true,
        isSpeaking: false
      ),
      UserModel(
        uid: '105',
        name: 'Manny',
        title: 'Listener',
        img: 'user_6',
        isMuted: true,
        isSpeaking: false
      ),
      UserModel(
        uid: '106',
        name: 'Jess',
        title: 'Listener',
        img: 'user_7',
        isMuted: true,
        isSpeaking: false
      ),
      UserModel(
        uid: '107',
        name: 'Tara',
        title: 'Listener',
        img: 'user_8',
        isMuted: true,
        isSpeaking: false
      ),
      UserModel(
        uid: '108',
        name: 'Shawn',
        title: 'Listener',
        img: 'user_9',
        isMuted: true,
        isSpeaking: false
      ),
      UserModel(
        uid: '105',
        name: 'Sharon',
        title: 'Listener',
        img: 'user_10',
        isMuted: true,
        isSpeaking: false
      ),
      // UserModel(
      //   uid: '110',
      //   name: 'Peter',
      //   title: 'Listener',
      //   img: 'user_11',
      //   isMuted: true,
      //   isSpeaking: false
      // ),
      // UserModel(
      //   uid: '111',
      //   name: 'Lisa',
      //   title: 'Listener',
      //   img: 'user_12',
      //   isMuted: true,
      //   isSpeaking: false
      // ),
      // UserModel(
      //   uid: '112',
      //   name: 'Fey',
      //   title: 'Listener',
      //   img: 'user_13',
      //   isMuted: true,
      //   isSpeaking: false
      // ),
      // UserModel(
      //   uid: '113',
      //   name: 'Nairobi',
      //   title: 'Listener',
      //   img: 'user_14',
      //   isMuted: true,
      //   isSpeaking: false
      // ),
    ];
  }
}