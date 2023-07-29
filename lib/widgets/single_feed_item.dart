import 'package:flutter/material.dart';
import 'package:flutter_assignment/global/colors_list.dart';
import 'package:flutter_assignment/global/widget_styles.dart';
import 'package:flutter_assignment/model/comment_model.dart';
import 'package:flutter_assignment/widgets/single_feed_components.dart';

class SingleFeedItem extends StatelessWidget {
  const SingleFeedItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              profileItemRow(),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: descriptionRow(),
              ),
              const SizedBox(height: 12),
              tagsSection(),
            ],
          ),
        ),
        imageSection(context: context),
        commentSection()
      ],
    );
  }
}

Widget profileItemRow() {
  return Row(
    children: [
      const Expanded(
          flex: 0,
          child: Image(
            image: AssetImage("assets/images/pro_pic2.png"),
            height: 34,
            width: 34,
          )),
      const SizedBox(width: 10),
      const Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "안녕 나 응애",
                style: titleStyle,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Image(
                  image: AssetImage("assets/images/check.png"),
                  height: 14,
                  width: 14,
                ),
              ),
              Text(
                "1일전",
                style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w500,
                    color: subTextColor),
              ),
            ],
          ),
          Text(
            "165cm \u2022 53kg",
            style: TextStyle(fontSize: 12.0, color: subTextColor),
          )
        ],
      )),
      Expanded(
          flex: 0,
          child: SizedBox(
            height: 24,
            child: FilledButton(
                style: FilledButton.styleFrom(
                    backgroundColor: buttonColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12.0, vertical: 0.0)
                ),
                onPressed: () {},
                child: const Text("팔로우",  style: TextStyle(fontSize: 12),)),
          )),
    ],
  );
}

Widget descriptionRow() {
  return const Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      SizedBox(height: 16),
      Text(
        "지난 월요일에 했던 이벤트 중 가장 괜찮은 상품 뭐야?",
        style: titleStyle,
      ),
      SizedBox(height: 16),
      Text(
        "지난 월요일에 2023년 S/S 트렌드 알아보기 이벤트 참석했던 팝들아~ 혹시 어떤 상품이 제일 괜찮았어? \n\n후기 올라오는거 보면 로우라이즈? 그게 제일 반응 좋고 그 테이블이 제일 재밌었다던데 맞아??? \n\n올해 로우라이즈가 트렌드라길래 나도 도전해보고 싶은데 말라깽이가 아닌 사람들도 잘 어울릴지 너무너무 궁금해ㅜㅜ로우라이즈 테이블에 있었던 팝들 있으면 어땠는지 후기 좀 공유해주라~~!",
        style: TextStyle(
            fontWeight: FontWeight.w500, fontSize: 12, color: detailColor, height: 1.5),
      ),
    ],
  );
}

Widget tagsSection() {
  List tagList = ["#2023", "#TODAYISMONDAY", "#TOP", "#POPS!", "#WOW", "#ROW"];
  return Wrap(
    children: tagList.map((label) {
      return tagChip(label: label);
    }).toList(),
  );
}

Widget tagChip({required String label}) {
  return Container(
      margin: const EdgeInsets.only(right: 6.0, bottom: 6.0),
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 3.0),
      decoration: BoxDecoration(
        color: const Color(0xffF7F8FA),
        borderRadius: const BorderRadius.all(Radius.circular(30)),
        border: Border.all(color: const Color(0xffCED3DE), width: .6),
      ),
      child: Text(label,
          style: const TextStyle(
              color: chipTextColor,
              fontSize: 12.0,
              fontFamily: "Roboto",
              fontWeight: FontWeight.w500)));
}

Widget imageSection({required BuildContext context}) {
  double width = MediaQuery.of(context).size.width;
  return Column(
    children: [
      const SizedBox(height: 12),
      Image(
        image: const NetworkImage(
            "https://wjddnjs754.cafe24.com/web/product/small/202303/5b9279582db2a92beb8db29fa1512ee9.jpg"),
        height: 450,
        width: width,
        fit: BoxFit.cover,
      ),
      const SizedBox(height: 6),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
        child: Row(
          children: [
            reactionsRowItem(image: "assets/images/heart.png", number: "5"),
            reactionsRowItem(image: "assets/images/comment.png", number: "5"),
            reactionsRowItem(image: "assets/images/book_mark.png", number: ""),
            const Image(
              image: AssetImage("assets/images/more.png"),
              height: 32,
              width: 32,
            ),
          ],
        ),
      ),
      const Divider(
        color: dividerColor,
      )
    ],
  );
}

Widget commentSection() {
  List<Comment> commentList = [
    Comment(
        profileName: "안녕 나 응애",
        proImage: "assets/images/pro_pic2.png",
        time: "1일전",
        hearts: "5",
        comments: "5",
        comment:
            "어머 제가 있던 테이블이 제일 반응이 좋았나보네요🤭 우짤래미님도 아시겠지만 저도 일반인 몸매 그 이상도 이하도 아니잖아요?! 그런 제가 기꺼이 도전해봤는데 생각보다 괜찮았어요! 오늘 중으로 라이브 리뷰 올라온다고 하니 꼭 봐주세용~!",
        replyList: [
          Comment(
              profileName: "ㅇㅅㅇ",
              isVerified: false,
              proImage: "assets/images/pro_pic2.png",
              time: "1일전",
              hearts: "5",
              commentVisible: false,
              comment: "오 대박! 라이브 리뷰 오늘 올라온대요? 챙겨봐야겠다",
              replyList: [])
        ])
  ];
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
    child: Column(
      children: commentList.map((Comment comment) {
        return singleComment(comment: comment);
      }).toList(),
    ),
  );
}
