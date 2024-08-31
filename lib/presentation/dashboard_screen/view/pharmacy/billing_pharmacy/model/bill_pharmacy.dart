class Medicine {
  String name;
  int stock;
  double price;
  int gst;
  //  final int currentstock;

  Medicine( 
      {required this.name,
      required this.stock,
      required this.price,
      required this.gst});
}

class SelectedMedicine {
  final Medicine medicine;
  final int quantity;
  final int gst;
  // final int currentstock;

  SelectedMedicine(
      {required this.medicine, required this.quantity, required this.gst});
}
