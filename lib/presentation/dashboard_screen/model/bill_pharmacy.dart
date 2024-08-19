class Medicine {
  final String name;
  final int stock;
  final double price;
  final int gst;

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

  SelectedMedicine(
      {required this.medicine, required this.quantity, required this.gst});
}
