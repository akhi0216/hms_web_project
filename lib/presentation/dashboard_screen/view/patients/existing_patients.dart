import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/controller/search_controller.dart';
import 'package:provider/provider.dart';

class ExistingPatientsPage extends StatefulWidget {
  ExistingPatientsPage({super.key});

  @override
  State<ExistingPatientsPage> createState() => _ExistingPatientsPageState();
}

class _ExistingPatientsPageState extends State<ExistingPatientsPage> {
  TextEditingController searchController = TextEditingController();
  bool visible = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var varProvider = Provider.of<TextSearchController>(context);
    var functionProvider =
        Provider.of<TextSearchController>(context, listen: false);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
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
                  visible = true;
                  varProvider.patientSearchModel.list?[0].fname = "";
                  varProvider.patientSearchModel.list?[0].lname = "";
                  varProvider.patientSearchModel.list?[0].pid = "";
                  varProvider.patientSearchModel.list?[0].doc = "";
                  varProvider.patientSearchModel.list?[0].presc = "";
                  varProvider.patientSearchModel.list?[0].mob = "";
                  varProvider.patientSearchModel.list?[0].dob = "";
                  varProvider.patientSearchModel.list?[0].address = "";
                  varProvider.patientSearchModel.list?[0].department = "";
                  varProvider.patientSearchModel.list?[0].email = "";
                  varProvider.patientSearchModel.list?[0].img = "";
                  isLoading = true;
                  await functionProvider
                      .searchPatient(searchController.text.trim());
                  setState(() {
                    isLoading = false;
                  });
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
                      if (functionProvider.patientSearchModel.list == null &&
                          functionProvider.patientSearchModel.list!.isEmpty) {
                        visible = true;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('No patient found'),
                            backgroundColor: ColorConstants.mainRed,
                          ),
                        );
                      } else {
                        isLoading = true;
                        await functionProvider
                            .searchPatient(searchController.text.trim());
                        setState(() {
                          isLoading = false;
                        });
                      }
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailsContainer(
                        label: "First name : ",
                        title: varProvider.patientSearchModel.list?[0].fname ??
                            ""),
                    detailsContainer(
                        label: "Last name : ",
                        title: varProvider.patientSearchModel.list?[0].lname ??
                            ""),
                    detailsContainer(
                        label: "date of birth : ",
                        title:
                            varProvider.patientSearchModel.list?[0].dob ?? ""),
                    detailsContainer(
                        label: "Address : ",
                        title:
                            varProvider.patientSearchModel.list?[0].address ??
                                ""),
                    detailsContainer(
                        label: "Mobile : ",
                        title:
                            varProvider.patientSearchModel.list?[0].mob ?? ""),
                    detailsContainer(
                        label: "Email : ",
                        title: varProvider.patientSearchModel.list?[0].email ??
                            ""),
                    detailsContainer(
                        label: "Department : ",
                        title: varProvider
                                .patientSearchModel.list?[0].department ??
                            ""),
                    detailsContainer(
                        label: "Doctor's name : ",
                        title:
                            varProvider.patientSearchModel.list?[0].doc ?? ""),
                    detailsContainer(
                        label: "Prescription : ",
                        title: varProvider.patientSearchModel.list?[0].presc ??
                            ""),
                  ],
                ),
                Visibility(
                    visible: visible,
                    child: imageContainer(context,
                        varProvider.patientSearchModel.list?[0].img ?? "")),
              ],
            ),
          ],
        ),
      ),
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

bool isLoading = true;
Widget imageContainer(BuildContext context, String img) {
  return isLoading == false
      ? Container(
          height: MediaQuery.sizeOf(context).height * .4,
          width: MediaQuery.sizeOf(context).width * .3,
          child: img != ""
              ? Image.network(
                  "http://cybot.avanzosolutions.in/hms/uploads/$img")
              : Icon(Icons.person),
        )
      : Center(
          child: CircularProgressIndicator(
            color: ColorConstants.mainBlue,
          ),
        );
}
