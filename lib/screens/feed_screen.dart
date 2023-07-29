import 'package:flutter/material.dart';
import 'package:flutter_assignment/global/colors_list.dart';
import 'package:flutter_assignment/widgets/single_feed_item.dart';

class FeedScreen extends StatelessWidget {
  const FeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: feedAppBar(),
      body: ListView(
        padding: const EdgeInsets.only(top: 15),
        children: const [SingleFeedItem()],
      ),
      bottomNavigationBar: inputField(),
    );
  }
}

PreferredSizeWidget feedAppBar() {
  return AppBar(
    title: const Text(
      "자유톡",
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w700, color: titleColor),
    ),
    leading: const Icon(
      Icons.arrow_back_ios,
      color: iconColor,
    ),
    actions: [
      IconButton(
          onPressed: () {},
          icon: const Image(
            image: AssetImage("assets/images/bell.png"),
            height: 24,
            width: 24,
          )),
    ],
  );
}

Widget inputField() {
  return const SizedBox(
      height: 60,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Divider(
            color: dividerColor,
            height: 0,
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 6.0, top: 15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 0,
                      child: Image(
                        image: AssetImage("assets/images/image.png"),
                        height: 24,
                        width: 24,
                      )),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                      child: TextField(
                        style: TextStyle(color: inputTextColor, fontSize: 12),
                    decoration: InputDecoration(
                      isDense: true,
                        contentPadding: EdgeInsets.only(top:2),
                        border: InputBorder.none,
                        hintText: "댓글을 남겨주세요.",

                        hintStyle:
                            TextStyle(color: inputTextColor, fontSize: 12)),
                  )),
                  Expanded(
                      flex: 0,
                      child: Text(
                        "등록",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: subTextColor,
                            fontSize: 12),
                      )),
                ],
              ))
        ],
      ));
}
