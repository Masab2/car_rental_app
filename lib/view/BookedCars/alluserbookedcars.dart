import 'package:car_rental_app/view/AdminPanel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../Component/DetailContainer.dart';
import 'Detail.dart';

class AllUserBookedCars extends StatefulWidget {
  const AllUserBookedCars({Key? key}) : super(key: key);

  @override
  State<AllUserBookedCars> createState() => _AllUserBookedCarsState();
}

class _AllUserBookedCarsState extends State<AllUserBookedCars> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 40,
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
                              builder: (context) => AdminPanel(),
                            ),
                            (route) => false);
                      },
                      icon: const Icon(
                        Icons.navigate_before_outlined,
                        size: 34,
                        weight: 5.0,
                      )),
                ),
                const SizedBox(
                  width: 50,
                ),
                const Text(
                  'All Booked Cars',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('BookedCars').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentsnapshot =
                          snapshot.data!.docs[index];
                      return DetailContainer(
                        image: snapshot.data!.docs[index]['image'],
                        text: snapshot.data!.docs[index]['totalbill'],
                        title: snapshot.data!.docs[index]['carname'],
                        subtitle: snapshot.data!.docs[index]['booked by'],
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(
                                  documentsnapshot: documentsnapshot,
                                ),
                              ));
                        },
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
