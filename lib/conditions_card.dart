import 'package:flutter/material.dart';

class ConditionsCard extends StatelessWidget {

  final IconData icon;
  final String heading;
  final String value;

  const ConditionsCard({
    super.key,
    required this.icon,
    required this.heading,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.indigo
      ),
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 40,),
          const SizedBox(height: 12,),
          Text(heading, style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
          ),),
          const SizedBox(height: 8,),
          Text(value, style:  const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20
          ),)
        ],
      ),
    );
  }
}
