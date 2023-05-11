import 'package:car_rental_app/Authentication/LoginViaEmail.dart';
import 'package:car_rental_app/Authentication/signupPage.dart';
import 'package:car_rental_app/Component/ValidateBtn.dart';
import 'package:car_rental_app/Toast/CustomToast.dart';
import 'package:car_rental_app/view/HomePage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class userdata extends StatefulWidget {
  const userdata({Key? key}) : super(key: key);

  @override
  State<userdata> createState() => _userdataState();
}

class _userdataState extends State<userdata> {
  final _formfield = GlobalKey<FormState>();
  final usernamecontroller = TextEditingController();
  final emailcontroller = TextEditingController();
  final addresscontroller = TextEditingController();
  final phonecontroller = TextEditingController();
  final firestore = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.height * 0.02,
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignUpPage()));
                    },
                    child: const Icon(
                      Icons.arrow_back,
                      size: 37,
                      semanticLabel: 'Back',
                      shadows: [
                        Shadow(
                            color: Colors.white10,
                            blurRadius: 15.0,
                            offset: Offset(2.0, 4.0))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Hero(
                  tag: 'background',
                  child: SizedBox(
                    height: 120,
                    width: 200,
                    child:
                        Image(image: AssetImage('assets/images/logocar.png')),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            const Text('Create your Profile here',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff282F66))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.04),
              child: Form(
                  key: _formfield,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Username',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff282F66))),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        controller: usernamecontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: Color(0xff282F66),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.indigo, width: 2.0)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the username';
                          } else if (value.length < 4) {
                            return 'Username must have 4 character';
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Email',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff282F66))),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        controller: emailcontroller,
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.email),
                            prefixIconColor: Color(0xff282F66),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.indigo, width: 2.0)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the email';
                          } else if (!value.endsWith('.com')) {
                            return 'please follow the proper format of email';
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Address',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff282F66))),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        controller: addresscontroller,
                        keyboardType: TextInputType.streetAddress,
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.location_history),
                            prefixIconColor: Color(0xff282F66),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.indigo, width: 2.0)),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.indigo))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter the address';
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('Phone No',
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xff282F66))),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormField(
                        controller: phonecontroller,
                        maxLength: 13,
                        keyboardType: TextInputType.numberWithOptions(),
                        decoration: const InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            prefixIconColor: Color(0xff282F66),
                            enabledBorder: OutlineInputBorder(

                                borderSide: BorderSide(
                                    color: Colors.indigo, width: 2.0)),
                            border: OutlineInputBorder(
                                borderSide:
                                BorderSide(color: Colors.indigo))),
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Please enter the phone no';
                          }
                        },
                      ),
                    ],
                  )),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.height * 0.04),
              child: ValidateBtn(
                title: 'Create Profile',
                ontap: () {
                  if (_formfield.currentState!.validate()) {
                    String id = DateTime.now().millisecondsSinceEpoch.toString();
                    firestore.collection('users').doc(id).set({
                      'username': usernamecontroller.text,
                      'email': emailcontroller.text,
                      'address': addresscontroller.text,
                      'uid': auth.currentUser!.uid,
                      'phoneno':phonecontroller.text.toString()
                    }).then((value) {
                      final user = auth.currentUser;
                      for (final userinfo in user!.providerData) {
                        if (userinfo.providerId == 'phone') {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                              (route) => false);
                          debugPrint('Phone No Auth');
                        } else if (userinfo.providerId == 'password') {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginViaEmail(),
                              ),
                              (route) => false);
                          debugPrint('Password Auth');
                        }
                      }
                    }).onError((error, stackTrace) {
                      CustomToast().Toastt(error.toString());
                    });
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
