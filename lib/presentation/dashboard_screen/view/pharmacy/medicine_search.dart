// import 'package:flutter/material.dart';
// import 'package:hms_web_project/constants/color_constants.dart';
// import 'package:hms_web_project/presentation/dashboard_screen/model/medicine_search_model.dart';

// class MedicineSearch extends StatefulWidget {
//   const MedicineSearch({super.key});

//   @override
//   State<MedicineSearch> createState() => _MedicineSearchState();
// }

// class _MedicineSearchState extends State<MedicineSearch> {
//   TextEditingController searchController = TextEditingController();

//   final List<Medicine> medicines = [
//     Medicine(name: 'Paracetamol', stock: 100),
//     Medicine(name: 'Ibuprofen', stock: 50),
//     Medicine(name: 'Amoxicillin', stock: 75),
//     Medicine(name: 'Aspirin', stock: 20),
//     Medicine(name: 'Cetirizine', stock: 30),
//     Medicine(name: 'Azithromycin', stock: 15),
//     Medicine(name: 'Metformin', stock: 60),
//     Medicine(name: 'Atorvastatin', stock: 80),
//     Medicine(name: 'Lisinopril', stock: 40),
//     Medicine(name: 'Levothyroxine', stock: 100),
//     Medicine(name: 'Omeprazole', stock: 35),
//     Medicine(name: 'Amlodipine', stock: 45),
//     Medicine(name: 'Simvastatin', stock: 55),
//     Medicine(name: 'Losartan', stock: 25),
//     Medicine(name: 'Clopidogrel', stock: 50),
//     Medicine(name: 'Pantoprazole', stock: 70),
//     Medicine(name: 'Alprazolam', stock: 30),
//     Medicine(name: 'Prednisone', stock: 40),
//     Medicine(name: 'Gabapentin', stock: 65),
//     Medicine(name: 'Furosemide', stock: 50),
//     Medicine(name: 'Hydrochlorothiazide', stock: 60),
//     Medicine(name: 'Sertraline', stock: 30),
//     Medicine(name: 'Tramadol', stock: 45),
//     Medicine(name: 'Citalopram', stock: 35),
//     Medicine(name: 'Warfarin', stock: 20),
//     Medicine(name: 'Montelukast', stock: 50),
//     Medicine(name: 'Metoprolol', stock: 75),
//     Medicine(name: 'Doxycycline', stock: 25),
//     Medicine(name: 'Zolpidem', stock: 40),
//     Medicine(name: 'Bupropion', stock: 30),
//     Medicine(name: 'Ranitidine', stock: 80),
//   ];

//   // List to hold the search results
//   List<Medicine> filteredMedicines = [];
//   @override
//   void initState() {
//     super.initState();
//     // Initialize the filtered list with all medicines
//     filteredMedicines = medicines;
//   }

//   // Function to filter medicines based on the search query
//   void _filterMedicines(String query) {
//     setState(() {
//       filteredMedicines = medicines.where((medicine) {
//         final medicineName = medicine.name.toLowerCase();
//         final searchQuery = query.toLowerCase();
//         return medicineName.contains(searchQuery);
//       }).toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Search field
//             TextField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 labelText: 'Search Medicine',
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//               onChanged: _filterMedicines,
//             ),

//             SizedBox(height: 10),

//             // List of medicines
//             // Expanded(
//             // child:
//             ListView.builder(
//               itemCount: filteredMedicines.length,
//               shrinkWrap: true,
//               itemBuilder: (context, index) {
//                 final medicine = filteredMedicines[index];
//                 return Card(
//                   // elevation: 3,
//                   child: ListTile(

//                     title: Text(medicine.name),
//                     subtitle: Text('Available Stock: ${medicine.stock}'),
//                   ),
//                 );
//               },
//             ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// -------------------------------------

import 'package:flutter/material.dart';
import 'package:hms_web_project/constants/color_constants.dart';
import 'package:hms_web_project/presentation/dashboard_screen/model/medicine_search_model.dart';

class MedicineSearch extends StatefulWidget {
  const MedicineSearch({super.key});

  @override
  State<MedicineSearch> createState() => _MedicineSearchState();
}

class _MedicineSearchState extends State<MedicineSearch> {
  TextEditingController searchController = TextEditingController();

  final List<Medicine> medicines = [
    Medicine(name: 'Paracetamol', stock: 100),
    Medicine(name: 'Ibuprofen', stock: 50),
    Medicine(name: 'Amoxicillin', stock: 75),
    Medicine(name: 'Aspirin', stock: 20),
    Medicine(name: 'Cetirizine', stock: 30),
    Medicine(name: 'Azithromycin', stock: 15),
    Medicine(name: 'Metformin', stock: 60),
    Medicine(name: 'Atorvastatin', stock: 80),
    Medicine(name: 'Lisinopril', stock: 40),
    Medicine(name: 'Levothyroxine', stock: 100),
    Medicine(name: 'Omeprazole', stock: 35),
    Medicine(name: 'Amlodipine', stock: 45),
    Medicine(name: 'Simvastatin', stock: 55),
    Medicine(name: 'Losartan', stock: 25),
    Medicine(name: 'Clopidogrel', stock: 50),
    Medicine(name: 'Pantoprazole', stock: 70),
    Medicine(name: 'Alprazolam', stock: 30),
    Medicine(name: 'Prednisone', stock: 40),
    Medicine(name: 'Gabapentin', stock: 65),
    Medicine(name: 'Furosemide', stock: 50),
    Medicine(name: 'Hydrochlorothiazide', stock: 60),
    Medicine(name: 'Sertraline', stock: 30),
    Medicine(name: 'Tramadol', stock: 45),
    Medicine(name: 'Citalopram', stock: 35),
    Medicine(name: 'Warfarin', stock: 20),
    Medicine(name: 'Montelukast', stock: 50),
    Medicine(name: 'Metoprolol', stock: 75),
    Medicine(name: 'Doxycycline', stock: 25),
    Medicine(name: 'Zolpidem', stock: 40),
    Medicine(name: 'Bupropion', stock: 30),
    Medicine(name: 'Ranitidine', stock: 80),
  ];

  // List to hold the search results
  List<Medicine> filteredMedicines = [];

  @override
  void initState() {
    super.initState();
    // Initialize the filtered list with all medicines
    filteredMedicines = medicines;
  }

  // Function to filter medicines based on the search query
  void _filterMedicines(String query) {
    setState(() {
      filteredMedicines = medicines.where((medicine) {
        final medicineName = medicine.name.toLowerCase();
        final searchQuery = query.toLowerCase();
        return medicineName.contains(searchQuery);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Positioned.fill(
            child: Image.asset(
          "assets/images/medcine.jpg",
          fit: BoxFit.cover,
          opacity: AlwaysStoppedAnimation(0.6), 
        )
            // Image.network(
            //   'https://images.rawpixel.com/image_800/czNmcy1wcml2YXRlL3Jhd3BpeGVsX2ltYWdlcy93ZWJzaXRlX2NvbnRlbnQvbHIvcm0zNzNiYXRjaDE1LTIxNy0wMS5qcGc.jpg',
            //   fit: BoxFit.cover,
            // ),
            ),
        // Foreground content
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Search field
                TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    labelText: 'Search Medicine',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onChanged: _filterMedicines,
                ),
                SizedBox(height: 10),
                // List of medicines
                ListView.builder(
                  itemCount: filteredMedicines.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final medicine = filteredMedicines[index];
                    return Card(
                      color: Colors.black
                          .withOpacity(0.1), // Semi-transparent color
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10), // Rounded corners
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(16),
                        title: Text(
                          medicine.name,
                          style: TextStyle(
                              color: Colors.white), // White text for contrast
                        ),
                        subtitle: Text(
                          'Available Stock: ${medicine.stock}',
                          style: TextStyle(
                              color: Colors.white70), // Slightly lighter text
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
