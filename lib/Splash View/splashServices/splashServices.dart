import 'dart:async';

import 'package:car_rental_app/Authentication/LoginVia.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../view/HomePage.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if(user != null){
      Timer(Duration(seconds: 5), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
                (route) => false);
      });
    }else{
      Timer(Duration(seconds: 5), () {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => LoginVia(),
            ),
                (route) => false);
      });
    }

  }
}
