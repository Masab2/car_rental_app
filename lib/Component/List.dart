import 'package:flutter/material.dart';

class ListCars extends StatelessWidget {
  var controller = TextEditingController();
  String? hinttext;
  Widget? leading;
  String text;

  ListCars(
      {Key? key, required this.controller, this.hinttext,this.leading,required this.text})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading:leading,
      title: Text(
        text,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: TextFormField(
        controller: controller,
        decoration: InputDecoration(
            hintText: hinttext,
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                    color: Colors.indigo, width: 2.0)
            )
        ),
      ),
    );
  }
}
