import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalController extends GetxController {
  DateTime? selectedDate;
  List<dynamic> manufacturers = <dynamic>[].obs;
  List<String> locations = <String>[].obs;
  List<String> inspectedByOptions = <String>[].obs;
  List<String> suppliers = <String>[].obs;
  List<String> addresses = <String>[].obs;
  String? manufacturerController;
  String? locationController;
  String? inspectedByController;
  String? supplierNameController;
  String? addressController;
  String? imageUrl;

  final TextEditingController commentsController = TextEditingController();
  final TextEditingController qualityOfficerController =
      TextEditingController();
  final TextEditingController qualityManagerController =
      TextEditingController();
  final TextEditingController supplierRepresentativeController =
      TextEditingController();

  final TextEditingController purchaseNumberController =
      TextEditingController();
  final TextEditingController materialNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController quantityController = TextEditingController();
  final TextEditingController sampleSizeController = TextEditingController();

  final TextEditingController pickedImageController = TextEditingController();
  String field1Status = '';
  String field2Status = '';
  String field3Status = '';
  String field4Status = '';
  String field5Status = '';
  String field6Status = '';
  List<bool> field1Selected = [true, false, false].obs;
  List<bool> field2Selected = [true, false, false].obs;
  List<bool> field3Selected = [true, false, false].obs;
  List<bool> field4Selected = [true, false, false].obs;
  List<bool> field5Selected = [true, false, false].obs;
  List<bool> field6Selected = [true, false, false].obs;

  DateTime? selectedDateData;

  void initGlobalVariables() {
    // Initialize your global variables here
    pickedImageController.text = '';

    field1Selected = [true, false, false];
    field2Selected = [true, false, false];
    field3Selected = [true, false, false];
    field4Selected = [true, false, false];
    field5Selected = [true, false, false];
    field6Selected = [true, false, false];
    selectedDateData = null;
  }

  void initTextControllers() {
    // Initialize the text controllers here
    // Set your initial values here

    purchaseNumberController.text = '';
    materialNameController.text = '';
    descriptionController.text = '';
    quantityController.text = '';
    sampleSizeController.text = '';
  }
}

final GlobalController globalController = Get.put(GlobalController());
