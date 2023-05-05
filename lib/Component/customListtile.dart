import 'package:flutter/material.dart';

class CustomListtile extends StatelessWidget {
  Icon? icon;
  String title;
  VoidCallback? ontap;
  CustomListtile({Key? key, this.icon, required this.title, this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: icon,
      title: Text(
        title,
        style: TextStyle(fontSize: 19,),
      ),
    );
  }
}
