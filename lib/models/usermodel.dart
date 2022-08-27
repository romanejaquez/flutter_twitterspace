class UserModel {
  String uid;
  String name;
  String title;
  String img;
  bool isMuted;
  bool isSpeaking;

  UserModel({
    required this.uid,
    required this.name,
    required this.title,
    required this.img,
    required this.isMuted,
    required this.isSpeaking
  });
}