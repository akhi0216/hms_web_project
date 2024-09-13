import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/feedback_response.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/newstaff_auth.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/purchase_auth.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/general/widgets/user_auth.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/invoice_authorisation.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/widgets/invoice_generation.dart';

class Invoice extends StatefulWidget {
  const Invoice({super.key});

  @override
  State<Invoice> createState() => _PassingSectionState();
}

class _PassingSectionState extends State<Invoice> {
  Widget? selectedPage;

  @override
  Widget build(BuildContext context) {
    List<Map> pageList = [
      {
        "title": "Invoice Generation",
        "itemimage": "assets/images/invoice.png",
        "page": InvoiceGeneration(),
      },
      {
        "title": "Invoice Authorisation",
        "itemimage": "assets/images/invoice.png",
        "page": InvoiceAuthorisation(),
      },
    ];

    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    width: 400,
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: pageList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
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
                                  style: TextStyle(
                                      color: ColorConstants.mainBlack,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
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
