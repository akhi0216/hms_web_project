// To parse this JSON data, do
//
//     final billingPharmacyModel = billingPharmacyModelFromJson(jsonString);

import 'dart:convert';

List<BillingPharmacyModel> billingPharmacyModelFromJson(String str) => List<BillingPharmacyModel>.from(json.decode(str).map((x) => BillingPharmacyModel.fromJson(x)));

String billingPharmacyModelToJson(List<BillingPharmacyModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BillingPharmacyModel {
    String? particulars;
    String? price;
    String? stock;
    String? gst;

    BillingPharmacyModel({
        this.particulars,
        this.price,
        this.stock,
        this.gst,
    });

    factory BillingPharmacyModel.fromJson(Map<String, dynamic> json) => BillingPharmacyModel(
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

class SelectedMedicine {
  final BillingPharmacyModel medicine;
  final int quantity;
  final int gst;
  // final int currentstock;

  SelectedMedicine(
      {required this.medicine, required this.quantity, required this.gst});
}
