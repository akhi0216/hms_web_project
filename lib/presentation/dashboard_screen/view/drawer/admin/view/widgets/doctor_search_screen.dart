import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:provider/provider.dart';

class DoctorSearchScreen extends StatefulWidget {
  const DoctorSearchScreen({super.key});
  @override
  State<DoctorSearchScreen> createState() => _DoctorSearchScreenState();
}

class _DoctorSearchScreenState extends State<DoctorSearchScreen> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var varProvider = Provider.of<TextSearchController>(context);
    var functionProvider =
        Provider.of<TextSearchController>(context, listen: false);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width * .7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: TextFormField(
            controller: searchController,
            onFieldSubmitted: (value) async {
              setState(() {});
              await functionProvider.searchDoctor(searchController.text.trim());
            },
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: ColorConstants.mainBlue),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide:
                    BorderSide(color: ColorConstants.mainBlue, width: 2),
              ),
              suffixIcon: IconButton(
                onPressed: () async {
                  setState(() {});
                  await functionProvider
                      .searchDoctor(searchController.text.trim());
                },
                icon: Icon(Icons.search),
                color: ColorConstants.mainBlue,
              ),
              hintText: "Search patient by name/id/username",
              hintStyle: TextStyle(color: Colors.grey[400]),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            ),
          ),
        ),
        SizedBox(
          height: 44,
        ),
        detailsContainer(
            label: "Doctor name : ",
            title: varProvider.doctorSearchModel.fname ?? ""),
        detailsContainer(
            label: "Employee id : ",
            title: varProvider.doctorSearchModel.eid ?? ""),
        detailsContainer(
            label: "Medical licence number : ",
            title: varProvider.doctorSearchModel.medlic ?? ""),
        detailsContainer(
            label: "Address : ",
            title: varProvider.doctorSearchModel.addr ?? ""),
        detailsContainer(
            label: "Mobile : ", title: varProvider.doctorSearchModel.mob ?? ""),
        detailsContainer(
            label: "Year of graduation : ",
            title: varProvider.doctorSearchModel.yrofgrad ?? ""),
        detailsContainer(
            label: "Current position : ",
            title: varProvider.doctorSearchModel.curpos ?? ""),
        detailsContainer(
            label: "Available starting time : ",
            title: varProvider.doctorSearchModel.availabilitystart ?? ""),
        detailsContainer(
            label: "Available ending time : ",
            title: varProvider.doctorSearchModel.availabilityend ?? ""),
        detailsContainer(
            label: "Date of birth : ",
            title: varProvider.doctorSearchModel.dob.toString()),
        detailsContainer(
            label: "School : ",
            title: varProvider.doctorSearchModel.school ?? ""),
        detailsContainer(
            label: "Department : ",
            title: varProvider.doctorSearchModel.department ?? ""),
        detailsContainer(
            label: "Email : ",
            title: varProvider.doctorSearchModel.email ?? ""),
      ],
    );
  }
}

Widget detailsContainer({required String label, required String title}) {
  return Container(
    height: 60,
    decoration:
        BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(5))),
    child: Row(
      children: [Text(label), Text(title)],
    ),
  );
}
