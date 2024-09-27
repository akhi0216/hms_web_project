import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/dashboardscreen.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/view/widgets/view_concerns.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/admission_emergency.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/alloted_leave.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/feedback_response.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/hr_1.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/hr_staff_details.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/leave_request.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/newstaff_auth.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/purchase_auth.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/user_auth.dart';

class EmergencyMain extends StatefulWidget {
  const EmergencyMain({
    super.key,
  });

  @override
  State<EmergencyMain> createState() => _PassingSectionState();
}

class _PassingSectionState extends State<EmergencyMain> {
  Widget? selectedPage;

  @override
  Widget build(BuildContext context) {
    List<Map> pageList = [
      {
        "title": "Admission",
        "itemimage": "assets/images/info.png",
        "page": AdmissionEmergency()
      },
      {
        "title": "Casuality",
        "itemimage": "assets/images/leave.png",
        "page": DummyPage(),
      },
    ];

    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: SizedBox(
                width: 600,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable GridView's own scrolling
                  itemCount: pageList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
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
                        color: ColorConstants.lightBlue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20)),
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
                              style: TextStyle(color: ColorConstants.mainwhite),
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
