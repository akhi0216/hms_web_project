import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/staff_list_controller.dart';
import 'package:provider/provider.dart';

class HrStaffDetails extends StatefulWidget {
  const HrStaffDetails({super.key});

  @override
  State<HrStaffDetails> createState() => _HrStaffDetailsState();
}

class _HrStaffDetailsState extends State<HrStaffDetails> {
  bool isLoading = false;

  callFunction() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<StaffListController>(context, listen: false).department();
    await Provider.of<StaffListController>(context, listen: false)
        .staffListFunction();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    callFunction();
  }

  @override
  Widget build(BuildContext context) {
    var varprovider = Provider.of<StaffListController>(context);
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: List.generate(
                  varprovider.staffList.length,
                  (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * .7,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all(
                            color: ColorConstants.mainBlue,
                            width: 1,
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.grey, offset: Offset(1, 3)),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                          child: Text(
                            "${varprovider.staffList[index]['doc']} - ${varprovider.staffList[index]['dept']}",
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
  }
}
