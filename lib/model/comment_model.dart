class Comment {
  String profileName;
  String proImage;
  String comment;
  String time;
  bool isVerified;
  List<Comment> replyList;
  String hearts;
  String comments;
  bool commentVisible;

  Comment(
      {required this.profileName,
        required this.proImage,
        required this.time,
        required this.comment,
        this.commentVisible = true,
        this.isVerified = true,
        this.hearts = "0",
        this.comments =  "0",
        this.replyList = const []});
}
