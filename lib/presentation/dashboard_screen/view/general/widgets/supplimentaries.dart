import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';

class Supplimentaries extends StatefulWidget {
  const Supplimentaries({super.key});

  @override
  State<Supplimentaries> createState() => _SupplimentariesState();
}

class _SupplimentariesState extends State<Supplimentaries> {
  final TextEditingController _itemNameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _gstController = TextEditingController();

  void _handleSubmit() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Supplementary item added successfully!'),
        duration: Duration(seconds: 2),
      ),
    );

    _itemNameController.clear();
    _priceController.clear();
    _gstController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Add Supplementaries",
                  style: TextStyle(
                    color: ColorConstants.mainBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                _buildInputField(
                  label: "Item",
                  controller: _itemNameController,
                  icon: Icons.inventory_2_outlined,
                ),
                SizedBox(height: 20),
                _buildInputField(
                  label: "Price",
                  controller: _priceController,
                  icon: Icons.attach_money_outlined,
                ),
                SizedBox(height: 20),
                _buildInputField(
                  label: "GST",
                  controller: _gstController,
                  icon: Icons.percent_outlined,
                ),
                SizedBox(height: 30),
                Center(
                  child: ElevatedButton(
                    onPressed: _handleSubmit,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorConstants.mainBlue,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 18),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          width: 100,
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://images.pexels.com/photos/9574420/pexels-photo-9574420.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInputField({
    required String label,
    required TextEditingController controller,
    required IconData icon,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: ColorConstants.mainBlue,
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              labelText: 'Enter $label',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _itemNameController.dispose();
    _priceController.dispose();
    _gstController.dispose();
    super.dispose();
  }
}
