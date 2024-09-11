import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  final String title;
  final IconData? icon;
  final Function()? onTap;
  const AppDrawer({super.key, required this.title,required this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title,style: const TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
      leading: Icon(icon,size: 35,),
      onTap: onTap,
    );
  }
}
