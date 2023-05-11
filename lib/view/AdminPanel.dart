import 'package:car_rental_app/Component/Custombtn.dart';
import 'package:car_rental_app/view/BookedCars/alluserbookedcars.dart';
import 'package:car_rental_app/view/HomePage.dart';
import 'package:car_rental_app/view/adminCarlist/CarListAdmin.dart';
import 'package:flutter/material.dart';
import 'addcars/AddCars.dart';

class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Card(
                    elevation: 3,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                              (route) => false);
                        },
                        icon: const Icon(
                          Icons.navigate_before_outlined,
                          size: 34,
                          weight: 5.0,
                        )),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Admin Panel',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Icon(
              Icons.admin_panel_settings,
              size: 200,
              color: Color(0xff282F66),
            ),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text('What do you want to do',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: 40, left: 20, right: 20, bottom: 20),
              child: CustomBtn(
                color: Colors.white70,
                icon: Icon(
                  Icons.car_crash_outlined,
                  size: 40,
                ),
                title: 'Add Cars',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCars(),
                      ));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: CustomBtn(
                color: Colors.blueGrey.shade200,
                icon: Icon(
                  Icons.car_repair,
                  size: 40,
                ),
                title: 'Cars List',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdminCarList(),
                      ));
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
              child: CustomBtn(
                color: Colors.white70,
                icon: Icon(
                  Icons.car_rental,
                  size: 40,
                ),
                title: 'Booked Cars',
                ontap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AllUserBookedCars(),
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
