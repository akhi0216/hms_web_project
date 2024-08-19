import 'package:flutter/material.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/new_booking_controller.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:provider/provider.dart';

class DepartmentWiseAvailabilityScreen extends StatefulWidget {
  const DepartmentWiseAvailabilityScreen({super.key});

  @override
  State<DepartmentWiseAvailabilityScreen> createState() =>
      _DepartmentWiseAvailabilityScreenState();
}

class _DepartmentWiseAvailabilityScreenState
    extends State<DepartmentWiseAvailabilityScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<BookingPatientController>(context, listen: false).department();
  }

  List doctorDetails = [];

  @override
  Widget build(BuildContext context) {
    var deptVarProvider = Provider.of<BookingPatientController>(context);
    var docVarProvider = Provider.of<BookingPatientController>(context);
    var deptProvider =
        Provider.of<BookingPatientController>(context, listen: false);
    var docProvider = Provider.of<TextSearchController>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GridView.builder(
        itemCount: deptVarProvider.deptList.length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 5,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            mainAxisExtent: 230),
        itemBuilder: (context, index) => InkWell(
          onTap: () async {
            await deptProvider.doctors(deptVarProvider.deptList[index]);
            for (var i = 0; i < deptVarProvider.doctorIdList.length; i++) {
              await docProvider.searchDoctor(deptVarProvider.doctorIdList[i]);
              doctorDetails.add(docProvider.doctorSearchModel);
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => doctorGrid(),
                ));
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: Column(
              children: [
                Image.network(
                  "https://images.pexels.com/photos/4386466/pexels-photo-4386466.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                  fit: BoxFit.contain,
                ),
                Text(
                  deptVarProvider.deptList[index],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget doctorGrid() {
    var varProvider = Provider.of<BookingPatientController>(context);
    print(varProvider.doctorList);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: varProvider.doctorList.length,
          shrinkWrap: true,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              mainAxisExtent: 280),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: Color(0xffdec09d),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                // mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.network(
                    "https://images.pexels.com/photos/4492064/pexels-photo-4492064.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    fit: BoxFit.contain,
                  ),
                  Text("Name: ${doctorDetails[index].fname}"),
                  Text("ID: ${doctorDetails[index].eid}"),
                  Text("Dept: ${doctorDetails[index].department}"),
                  Text("Medical License No: ${doctorDetails[index].medlic}"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
