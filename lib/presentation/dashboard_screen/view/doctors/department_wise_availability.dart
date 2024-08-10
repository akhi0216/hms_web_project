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
            mainAxisExtent: 250),
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
            child: Text(deptVarProvider.deptList[index]),
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
              mainAxisExtent: 250),
          itemBuilder: (context, index) => InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(doctorDetails[index].fname),
                  Text(doctorDetails[index].eid),
                  Text(doctorDetails[index].department),
                  Text(doctorDetails[index].medlic),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
