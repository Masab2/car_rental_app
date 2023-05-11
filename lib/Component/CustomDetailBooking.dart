import 'package:flutter/material.dart';

class CustomBooking extends StatelessWidget {
  Widget leading;
  Widget title;
  Widget subtitle;

  CustomBooking(
      {Key? key,
      required this.leading,
      required this.title,
      required this.subtitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      title: title,
      subtitle: subtitle,
    );
  }
}
