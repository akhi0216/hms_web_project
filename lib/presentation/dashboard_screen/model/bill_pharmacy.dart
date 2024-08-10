class Medicine {
  final String name;
  final int stock;
  final double price;

  Medicine({required this.name, required this.stock, required this.price});
}

class SelectedMedicine {
  final Medicine medicine;
  final int quantity;

  SelectedMedicine({required this.medicine, required this.quantity});
}
