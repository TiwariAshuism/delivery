// import 'package:animate_do/animate_do.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:delivery/global/global_veriable.dart';
// import 'package:delivery/screens/incoming_inspection/second_page.dart';
// import 'package:delivery/widgets/menu_drawer.dart';
// import 'package:delivery/widgets/primaryButton.dart';
// import 'package:delivery/widgets/secondButton.dart';
// import 'package:flutter/material.dart';

// class FirstPage extends StatefulWidget {
//   @override
//   _FirstPageState createState() => _FirstPageState();
// }

// class _FirstPageState extends State<FirstPage> {
//   @override
//   void initState() {
//     initTextControllers();
//     _resetForm();
//     fetchAddressAndSupplierFromFirebase();
//     super.initState();
//   }

//   void fetchAddressAndSupplierFromFirebase() async {
//     try {
//       QuerySnapshot supplierbySnapshot =
//           await FirebaseFirestore.instance.collection('suppliers').get();
//       List<String> fetchedSupplier = supplierbySnapshot.docs
//           .map((doc) => doc['suppliersName'].toString())
//           .toList();

//       QuerySnapshot addressbySnapshot =
//           await FirebaseFirestore.instance.collection('address').get();
//       List<String> fetchedAddress = addressbySnapshot.docs
//           .map((doc) => doc['address'].toString())
//           .toList();

//       setState(() {
//         suppliers = fetchedSupplier;
//         addresses = fetchedAddress;
//       });

//       // Now, your 'manufacturers' and 'locations' lists contain the data fetched from Firestore.
//     } catch (e) {
//       print('Error fetching data from Firestore: $e');
//       setState(() {
//         manufacturers = "Error" as List<String>;
//         locations = "Error" as List<String>;
//       });
//     }
//   }

//   void _resetForm() {
//     supplierNameController = null;
//     addressController = null;
//     purchaseNumberController.clear();
//     materialNameController.clear();
//     descriptionController.clear();
//     quantityController.clear();
//     sampleSizeController.clear();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final double screenWidth = MediaQuery.of(context).size.width;
//     final bool isWideScreen = screenWidth > 600;
//     return Scaffold(
//       body: SafeArea(
//         child: FadeInRightBig(
//           child: Container(
//             constraints:
//                 BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(
//                 horizontal: isWideScreen
//                     ? MediaQuery.of(context).size.width / 3
//                     : MediaQuery.of(context).size.width / 15,
//                 vertical: isWideScreen
//                     ? MediaQuery.of(context).size.height / 30
//                     : MediaQuery.of(context).size.height / 30,
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Stack(
//                     alignment: Alignment.center,
//                     children: [
//                       Container(
//                         padding: EdgeInsets.all(80),
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: AssetImage(
//                                 'assets/images/secondpage.jpg'), // Replace with your image asset
//                             fit: BoxFit.cover,
//                           ),
//                           borderRadius: BorderRadius.circular(20.0),
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.black.withOpacity(0.4),
//                               blurRadius: 5.0,
//                               spreadRadius: 2.0,
//                             ),
//                           ],
//                         ),
//                       ),
//                       Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(
//                             "Steps 1/3",
//                             style: TextStyle(
//                                 fontWeight: FontWeight.w800,
//                                 fontSize: 24,
//                                 color: Color.fromARGB(255, 255, 255, 255)),
//                           ),
//                           SizedBox(height: 10),
//                           Text(
//                             "Incoming Inspection\nSign !",
//                             textAlign: TextAlign.center,
//                             style: TextStyle(
//                               fontSize: 24,
//                               color: Color.fromARGB(255, 255, 255, 255),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: isWideScreen ? 20.0 : 10.0),
//                   DropdownButtonFormField<String>(
//                     dropdownColor: Colors.white,
//                     value: supplierNameController,
//                     onChanged: (newValue) {
//                       setState(() {
//                         supplierNameController = newValue;
//                       });
//                     },
//                     items: suppliers.map((supplier) {
//                       return DropdownMenuItem<String>(
//                         value: supplier,
//                         child: Text(supplier),
//                       );
//                     }).toList(), // Only one item in the dropdown
//                     decoration: InputDecoration(
//                       labelText: 'Supplier Name',
//                     ),
//                   ),
//                   SizedBox(height: isWideScreen ? 20.0 : 10.0),
//                   DropdownButtonFormField<String>(
//                     dropdownColor: Colors.white,
//                     value: addressController,
//                     onChanged: (newValue) {
//                       setState(() {
//                         addressController = newValue;
//                       });
//                     },
//                     items: addresses.map((addresses) {
//                       return DropdownMenuItem<String>(
//                         value: addresses,
//                         child: Text(addresses),
//                       );
//                     }).toList(), // Only one item in the dropdown
//                     decoration: InputDecoration(
//                       labelText: 'Address',
//                     ),
//                   ),

//                   SizedBox(
//                       height: isWideScreen ? 20.0 : 10.0), // Add spacing here
//                   TextFormField(
//                     controller: purchaseNumberController,
//                     decoration: InputDecoration(labelText: 'Purchase Number'),
//                   ),
//                   SizedBox(
//                       height: isWideScreen ? 20.0 : 10.0), // Add spacing here
//                   TextFormField(
//                     controller: materialNameController,
//                     decoration: InputDecoration(labelText: 'Material Name'),
//                   ),
//                   SizedBox(
//                       height: isWideScreen ? 20.0 : 10.0), // Add spacing here
//                   TextFormField(
//                     controller: descriptionController,
//                     decoration: InputDecoration(labelText: 'Description'),
//                   ),
//                   SizedBox(
//                       height: isWideScreen ? 20.0 : 10.0), // Add spacing here
//                   TextFormField(
//                     controller: quantityController,
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(labelText: 'Quantity (Number)'),
//                   ),
//                   SizedBox(
//                       height: isWideScreen ? 20.0 : 10.0), // Add spacing here
//                   TextFormField(
//                     controller: sampleSizeController,
//                     keyboardType: TextInputType.number,
//                     decoration:
//                         InputDecoration(labelText: 'Sample Size (Number)'),
//                   ),
//                   // Add spacing here
//                   GestureDetector(
//                       onTap: () {
//                         // Navigate to the second screen when tapped
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => SecondPage(),
//                           ),
//                         );
//                       },
//                       child: PrimaryButtonWidget()),
//                   GestureDetector(
//                     onTap: _resetForm,
//                     child: SecondaryButtonWidget(),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//       drawer: MenuDrawer(),
//       appBar: AppBar(
//         title: Text("AppBar"),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: Text("context")),
      ),
    );
  }
}
