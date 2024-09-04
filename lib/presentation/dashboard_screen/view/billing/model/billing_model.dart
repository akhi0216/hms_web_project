// To parse this JSON data, do
//
//     final sampleBillingApimodel = sampleBillingApimodelFromJson(jsonString);

import 'dart:convert';

List<SampleBillingApimodel> sampleBillingApimodelFromJson(String str) =>
    List<SampleBillingApimodel>.from(
        json.decode(str).map((x) => SampleBillingApimodel.fromJson(x)));

String sampleBillingApimodelToJson(List<SampleBillingApimodel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SampleBillingApimodel {
  String? particulars;
  String? price;
  String? stock;
  String? gst;

  SampleBillingApimodel({
    this.particulars,
    this.price,
    this.stock,
    this.gst,
  });

  factory SampleBillingApimodel.fromJson(Map<String, dynamic> json) =>
      SampleBillingApimodel(
        particulars: json["particulars"],
        price: json["price"],
        stock: json["stock"],
        gst: json["gst"],
      );

  Map<String, dynamic> toJson() => {
        "particulars": particulars,
        "price": price,
        "stock": stock,
        "gst": gst,
      };
}
