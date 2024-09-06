import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/feedback_response.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/newstaff_auth.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/purchase_auth.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/user_auth.dart';

class PassingSection extends StatefulWidget {
  const PassingSection({super.key});

  @override
  State<PassingSection> createState() => _PassingSectionState();
}

class _PassingSectionState extends State<PassingSection> {
  Widget? selectedPage;

  @override
  Widget build(BuildContext context) {
    List<Map> pageList = [
      {
        "title": "User Authorization",
        "itemimage": "assets/user.png",
        "page": UserAuth(),
      },
      {
        "title": "Purchase Authorisation",
        "itemimage": "assets/allowed.png",
        "page": PurchaseAuth(),
      },
      {
        "title": "Newstaff Authorisation",
        "itemimage": "assets/team.png",
        "page": NewstaffAuth(),
      },
      {
        "title": "Feedback response",
        "itemimage": "assets/chat.png",
        "page": FeedbackResponse(),
      },
    ];

    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: 400,
              width: 400,
              child: GridView.builder(
                itemCount: pageList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    mainAxisExtent: 200),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    setState(() {
                      selectedPage = pageList[index]['page'] as Widget?;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.lightOrange,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: 130,
                            child: Image.network(
                              pageList[index]["itemimage"],
                              fit: BoxFit.fill,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            pageList[index]["title"],
                            style: TextStyle(color: ColorConstants.mainBlack),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        // Selected page overlay
        if (selectedPage != null)
          Positioned.fill(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  AppBar(
                    backgroundColor: ColorConstants.mainwhite,
                    // backgroundColor: ColorConstants.lightOrange,
                    leading: IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        setState(() {
                          selectedPage = null;
                        });
                      },
                    ),
                    // title: const Text('Details'),
                  ),
                  Expanded(child: selectedPage!),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
