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
    return Padding(
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
            // Expanded(
            // child:
            ListView.builder(
              itemCount: filteredMedicines.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final medicine = filteredMedicines[index];
                return Card(
                  // elevation: 3,
                  child: ListTile(
                    title: Text(medicine.name),
                    subtitle: Text('Available Stock: ${medicine.stock}'),
                  ),
                );
              },
            ),
            // ),
          ],
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
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
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           // Search field
//           TextField(
//             controller: searchController,
//             decoration: InputDecoration(
//               labelText: 'Search Medicine',
//               labelStyle: TextStyle(color: ColorConstants.mainBlue),
//               prefixIcon: Icon(Icons.search, color: ColorConstants.mainBlue),
//               enabledBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: ColorConstants.mainBlue),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(8),
//                 borderSide: BorderSide(color: ColorConstants.mainLightBlue),
//               ),
//               filled: true,
//               fillColor: ColorConstants.mainLightBlue.withOpacity(0.2),
//             ),
//             onChanged: _filterMedicines,
//           ),
//           SizedBox(height: 16),
//           // List of medicines
//           ListView.builder(
//             itemCount: filteredMedicines.length,
//             itemBuilder: (context, index) {
//               final medicine = filteredMedicines[index];
//               return Card(
//                 color: ColorConstants.mainLightBlue.withOpacity(0.3),
//                 elevation: 3,
//                 margin: EdgeInsets.symmetric(vertical: 8),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: ListTile(
//                   title: Text(
//                     medicine.name,
//                     style: TextStyle(
//                       color: ColorConstants.mainBlack,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   subtitle: Text(
//                     'Available Stock: ${medicine.stock}',
//                     style: TextStyle(color: ColorConstants.mainOrange),
//                   ),
//                   leading: Icon(Icons.local_pharmacy,
//                       color: ColorConstants.mainBlue),
//                 ),
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
