import 'package:flutter/material.dart';
import 'package:flutter_assignment/global/colors_list.dart';
import 'package:flutter_assignment/global/widget_styles.dart';
import 'package:flutter_assignment/model/comment_model.dart';

//re-usable feed components

Widget singleComment({required Comment comment}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      profileDataRow(
          image: comment.proImage,
          name: comment.profileName,
          time: comment.time,
          isVerified: comment.isVerified),
      Padding(
        padding: const EdgeInsets.only(left: 42.0, right: 8.0, top: 6.0, bottom: 2.0),
        child: Text(
          comment.comment,
          textAlign: TextAlign.left,
          style: const TextStyle(
            fontSize: 12,
            color: detailColor,
            fontFamily: "NotoSans",
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 42.0),
        child: Row(
          children: [
            reactionsRowItem(
                isSmall: true,
                image: "assets/images/heart.png",
                number: comment.hearts),
            Visibility(
              visible: comment.commentVisible,
              child: reactionsRowItem(
                  isSmall: true,
                  image: "assets/images/comment.png",
                  number:comment.comments),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 42.0, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: comment.replyList.map((Comment c) {
            return singleComment(comment: c);
          }).toList(),
        ),
      ),
    ],
  );
}

Widget profileDataRow(
    {required String image,
      required String name,
      required String time,
      bool isVerified = true}) {
  return Row(
    children: [
      Expanded(
          child: Row(
            children: [
              Image(
                image: AssetImage(image),
                height: 34,
                width: 34,
              ),
              const SizedBox(width: 8),
              Text(name, style: titleStyle),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0),
                child: Visibility(
                  visible: isVerified,
                  child: const Image(
                    image: AssetImage("assets/images/check.png"),
                    height: 14,
                    width: 14,
                  ),
                ),
              ),
              Text(time,
                  style: const TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w500,
                      color: subTextColor)),
            ],
          )),
      const Expanded(
        flex: 0,
        child: Image(
          image: AssetImage("assets/images/more.png"),
          height: 32,
          width: 32,
        ),
      ),
    ],
  );
}

Widget reactionsRowItem(
    {required String image, required String number, bool isSmall = false}) {
  return Row(
    children: [
      Image(
        image: AssetImage(image),
        height: isSmall ? 25 : 32,
        width: isSmall ? 25 : 32,
      ),
      Text(number,
          style: TextStyle(
              color: subTextColor,
              fontSize: isSmall ? 9.35 : 12.0,
              fontFamily: "Roboto")),
      const SizedBox(width: 8)
    ],
  );
}