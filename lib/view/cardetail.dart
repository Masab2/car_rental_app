import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter_sms/flutter_sms.dart';
import '../../Component/customspecs.dart';
import '../Toast/CustomToast.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
class CarDetail extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  const CarDetail({Key? key, required this.documentSnapshot})
      : super(
          key: key,
        );

  @override
  State<CarDetail> createState() => _CarDetailState();
}

void message(String message, List<String> recipients) async {
  String msg = await sendSMS(message: message, recipients: recipients)
      .catchError((onError) {
    debugPrint(onError);
  });
}
void Emailsender(String emailbody,String emailsubject, List<String> recipentemail) async{
  var email = Email(
    body: emailbody,
    subject: emailsubject,
    recipients: recipentemail,
  );
}

class _CarDetailState extends State<CarDetail> {
  var bookingdays = 0;
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black38,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    'Vehicle Detail',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.40,
              width: double.infinity,
              child: ClipRRect(
                child: Image(
                  image: NetworkImage(widget.documentSnapshot['image']),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: Row(
                children: const [
                  Text(
                    'Specification',
                    style: TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold, height: 3),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.03),
                child: Row(
                  children: [
                    CustomSpecs(
                      icon: const Icon(
                        Icons.local_gas_station,
                        size: 30,
                      ),
                      text: widget.documentSnapshot['fuel'].toString(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    CustomSpecs(
                      icon: const Icon(
                        CupertinoIcons.car_detailed,
                        size: 30,
                      ),
                      text: widget.documentSnapshot['make'].toString(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    CustomSpecs(
                      icon: const Icon(
                        CupertinoIcons.car,
                        size: 30,
                      ),
                      text: widget.documentSnapshot['model'].toString(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    CustomSpecs(
                      icon: const Icon(
                        CupertinoIcons.timer_fill,
                        size: 30,
                      ),
                      text: widget.documentSnapshot['modelyear'].toString(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    CustomSpecs(
                      icon: const Icon(
                        CupertinoIcons.gear_alt,
                        size: 30,
                      ),
                      text: widget.documentSnapshot['transmission'].toString(),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.04,
                    ),
                    CustomSpecs(
                      icon: const Icon(
                        Icons.car_repair,
                        size: 30,
                      ),
                      text: widget.documentSnapshot['category'].toString(),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Booking Days : ',
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                        wordSpacing: 1,
                        height: 1,
                        textBaseline: TextBaseline.alphabetic),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueGrey,
                        ),
                        child: InkWell(
                          onTap: () {
                            if (bookingdays == 0) {
                              bookingdays == 0;
                              setState(() {});
                            } else {
                              bookingdays--;
                              setState(() {});
                            }
                          },
                          child: const Center(
                              child: Text(
                            '-',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 19,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Text(
                        '$bookingdays',
                        style: TextStyle(height: 1),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.indigo,
                        ),
                        child: InkWell(
                          onTap: () {
                            bookingdays++;
                            setState(() {});
                          },
                          child: const Center(
                              child: Text(
                            '+',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          )),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.08,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: MediaQuery.of(context).size.height * 0.01,
                  horizontal: MediaQuery.of(context).size.height * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.09,
                      child: Center(
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Rs ',
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                widget.documentSnapshot['price'].toString(),
                                style: const TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold),
                              ),
                              const Text(
                                ' /day',
                                style: TextStyle(
                                    color: Colors.indigo,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      )),
                  InkWell(
                    onTap: () {
                      final firestore =
                          FirebaseFirestore.instance.collection('BookedCars');
                      final carId = widget.documentSnapshot['id'];
                      final qurey = firestore
                          .where('car id', isEqualTo: carId)
                          .where('uid', isEqualTo: auth.currentUser!.uid);
                      qurey.get().then((snapshot) {
                        if (snapshot.docs.isNotEmpty) {
                          CustomToast()
                              .Toastt('This Car is Already Booked by you');
                        } else if (bookingdays == 0) {
                          CustomToast()
                              .Toastt('Please Select the booking days');
                        } else {
                          String pricestring =
                              widget.documentSnapshot['price'].toString();
                          int price = int.parse(pricestring);
                          int totalprice = bookingdays * price;
                          String bookedID =
                              DateTime.now().millisecondsSinceEpoch.toString();
                          firestore.doc(bookedID).set({
                            'carname':
                                widget.documentSnapshot['make'].toString(),
                            'uid': auth.currentUser!.uid,
                            'image':
                                widget.documentSnapshot['image'].toString(),
                            'model':
                                widget.documentSnapshot['model'].toString(),
                            'price per day':
                                widget.documentSnapshot['price'].toString(),
                            'car id': carId,
                            'totalbill': totalprice.toString(),
                            'bookedId': bookedID
                          }).then((value) {

                          }).onError((error, stackTrace) {
                            CustomToast().Toastt(error.toString());
                          });
                        }
                      }).onError((error, stackTrace) {
                        CustomToast().Toastt(error.toString());
                      });
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width * 0.47,
                      decoration: BoxDecoration(
                          color: Colors.indigo,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          'Book now',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 19),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
