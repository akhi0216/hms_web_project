import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/view/store/controller/supplier_contoller.dart';
import 'package:provider/provider.dart';

class Supplier extends StatefulWidget {
  const Supplier({super.key});

  @override
  State<Supplier> createState() => _SupplierState();
}

class _SupplierState extends State<Supplier> {
  bool isGstdetails = false;
  TextEditingController supplieridController = TextEditingController();
  fetchData() async {
    await Provider.of<SupplierContoller>(context, listen: false)
        .suppliearidGeneration();
    supplieridController.text =
        Provider.of<SupplierContoller>(context, listen: false).supplierid;
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    var functionprovider =
        Provider.of<SupplierContoller>(context, listen: false);
    var varprovider = Provider.of<SupplierContoller>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "ID : ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                        height: 60,
                        width: 100,
                        child: TextFormField(
                          controller: supplieridController,
                          onTap: () {},
                          decoration:
                              InputDecoration(border: OutlineInputBorder()),
                        )),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Name :    ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                            height: 60,
                            width: 300,
                            child: TextFormField(
                                // decoration: InputDecoration(border: OutlineInputBorder()),
                                )),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Address : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                            height: 60,
                            width: 300,
                            child: TextFormField(
                                // decoration: InputDecoration(border: OutlineInputBorder()),
                                )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Phone :     ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                            height: 60,
                            width: 300,
                            child: TextFormField(
                                // decoration: InputDecoration(border: OutlineInputBorder()),
                                )),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Pin code : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                            height: 60,
                            width: 300,
                            child: TextFormField(
                                // decoration: InputDecoration(border: OutlineInputBorder()),
                                )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Mobile(1) : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                            height: 60,
                            width: 300,
                            child: TextFormField(
                                // decoration: InputDecoration(border: OutlineInputBorder()),
                                )),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          "Mobile(2) : ",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Container(
                            height: 60,
                            width: 300,
                            child: TextFormField(
                                // decoration: InputDecoration(border: OutlineInputBorder()),
                                )),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(
                  height: 7,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isGstdetails = true;
                    });
                  },
                  child: Container(
                    width: 70,
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ColorConstants.majenta),
                    child: Center(
                        child: Text(
                      "GST",
                      style: TextStyle(color: ColorConstants.mainwhite),
                    )),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Visibility(
              visible: isGstdetails,
              child: Container(
                padding: EdgeInsets.all(22),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border:
                        Border.all(color: ColorConstants.majenta, width: 2)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text("GST No : "),
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 9,
                        ),

                        Row(
                          children: [
                            Text("CGST :   "),
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                            )
                          ],
                        ),

                        SizedBox(
                          height: 11,
                        ),

                        Row(
                          children: [
                            Text("IGST :    "),
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                            )
                          ],
                        ),

                        SizedBox(
                          height: 11,
                        ),
                        // Row(
                        //   children: [
                        Row(
                          children: [
                            Text("Products : "),
                            SizedBox(
                                width: 280,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: OutlineInputBorder()),
                                ))
                          ],
                        ),

                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          children: [
                            Text("SGST : "),
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Row(
                          children: [
                            Text("TDS   : "),
                            SizedBox(
                              width: 300,
                              child: TextFormField(
                                decoration: InputDecoration(
                                    border: OutlineInputBorder()),
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text("Attachments :  "),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 50,
                          width: 320,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color.fromARGB(255, 230, 207, 234)),
                          child: Center(
                            child: Text(
                              "upload files",
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 11,
                        ),
                        Container(
                          width: 110,
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: ColorConstants.majenta),
                          child: Center(
                              child: Text(
                            "Submit",
                            style: TextStyle(color: ColorConstants.mainwhite),
                          )),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Container(
                      height: 300,
                      width: 300,
                      // color: ColorConstants.lightBlue,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/truck.png"),
                              fit: BoxFit.fill)),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //   children: [
                        //     Text("SGST : "),
                        //     SizedBox(
                        //       width: 200,
                        //       child: TextFormField(
                        //         decoration:
                        //             InputDecoration(border: OutlineInputBorder()),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 11,
                        // ),
                        // Row(
                        //   children: [
                        //     Text("TDS   : "),
                        //     SizedBox(
                        //       width: 200,
                        //       child: TextFormField(
                        //         decoration:
                        //             InputDecoration(border: OutlineInputBorder()),
                        //       ),
                        //     )
                        //   ],
                        // ),
                        // SizedBox(
                        //   height: 8,
                        // ),
                        // Text("Attachments :  "),
                        // SizedBox(
                        //   height: 5,
                        // ),
                        // Container(
                        //   height: 50,
                        //   width: 240,
                        //   padding: EdgeInsets.all(7),
                        //   decoration: BoxDecoration(
                        //       borderRadius: BorderRadius.circular(7),
                        //       color: const Color.fromARGB(255, 230, 207, 234)),
                        //   child: Center(
                        //     child: Text(
                        //       "upload files",
                        //       style: TextStyle(color: Colors.black),
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
