import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/drawer/admin/controller/staff_list_controller.dart';
import 'package:provider/provider.dart';

class StaffListScreen extends StatefulWidget {
  const StaffListScreen({super.key});

  @override
  State<StaffListScreen> createState() => _StaffListScreenState();
}

class _StaffListScreenState extends State<StaffListScreen> {
  callFunction() async {
    await Provider.of<StaffListController>(context, listen: false).department();
    await Provider.of<StaffListController>(context, listen: false)
        .staffListFunction();
  }

  @override
  void initState() {
    super.initState();
    callFunction();
  }

  @override
  Widget build(BuildContext context) {
    var varprovider = Provider.of<StaffListController>(context);
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: SingleChildScrollView(
        child: Column(
            children: List.generate(
          varprovider.staffList.length,
          (index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.sizeOf(context).width * .6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(color: Colors.grey, offset: Offset(1, 3))
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10, left: 10),
                  child: Text(
                      "${varprovider.staffList[index]['doc']}-------------------------${varprovider.staffList[index]['dept']}"),
                ),
              ),
            );
          },
        )),
      ),
    );
  }
}
