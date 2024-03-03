// import 'package:delivery/global/global_veriable.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:intl/intl.dart';
// import 'package:lottie/lottie.dart';
// import 'package:pdf/pdf.dart';
// import 'package:pdf/widgets.dart' as pdfWid;
// import 'package:printing/printing.dart';

// class SuccessPage extends StatefulWidget {
//   @override
//   _SuccessPageState createState() => _SuccessPageState();
// }

// class _SuccessPageState extends State<SuccessPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Background Lottie Animation

//           Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 // Lottie Animation on Top
//                 Lottie.asset('assets/images/DoneAnimation.json'),

//                 // Message
//                 Text(
//                   'Success!',
//                   style: TextStyle(
//                     fontSize: 24,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),

//                 // Button to Save PDF
//                 ElevatedButton(
//                   onPressed: () async {
//                     // Navigate to the PrintPage to generate and preview the PDF
//                     Navigator.of(context).push(MaterialPageRoute(
//                       builder: (context) => PrintPage(),
//                     ));
//                   },
//                   child: Text('Save as PDF'),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class PrintPage extends StatefulWidget {
//   const PrintPage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   _PrintPageState createState() => _PrintPageState();
// }

// class _PrintPageState extends State<PrintPage> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PdfPreview(
//         build: (format) => _createPdf(format),
//       ),
//     );
//   }

//   Future<Uint8List> _createPdf(PdfPageFormat format) async {
//     final pdf = pdfWid.Document(
//       version: PdfVersion.pdf_1_4,
//       compress: true,
//     );

//     final iconImage = (await rootBundle.load('assets/images/avatar.png'))
//         .buffer
//         .asUint8List();

//     final tableHeaders = [
//       'Description',
//       'List',
//     ];

//     final tableData = [
//       [
//         "Manufacturer",
//         manufacturerController.toString(),
//       ],
//       [
//         "Location",
//         locationController.toString(),
//       ],
//       [
//         "Inspected by  ",
//         inspectedByController.toString(),
//       ],
//       [
//         'Conducted on ',
//         selectedDate != null
//             ? DateFormat("yyyy-MM-dd").format(selectedDate!)
//             : 'N/A',
//       ],
//       ["Additional Comments", commentsController.text.toString()],
//       ["Quality Officer", qualityOfficerController.text.toString()],
//       ["Quality Manager", qualityManagerController.text.toString()],
//       [
//         "Supplier Representative",
//         supplierRepresentativeController.text.toString(),
//       ],
//       ["Supplier Name", supplierNameController.toString()],
//       ["Address", addressController.toString()],
//       ["Purchase Number", purchaseNumberController.text.toString()],
//       ["Material Name", materialNameController.text.toString()],
//       ["Description", descriptionController.text.toString()],
//       ["Quantity", quantityController.text.toString()],
//       ["Sample Size", sampleSizeController.text.toString()],
//       ["Purchase order specifications", field1Status],
//       ["Color", field2Status],
//       ["Shape", field3Status],
//       ["Markings", field4Status],
//       ["Packaging", field2Status],
//       ["Are there minor defects?", field5Status],
//       ["Markings", field6Status],
//       [
//         'Conducted on ',
//         selectedDateData != null
//             ? DateFormat("yyyy-MM-dd").format(selectedDateData!)
//             : 'N/A',
//       ],
//     ];

//     pdf.addPage(
//       pdfWid.MultiPage(
//         build: (context) {
//           return [
//             pdfWid.Row(
//               children: [
//                 pdfWid.Image(
//                   pdfWid.MemoryImage(iconImage),
//                   height: 72,
//                   width: 72,
//                 ),
//                 pdfWid.SizedBox(width: 1 * PdfPageFormat.mm),
//                 pdfWid.Column(
//                   mainAxisSize: pdfWid.MainAxisSize.min,
//                   crossAxisAlignment: pdfWid.CrossAxisAlignment.start,
//                   children: [
//                     pdfWid.Text(
//                       'INVOICE',
//                       style: pdfWid.TextStyle(
//                         fontSize: 17.0,
//                         fontWeight: pdfWid.FontWeight.bold,
//                       ),
//                     ),
//                     pdfWid.Text(
//                       'Flutter Approach',
//                       style: const pdfWid.TextStyle(
//                         fontSize: 15.0,
//                         color: PdfColors.grey700,
//                       ),
//                     ),
//                   ],
//                 ),
//                 pdfWid.Spacer(),
//                 pdfWid.Column(
//                   mainAxisSize: pdfWid.MainAxisSize.min,
//                   crossAxisAlignment: pdfWid.CrossAxisAlignment.start,
//                   children: [
//                     pdfWid.Text(
//                       'John Doe',
//                       style: pdfWid.TextStyle(
//                         fontSize: 15.5,
//                         fontWeight: pdfWid.FontWeight.bold,
//                       ),
//                     ),
//                     pdfWid.Text(
//                       'john@gmail.com',
//                     ),
//                     pdfWid.Text(
//                       DateTime.now().toString(),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             pdfWid.SizedBox(height: 1 * PdfPageFormat.mm),
//             pdfWid.Divider(),
//             pdfWid.SizedBox(height: 1 * PdfPageFormat.mm),
//             pdfWid.Text(
//               'Dear John,\nLorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia, molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit, tenetur error',
//               textAlign: pdfWid.TextAlign.justify,
//             ),
//             pdfWid.SizedBox(height: 5 * PdfPageFormat.mm),

//             ///
//             /// PDF Table Create
//             ///
//             pdfWid.TableHelper.fromTextArray(
//               headers: tableHeaders,
//               data: tableData,
//               border: const pdfWid.TableBorder(
//                 left: pdfWid.BorderSide(),
//                 top: pdfWid.BorderSide(),
//                 right: pdfWid.BorderSide(),
//                 bottom: pdfWid.BorderSide(),
//                 horizontalInside: pdfWid.BorderSide(),
//                 verticalInside: pdfWid.BorderSide(),
//               ),
//               headerStyle: pdfWid.TextStyle(fontWeight: pdfWid.FontWeight.bold),
//               headerDecoration: const pdfWid.BoxDecoration(
//                 color: PdfColors.grey300,
//               ),
//             ),
//           ];
//         },
//         footer: (context) {
//           return pdfWid.Column(
//             mainAxisSize: pdfWid.MainAxisSize.min,
//             children: [
//               pdfWid.Divider(),
//               pdfWid.SizedBox(height: 2 * PdfPageFormat.mm),
//               pdfWid.Text(
//                 'Flutter Approach',
//                 style: pdfWid.TextStyle(fontWeight: pdfWid.FontWeight.bold),
//               ),
//               pdfWid.SizedBox(height: 1 * PdfPageFormat.mm),
//               pdfWid.Row(
//                 mainAxisAlignment: pdfWid.MainAxisAlignment.center,
//                 children: [
//                   pdfWid.Text(
//                     'Address: ',
//                     style: pdfWid.TextStyle(fontWeight: pdfWid.FontWeight.bold),
//                   ),
//                   pdfWid.Text(
//                     'Address, Address, Dhaka 1212',
//                   ),
//                 ],
//               ),
//               pdfWid.SizedBox(height: 1 * PdfPageFormat.mm),
//               pdfWid.Row(
//                 mainAxisAlignment: pdfWid.MainAxisAlignment.center,
//                 children: [
//                   pdfWid.Text(
//                     'Email: ',
//                     style: pdfWid.TextStyle(fontWeight: pdfWid.FontWeight.bold),
//                   ),
//                   pdfWid.Text(
//                     'flutterapproach@gmail.com',
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//     return pdf.save();
//   }
// }
