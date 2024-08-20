import 'package:flutter/material.dart';

import 'package:foodorder/model/othermodels/loginresponsemodel.dart';

class Userinfowidget extends StatelessWidget {
  const Userinfowidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final Loginresponsemodel? user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: NetworkImage(user!.profile),
        ),
        SizedBox(width: 10), // Add spacing between CircleAvatar and ListTile
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(user!.username),
            Text(user!.email),
          ],
        ),
      ],
    );
  }
}