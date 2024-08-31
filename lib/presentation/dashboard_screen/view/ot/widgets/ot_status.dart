import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class OtStatus extends StatefulWidget {
  const OtStatus({super.key});

  @override
  State<OtStatus> createState() => _OtStatusState();
}

class _OtStatusState extends State<OtStatus> {
  List<Map<String, dynamic>> statusList = [
    {
      'date': '17-09-2024',
      'status': [
        {
          'id': '001',
          'patient': 'Nithin',
          'doctor': 'Hari',
          'time': '10.00',
          'risktype': 'high'
        },
        {
          'id': '002',
          'patient': 'Hari',
          'doctor': 'Athulya',
          'time': '1.00',
          'risktype': 'medium'
        }
      ],
    },
    {
      'date': '30-08-2024',
      'status': [
        {
          'id': '002',
          'patient': 'Hari',
          'doctor': 'Athulya',
          'time': '1.00',
          'risktype': 'medium'
        }
      ],
    },
    {
      'date': '25-08-2024',
      'status': [
        {
          'id': '004',
          'patient': 'Akhila',
          'doctor': 'Adharsh',
          'time': '3.00',
          'risktype': 'low'
        }
      ],
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return ListView.builder(
      itemCount: statusList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: size.width * .7,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: ExpansionTile(
              title: Text(statusList[index]['date']),
              collapsedBackgroundColor: ColorConstants.mainBlue,
              collapsedTextColor: ColorConstants.mainwhite,
              childrenPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              children: [
                Container(
                  width: size.width * .7,
                  child: DataTable(
                    headingRowColor: WidgetStateColor.resolveWith(
                      (states) => ColorConstants.mainBlue,
                    ),
                    headingTextStyle: TextStyle(
                      color: ColorConstants.mainwhite,
                      fontWeight: FontWeight.bold,
                    ),
                    columns: [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Patient Name')),
                      DataColumn(label: Text('Doctor Name')),
                      DataColumn(label: Text('Time')),
                      DataColumn(label: Text('Category')),
                    ],
                    rows: List.generate(statusList[index]['status'].length,
                        (index2) {
                      return DataRow(
                        cells: [
                          DataCell(
                              Text(statusList[index]['status'][index2]['id'])),
                          DataCell(Text(
                              statusList[index]['status'][index2]['patient'])),
                          DataCell(Text(
                              statusList[index]['status'][index2]['doctor'])),
                          DataCell(Text(
                              statusList[index]['status'][index2]['time'])),
                          DataCell(Row(
                            children: [
                              Text(statusList[index]['status'][index2]
                                  ['risktype']),
                              SizedBox(width: 5),
                              Container(
                                decoration: BoxDecoration(
                                  color: statusList[index]['status'][index2]
                                              ['risktype'] ==
                                          "low"
                                      ? ColorConstants.mainGreen
                                      : statusList[index]['status'][index2]
                                                  ['risktype'] ==
                                              "medium"
                                          ? ColorConstants.mainBlue
                                          : ColorConstants.mainRed,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                    statusList[index]['status'][index2]
                                                ['risktype'] ==
                                            "low"
                                        ? Icons.check
                                        : statusList[index]['status'][index2]
                                                    ['risktype'] ==
                                                "medium"
                                            ? Icons.remove
                                            : Icons.close,
                                    color: ColorConstants.mainwhite),
                              )
                            ],
                          )),
                        ],
                      );
                    }),
                  ),
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // children: [
                //   Text('id : ${statusList[index]['status']['id']}'),
                //   Text(
                //       'patient name : ${statusList[index]['status']['patient']}'),
                //   Text(
                //       'doctor name : ${statusList[index]['status']['doctor']}'),
                //   Text('time : ${statusList[index]['status']['time']}'),
                //   Text('risktype : ${statusList[index]['status']['risktype']}'),
                // ],
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
