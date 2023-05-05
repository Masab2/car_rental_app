import 'package:car_rental_app/Splash%20View/splashServices/splashServices.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices services = SplashServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    services.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Hero(
              tag: 'background',
              child: Container(
                height: MediaQuery.of(context).size.height * 0.40,
                width: MediaQuery.of(context).size.height * 0.60,
                child: Column(
                  children: [
                    const Image(image: AssetImage('assets/images/logocar.png')),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text('Car Rental App',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff282F66))),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
