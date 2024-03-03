// import 'dart:io';
// import 'package:animate_do/animate_do.dart';
// import 'package:delivery/global/global_veriable.dart';
// import 'package:delivery/screens/incoming_inspection/third_page.dart';
// import 'package:delivery/widgets/primaryButton.dart';
// import 'package:delivery/widgets/secondButton.dart';
// import 'package:delivery/widgets/togglebutton.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:permission_handler/permission_handler.dart';

// //XFile? _pickedImage;

// class SecondPage extends StatefulWidget {
//   @override
//   _SecondPageState createState() => _SecondPageState();
// }

// class _SecondPageState extends State<SecondPage> {
//   XFile? _pickedImage;

//   Future<void> _pickImage(ImageSource source) async {
//     final permissionStatus = await Permission.camera.request();

//     if (permissionStatus.isGranted) {
//       final picker = ImagePicker();
//       final pickedImage = await picker.pickImage(source: source);

//       setState(() {
//         _pickedImage = pickedImage;
//       });
//     } else {
//       print('Permission denied');
//       // You can show a message or handle the permission denial here.
//     }
//   }

//   Future<void> uploadImageToFirebase(XFile pickedImage) async {
//     final FirebaseStorage storage = FirebaseStorage.instance;
//     final path = "images/${_pickImage}";
//     final file = File(_pickedImage!.path);
//     final Reference storageReference =
//         storage.ref().child(path); // Define a storage reference

//     final UploadTask uploadTask = storageReference.putFile(file);
//     imageUrl = (await storageReference.getDownloadURL());

//     uploadTask.then((TaskSnapshot snapshot) {
//       print('Image uploaded to Firebase Storage');

//       // Handle the completion of the upload here if needed
//     }).catchError((error) {
//       print('Error uploading image to Firebase Storage: $error');
//       // Handle the error here if needed
//     });

//     // Return immediately without waiting for the upload to finish
//     return;
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null && picked != selectedDateData)
//       setState(() {
//         selectedDateData = picked;
//       });
//   }

//   void _resetForm() {
//     // Reset text field controllers

//     pickedImageController.clear();

//     // Reset toggle button selections
//     field1Selected = [true, false, false];
//     field2Selected = [true, false, false];
//     field3Selected = [true, false, false];
//     field4Selected = [true, false, false];
//     field5Selected = [true, false, false];
//     field6Selected = [true, false, false];

//     // Reset selected date
//     setState(() {
//       selectedDateData = null;
//     });

//     // Reset picked image
//     setState(() {
//       _pickedImage = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(20.0),
//           child: FadeInRightBig(
//             child: Column(
//               children: [
//                 const Center(
//                   child: Text(
//                     "Steps \t2/3 ",
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
//                 TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                       labelText: 'Purchase order specifications',
//                       prefixIcon: Icon(Icons.shop_two)),
//                 ),
//                 SizedBox(height: 10),
//                 _buildToggleButtonsField1(),
//                 SizedBox(height: 20),
//                 TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                       labelText: 'Color', prefixIcon: Icon(Icons.palette)),
//                 ),
//                 SizedBox(height: 10),
//                 _buildToggleButtonsField2(),
//                 SizedBox(height: 20),
//                 TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                       labelText: 'Shape',
//                       prefixIcon: Icon(Icons.format_shapes)),
//                 ),
//                 SizedBox(height: 10),
//                 _buildToggleButtonsField3(),
//                 SizedBox(height: 20),
//                 TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                       labelText: 'Markings',
//                       prefixIcon: Icon(Icons.format_shapes)),
//                 ),
//                 SizedBox(height: 10),
//                 _buildToggleButtonsField4(),
//                 SizedBox(height: 20),
//                 TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                       labelText: 'Packaging',
//                       prefixIcon: Icon(Icons.format_shapes)),
//                 ),
//                 SizedBox(height: 10),
//                 _buildToggleButtonsField5(),
//                 SizedBox(height: 20),
//                 TextField(
//                   enabled: false,
//                   decoration: InputDecoration(
//                       labelText: 'Are there minor defects?',
//                       prefixIcon: Icon(Icons.format_shapes)),
//                 ),
//                 SizedBox(height: 10),
//                 _buildToggleButtonsField6(),
//                 SizedBox(height: 20),
//                 TextFormField(
//                   decoration: InputDecoration(
//                     labelText: 'Conducted on',
//                     suffixIcon: IconButton(
//                       icon: Icon(Icons.calendar_today),
//                       onPressed: () {
//                         _selectDate(context);
//                       },
//                     ),
//                   ),
//                   readOnly: true,
//                   onTap: () {
//                     _selectDate(context);
//                   },
//                   controller: TextEditingController(
//                     text: selectedDateData != null
//                         ? DateFormat('yyyy-MM-dd').format(selectedDateData!)
//                         : '',
//                   ),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Column(
//                   children: [
//                     TextFormField(
//                       readOnly: true,
//                       controller: pickedImageController,
//                       decoration: InputDecoration(
//                         labelText: 'Select Image',
//                         suffixIcon: ElevatedButton(
//                           onPressed: () {
//                             showDialog(
//                               context: context,
//                               builder: (BuildContext context) {
//                                 return AlertDialog(
//                                   backgroundColor: Colors.white,
//                                   title: Text('Select Image Source'),
//                                   actions: <Widget>[
//                                     TextButton(
//                                       child: Text('Camera'),
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                         _pickImage(ImageSource.camera);
//                                       },
//                                     ),
//                                     TextButton(
//                                       child: Text('Gallery'),
//                                       onPressed: () {
//                                         Navigator.of(context).pop();
//                                         _pickImage(ImageSource.gallery);
//                                       },
//                                     ),
//                                   ],
//                                 );
//                               },
//                             );
//                           },
//                           child: Text('Pick Image'),
//                         ),
//                       ),
//                     ),
//                     if (_pickedImage != null)
//                       Padding(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(10),
//                           child: Image.file(
//                             File(_pickedImage!.path),
//                             height: MediaQuery.of(context).size.height / 5,
//                           ),
//                         ),
//                       ),
//                     GestureDetector(
//                       onTap:
//                           navigateToNextPage, // Call the function when the button is pressed
//                       child: PrimaryButtonWidget(),
//                     ),
//                     GestureDetector(
//                       onTap: _resetForm,
//                       child: SecondaryButtonWidget(),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   List<String> _statuses = ['Accepted', 'Partially Accepted', 'Rejected'];

//   String _getStatusField1() {
//     return _statuses[field1Selected.indexOf(true)];
//   }

//   String _getStatusField2() {
//     return _statuses[field2Selected.indexOf(true)];
//   }

//   String _getStatusField3() {
//     return _statuses[field3Selected.indexOf(true)];
//   }

//   String _getStatusField4() {
//     return _statuses[field4Selected.indexOf(true)];
//   }

//   String _getStatusField5() {
//     return _statuses[field5Selected.indexOf(true)];
//   }

//   String _getStatusField6() {
//     return _statuses[field6Selected.indexOf(true)];
//   }

//   void updateFieldStatus() {
//     field1Status = _getStatusField1();
//     field2Status = _getStatusField2();
//     field3Status = _getStatusField3();
//     field4Status = _getStatusField4();
//     field5Status = _getStatusField5();
//     field6Status = _getStatusField6();
//   }

// // Inside your _SecondPageState class, add this function to navigate to the next page
//   void navigateToNextPage() {
//     // Call the function to update the field statuses
//     updateFieldStatus();
//     if (_pickedImage != null) {
//       uploadImageToFirebase(_pickedImage!);
//     }

//     // Navigate to the next page (e.g., ThirdPage or SubmitPage)
//     Navigator.push(
//       context,
//       MaterialPageRoute(
//         builder: (context) =>
//             ThirdPage(), // Replace with your desired next page
//       ),
//     );
//   }

//   Widget _buildToggleButtonsField1() {
//     return ToggleButtons(
//       children: [
//         ToggleButtonLabel(text: 'Accepted'),
//         ToggleButtonLabel(text: 'Partially Accepted'),
//         ToggleButtonLabel(text: 'Rejected'),
//       ],
//       isSelected: field1Selected,
//       onPressed: (int index) {
//         setState(() {
//           for (int buttonIndex = 0;
//               buttonIndex < field1Selected.length;
//               buttonIndex++) {
//             if (buttonIndex == index) {
//               field1Selected[buttonIndex] = true;
//             } else {
//               field1Selected[buttonIndex] = false;
//             }
//           }
//         });
//       },
//     );
//   }

//   Widget _buildToggleButtonsField2() {
//     return ToggleButtons(
//       children: [
//         ToggleButtonLabel(text: 'Accepted'),
//         ToggleButtonLabel(text: 'Partially Accepted'),
//         ToggleButtonLabel(text: 'Rejected'),
//       ],
//       isSelected: field2Selected,
//       onPressed: (int index) {
//         setState(() {
//           for (int buttonIndex = 0;
//               buttonIndex < field2Selected.length;
//               buttonIndex++) {
//             if (buttonIndex == index) {
//               field2Selected[buttonIndex] = true;
//             } else {
//               field2Selected[buttonIndex] = false;
//             }
//           }
//         });
//       },
//     );
//   }

//   Widget _buildToggleButtonsField3() {
//     return ToggleButtons(
//       children: [
//         ToggleButtonLabel(text: 'Accepted'),
//         ToggleButtonLabel(text: 'Partially Accepted'),
//         ToggleButtonLabel(text: 'Rejected'),
//       ],
//       isSelected: field3Selected,
//       onPressed: (int index) {
//         setState(() {
//           for (int buttonIndex = 0;
//               buttonIndex < field3Selected.length;
//               buttonIndex++) {
//             if (buttonIndex == index) {
//               field3Selected[buttonIndex] = true;
//             } else {
//               field3Selected[buttonIndex] = false;
//             }
//           }
//         });
//       },
//     );
//   }

//   Widget _buildToggleButtonsField4() {
//     return ToggleButtons(
//       children: [
//         ToggleButtonLabel(text: 'Accepted'),
//         ToggleButtonLabel(text: 'Partially Accepted'),
//         ToggleButtonLabel(text: 'Rejected'),
//       ],
//       isSelected: field4Selected,
//       onPressed: (int index) {
//         setState(() {
//           for (int buttonIndex = 0;
//               buttonIndex < field4Selected.length;
//               buttonIndex++) {
//             if (buttonIndex == index) {
//               field4Selected[buttonIndex] = true;
//             } else {
//               field4Selected[buttonIndex] = false;
//             }
//           }
//         });
//       },
//     );
//   }

//   Widget _buildToggleButtonsField5() {
//     return ToggleButtons(
//       children: [
//         ToggleButtonLabel(text: 'Accepted'),
//         ToggleButtonLabel(text: 'Partially Accepted'),
//         ToggleButtonLabel(text: 'Rejected'),
//       ],
//       isSelected: field5Selected,
//       onPressed: (int index) {
//         setState(() {
//           for (int buttonIndex = 0;
//               buttonIndex < field5Selected.length;
//               buttonIndex++) {
//             if (buttonIndex == index) {
//               field5Selected[buttonIndex] = true;
//             } else {
//               field5Selected[buttonIndex] = false;
//             }
//           }
//         });
//       },
//     );
//   }

//   Widget _buildToggleButtonsField6() {
//     return ToggleButtons(
//       children: [
//         ToggleButtonLabel(text: 'Accepted'),
//         ToggleButtonLabel(text: 'Partially Accepted'),
//         ToggleButtonLabel(text: 'Rejected'),
//       ],
//       isSelected: field6Selected,
//       onPressed: (int index) {
//         setState(() {
//           for (int buttonIndex = 0;
//               buttonIndex < field6Selected.length;
//               buttonIndex++) {
//             if (buttonIndex == index) {
//               field6Selected[buttonIndex] = true;
//             } else {
//               field6Selected[buttonIndex] = false;
//             }
//           }
//         });
//       },
//     );
//   }
// }
