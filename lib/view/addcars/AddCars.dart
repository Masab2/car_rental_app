import 'package:car_rental_app/Component/List.dart';
import 'package:car_rental_app/Component/ValidateBtn.dart';
import 'package:car_rental_app/Toast/CustomToast.dart';
import 'package:car_rental_app/view/AdminPanel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../../Component/customdropDown.dart';
import '../../Toast/customsnackbar.dart';

class AddCars extends StatefulWidget {
  const AddCars({Key? key}) : super(key: key);

  @override
  State<AddCars> createState() => _AddCarsState();
}

class _AddCarsState extends State<AddCars> {
  final categorycontroller = TextEditingController();
  final makecontroller = TextEditingController();
  final modelcontroller = TextEditingController();
  final modelyearcontroller = TextEditingController();
  final pricecontroller = TextEditingController();
  var fuel = ['Petrol', 'Desil', 'CNG', 'LPG', 'Hybrid', 'Electric'];
  var transmission = ['Automatic', 'Manual'];
  var selectOptionfuel = 'Select Option';
  var selectOptiontrans = 'Select Option';
  bool isopen = false;
  bool isOpentrans = false;
  File? _image;
  final picker = ImagePicker();
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  final firestore = FirebaseFirestore.instance.collection('Cars');

  Future getImage() async {
    final pickedimage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    setState(() {
      if (pickedimage != null) {
        _image = File(pickedimage.path);
      } else {
        CustomToast().Toastt('No Image Selected');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Cars'),
        elevation: 10,
        scrolledUnderElevation: 2.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                getImage();
              },
              child: _image == null
                  ? Container(
                      height: MediaQuery.of(context).size.height * 0.27,
                      width: MediaQuery.of(context).size.width * 0.93,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomLeft,
                          colors: [Colors.indigo.shade900, Colors.indigoAccent],
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add_circle_outline,
                            size: 45,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Add Images',
                            style: TextStyle(
                                fontSize: 26, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: MediaQuery.of(context).size.height * 0.27,
                      width: MediaQuery.of(context).size.width * 0.93,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: FileImage(_image!.absolute),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    children: const [
                      Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ListCars(
                    text: 'Vehicle',
                    leading: const CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.indigo,
                      child: Icon(
                        Icons.car_repair,
                        size: 37,
                      ),
                    ),
                    hinttext: 'cars,jeep,bike',
                    controller: categorycontroller),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.03),
                  child: Column(
                    children: [
                      ListCars(
                          text: 'Make',
                          hinttext: 'Car Brand',
                          controller: makecontroller),
                      SizedBox(
                        height: 20,
                      ),
                      ListCars(
                          text: 'Model',
                          hinttext: 'Car Model',
                          controller: modelcontroller),
                      SizedBox(
                        height: 20,
                      ),
                      ListCars(
                          text: 'Model Year',
                          hinttext: 'Car Model year',
                          controller: modelyearcontroller),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    children: const [
                      Text(
                        'Price Per Day',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: TextFormField(
                    controller: pricecontroller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.calculate),
                        prefixIconColor: Color(0xff282F66),
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.indigo, width: 2.0)),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.indigo))),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    children: const [
                      Text(
                        'Fuel',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomDropDown(
                    selectOption: selectOptionfuel,
                    fuel: fuel,
                    ontap: () {
                      isopen = !isopen;
                      setState(() {});
                    },
                    icon: isopen
                        ? Icon(
                            Icons.arrow_drop_up_outlined,
                            size: 35,
                            color: Colors.indigo,
                          )
                        : Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 35,
                            color: Colors.indigo,
                          )),
                if (isopen)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.04),
                    child: ListView(
                        primary: true,
                        shrinkWrap: true,
                        children: fuel.map((e) {
                          return Column(
                            children: [
                              InkWell(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Text(e),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  selectOptionfuel = e;
                                  isopen = false;
                                  setState(() {});
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Divider(
                                  thickness: 0.09,
                                  height: 0.07,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        }).toList()),
                  ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: MediaQuery.of(context).size.width * 0.05),
                  child: Row(
                    children: const [
                      Text(
                        'Transmission',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomDropDown(
                    selectOption: selectOptiontrans,
                    fuel: transmission,
                    ontap: () {
                      isOpentrans = !isOpentrans;
                      setState(() {});
                    },
                    icon: isOpentrans
                        ? Icon(
                            Icons.arrow_drop_up_outlined,
                            size: 35,
                            color: Colors.indigo,
                          )
                        : Icon(
                            Icons.arrow_drop_down_sharp,
                            size: 35,
                            color: Colors.indigo,
                          )),
                if (isOpentrans)
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.04),
                    child: ListView(
                        primary: true,
                        shrinkWrap: true,
                        children: transmission.map((e) {
                          return Column(
                            children: [
                              InkWell(
                                child: Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.rectangle,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(e),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  selectOptiontrans = e;
                                  isOpentrans = false;
                                  setState(() {});
                                },
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 4),
                                child: Divider(
                                  thickness: 0.09,
                                  height: 0.07,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          );
                        }).toList()),
                  ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.04,
                right: MediaQuery.of(context).size.width * 0.04,
                bottom: MediaQuery.of(context).size.width * 0.04,
              ),
              child: ValidateBtn(
                title: 'Add Car',
                ontap: () {
                  validate();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  void validate() async {
    if (categorycontroller.text.isEmpty &&
        makecontroller.text.isEmpty &&
        modelcontroller.text.isEmpty &&
        modelyearcontroller.text.isEmpty &&
        pricecontroller.text.isEmpty &&
        selectOptionfuel == 'Select Option' &&
        selectOptiontrans == 'Select Option' &&
        _image == null) {
      CustomSnackbar().snackbar('Please enter the data', context);
    } else if (_image == null) {
      CustomSnackbar().snackbar('Please Select an Image ', context);
    } else if (categorycontroller.text.isEmpty) {
      CustomSnackbar().snackbar('Please Select the category', context);
    } else if (makecontroller.text.isEmpty) {
      CustomSnackbar().snackbar('Please Select the brand of the car', context);
    } else if (modelcontroller.text.isEmpty) {
      CustomSnackbar().snackbar('Please Select the model of the car', context);
    } else if (modelyearcontroller.text.isEmpty) {
      CustomSnackbar()
          .snackbar('Please Select the model year of the car', context);
    } else if (pricecontroller.text.isEmpty) {
      CustomSnackbar().snackbar('Please Select the price ', context);
    } else if (selectOptionfuel == 'Select Option') {
      CustomSnackbar().snackbar('Please Select the fuel', context);
    } else if (selectOptiontrans == 'Select Option') {
      CustomSnackbar().snackbar('Please Select the transmission ', context);
    } else {
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
          .ref('/carsimages/' + 'Images' + DateTime.now().millisecondsSinceEpoch.toString());
      firebase_storage.UploadTask uploadTask = ref.putFile(_image!.absolute);
      Future.value(uploadTask).then((value) async {
        var newurl = await ref.getDownloadURL();
        String id = DateTime.now().microsecondsSinceEpoch.toString();
        firestore.doc(id).set({
          'id': id,
          'image': newurl.toString(),
          'category': categorycontroller.text,
          'make': makecontroller.text,
          'model': modelcontroller.text,
          'modelyear': modelyearcontroller.text,
          'price': pricecontroller.text.toString(),
          'fuel': selectOptionfuel,
          'transmission': selectOptiontrans
        });
        CustomSnackbar().snackbar('Car Added Succsessfully', context);
      }).onError((error, stackTrace) {
        CustomSnackbar().snackbar(error.toString(), context);
      });
    }
  }
}
