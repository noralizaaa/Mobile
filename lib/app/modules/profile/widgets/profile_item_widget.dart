import 'package:flutter/material.dart';

class ProfileItemWidget extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileItemWidget({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.amber),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
      onTap: onTap,
    );
  }
}