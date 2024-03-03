// // ignore_for_file: unnecessary_null_comparison

// import 'package:animate_do/animate_do.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:delivery/global/global_veriable.dart';
// import 'package:delivery/screens/last_page/submit.dart';
// import 'package:delivery/widgets/primaryButton.dart';
// import 'package:delivery/widgets/secondButton.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// class ThirdPage extends StatefulWidget {
//   @override
//   _ThirdPageState createState() => _ThirdPageState();
// }

// class _ThirdPageState extends State<ThirdPage> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   final GlobalController _globalController = GlobalController();
//   void _resetForm() {
//     _globalController.commentsController.clear();
//     _globalController.qualityOfficerController.clear();
//     _globalController.qualityManagerController.clear();
//     _globalController.supplierRepresentativeController.clear();
//   }

//   Future<void> storeDataInFirebase() async {
//     try {
//       // Initialize Firebase if not already initialized
//       await Firebase.initializeApp();

//       // Reference to the Firestore collection where you want to store the data
//       CollectionReference dataCollection =
//           FirebaseFirestore.instance.collection('Saved_Data');

//       // Create a data map with the fields you want to store
//       Map<String, dynamic> data = {
//         'selectedDate': _globalController.selectedDate != null
//             ? DateFormat('yyyy-MM-dd').format(_globalController.selectedDate!)
//             : '',
//         'manufacturerController': _globalController.manufacturerController,
//         'locationController': _globalController.locationController,
//         'inspectedByController': _globalController.inspectedByController,
//         'supplierNameController': _globalController.supplierNameController,
//         'addressController': _globalController.addressController,
//         'commentsController': _globalController.commentsController.text,
//         'qualityOfficerController':
//             _globalController.qualityOfficerController.text,
//         'qualityManagerController':
//             _globalController.qualityManagerController.text,
//         'supplierRepresentativeController':
//             _globalController.supplierRepresentativeController.text,
//         'purchaseNumberController':
//             _globalController.purchaseNumberController.text,
//         'materialNameController': _globalController.materialNameController.text,
//         'descriptionController': _globalController.descriptionController.text,
//         'quantityController': _globalController.quantityController.text,
//         'sampleSizeController': _globalController.sampleSizeController.text,
//         'pickedImageController': _globalController.pickedImageController.text,
//         'field1Status': _globalController.field1Status,
//         'field2Status': _globalController.field2Status,
//         'field3Status': _globalController.field3Status,
//         'field4Status': _globalController.field4Status,
//         'field5Status': _globalController.field5Status,
//         'field6Status': _globalController.field6Status,
//         'selectedDateData': _globalController.selectedDate != null
//             ? DateFormat('yyyy-MM-dd')
//                 .format(_globalController.selectedDateData!)
//             : "",
//         "imageUrl": await _globalController.imageUrl,
//       };

//       // Add the data to Firestore
//       await dataCollection.add(data);

//       // If the data is successfully added, you can handle success here
//       print('Data stored in Firebase Firestore successfully');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text(
//               'Data successfully saved to the cloud!'), // Display the success message
//           duration: Duration(seconds: 2),
//           behavior: SnackBarBehavior.floating,
//           backgroundColor: Colors.green,
//           padding: EdgeInsets.all(15),
//         ),
//       );
//     } catch (e) {
//       // Handle errors here
//       print('Error storing data in Firebase Firestore: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content:
//               Text(' Please try again later. $e'), // Display the error message
//           duration: Duration(seconds: 2),
//           behavior: SnackBarBehavior.floating,
//           backgroundColor: Colors.redAccent,
//           padding: EdgeInsets.all(15),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           child: FadeInRightBig(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SizedBox(
//                   height: 30,
//                 ),
//                 const Center(
//                   child: Text(
//                     "Steps \t3/3 ",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(fontSize: 24, color: Colors.grey),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 10,
//                   height: 10,
//                 ),
//                 const Center(
//                   child: Text(
//                     "Incoming Inspection \nSign !",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 24,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 Padding(
//                   padding: const EdgeInsets.all(20.0),
//                   child: Column(
//                     children: [
//                       TextFormField(
//                         controller: _globalController.commentsController,
//                         decoration:
//                             InputDecoration(labelText: 'Additional Comments'),
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: _globalController.qualityOfficerController,
//                         decoration: InputDecoration(
//                             labelText:
//                                 'Quality Assurance Officer Name & Signature'),
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller: _globalController.qualityManagerController,
//                         decoration: InputDecoration(
//                             labelText: 'Quality Manager Name & Signature'),
//                       ),
//                       SizedBox(height: 20),
//                       TextFormField(
//                         controller:
//                             _globalController.supplierRepresentativeController,
//                         decoration: InputDecoration(
//                             labelText:
//                                 'Supplier Representative Name & Signature'),
//                       ),
//                       SizedBox(height: 20),
//                       SizedBox(height: 20),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceAround,
//                         children: [
//                           GestureDetector(
//                               onTap: () {
//                                 // Navigate to the second screen when tapped
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                     builder: (context) => SuccessPage(),
//                                   ),
//                                 );
//                                 storeDataInFirebase();
//                               },
//                               child: PrimaryButtonWidget()),
//                           GestureDetector(
//                             onTap: _resetForm,
//                             child: SecondaryButtonWidget(),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
