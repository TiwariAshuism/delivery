import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:delivery/global/global_veriable.dart';
import 'package:delivery/screens/incoming_inspection/first_page.dart';
import 'package:delivery/widgets/menu_drawer.dart';
import 'package:delivery/widgets/primaryButton.dart';
import 'package:delivery/widgets/secondButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

class TitlePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TitleForm();
  }
}

class TitleForm extends StatefulWidget {
  @override
  State<TitleForm> createState() => _TitleFormState();
}

class _TitleFormState extends State<TitleForm> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchManufacturersAndLocationsFromFirestore();
  }

  GlobalController _globalController = GlobalController();

  void _resetForm() {
    _globalController.dispose();
    // You can also reset other form fields here if needed

    // If you want to clear the text field, you can use something like this:
    // _textEditingController.clear();
  }

  Future<void> fetchManufacturersAndLocationsFromFirestore() async {
    try {
      final manufacturersSnapshot =
          await FirebaseFirestore.instance.collection('manufactor').get();
      _globalController.manufacturers.assignAll(manufacturersSnapshot.docs
          .map((doc) => doc['manufactor'].toString()));

      final locationsSnapshot =
          await FirebaseFirestore.instance.collection('locations').get();
      _globalController.locations.assignAll(
          locationsSnapshot.docs.map((doc) => doc['locations'].toString()));

      final inspectedbySnapshot =
          await FirebaseFirestore.instance.collection('inspectedBy').get();
      _globalController.inspectedByOptions.assignAll(
          inspectedbySnapshot.docs.map((doc) => doc['inspected'].toString()));
    } catch (e) {
      print('Error fetching data from Firestore: $e');
    }
  }

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      _globalController.selectedDate = picked;
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isWideScreen = screenWidth > 600;

    final TextStyle createAccountTextStyle = TextStyle(
      fontSize: isWideScreen ? 24.0 : 18.0,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      body: Obx(() {
        return SingleChildScrollView(
          child: SafeArea(
            maintainBottomViewPadding: true,
            child: Column(
              children: [
                SizedBox(height: isWideScreen ? 20.0 : 10.0),
                Center(
                  child: Text(
                    "Incoming Inspection \nSign !",
                    textAlign: TextAlign.center,
                    style: createAccountTextStyle,
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Lottie.asset(
                    'assets/images/titleanimation.json',
                    width: isWideScreen
                        ? MediaQuery.of(context).size.width * 2
                        : MediaQuery.of(context).size.width * 2,
                    height: isWideScreen
                        ? MediaQuery.of(context).size.height / 2
                        : MediaQuery.of(context).size.height / 2,
                    fit: BoxFit.contain,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: isWideScreen
                        ? MediaQuery.of(context).size.width / 3
                        : MediaQuery.of(context).size.width / 11,
                    right: isWideScreen
                        ? MediaQuery.of(context).size.width / 3
                        : MediaQuery.of(context).size.width / 11,
                    bottom: isWideScreen
                        ? MediaQuery.of(context).size.height / 20
                        : MediaQuery.of(context).size.height / 13,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DropdownButtonFormField<String>(
                        value: _globalController.manufacturerController,
                        dropdownColor: Colors.white,
                        onChanged: (newValue) => _globalController
                            .manufacturerController = newValue!,
                        items:
                            _globalController.manufacturers.map((manufacturer) {
                          return DropdownMenuItem<String>(
                            value: manufacturer,
                            child: Text(manufacturer),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Manufacturer',
                        ),
                      ),
                      SizedBox(height: isWideScreen ? 20.0 : 15.0),
                      DropdownButtonFormField<String>(
                        value: _globalController.locationController,
                        dropdownColor: Colors.white,
                        onChanged: (newValue) =>
                            _globalController.locationController = newValue!,
                        items: _globalController.locations.map((location) {
                          return DropdownMenuItem<String>(
                            value: location,
                            child: Text(location),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Location',
                        ),
                      ),
                      SizedBox(height: isWideScreen ? 20.0 : 15.0),
                      DropdownButtonFormField<String>(
                        dropdownColor: Colors.white,
                        value: _globalController.inspectedByController,
                        onChanged: (newValue) =>
                            _globalController.inspectedByController = newValue!,
                        items: _globalController.inspectedByOptions
                            .map((inspected) {
                          return DropdownMenuItem<String>(
                            value: inspected,
                            child: Text(inspected),
                          );
                        }).toList(),
                        decoration: InputDecoration(
                          labelText: 'Inspected',
                        ),
                      ),
                      SizedBox(height: isWideScreen ? 20.0 : 15.0),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Conducted on',
                          suffixIcon: IconButton(
                            icon: Icon(Icons.calendar_today),
                            onPressed: () {
                              _selectDate(context);
                            },
                          ),
                        ),
                        readOnly: true,
                        onTap: () {
                          _selectDate(context);
                        },
                        controller: TextEditingController(
                          text: _globalController.selectedDate != null
                              ? DateFormat('yyyy-MM-dd')
                                  .format(_globalController.selectedDate!)
                              : '',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => FirstPage());
                        },
                        child: PrimaryButtonWidget(),
                      ),
                      GestureDetector(
                        onTap: _resetForm,
                        child: SecondaryButtonWidget(),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
      appBar: AppBar(
        title: Text("Your App"),
        elevation: 0,
      ),
      drawer: MenuDrawer(),
    );
  }
}
