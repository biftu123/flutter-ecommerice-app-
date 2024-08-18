// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final Widget? trailing;
  final VoidCallback? onTap;
  final double? size;

  CustomListTile({
    Key? key,
    required this.title,
    required this.leadingIcon,
    this.trailing,
    this.onTap,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        leadingIcon,
        size: size,
      ),
      title: Text(title),
      trailing: trailing,
      onTap: onTap,
    );
  }
}
