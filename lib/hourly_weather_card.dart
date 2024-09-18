import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class WeatherCard extends StatelessWidget {
  final int time;
  final IconData icon;
  final String weather;
  final String temperature;
  const WeatherCard({
    super.key,
    required this.time,
    required this.icon,
    required this.weather,
    required this.temperature
  });

  String datetimeConverter(int dt){
    String ans = "";
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(dt*1000);
    ans = DateFormat("HH:mm").format(dateTime);
    return ans;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 120,
        padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(datetimeConverter(time), style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600
            ),),
            const SizedBox(height: 10,),
            Icon(icon, size: 40,),
            const SizedBox(height: 10,),
            Text(weather, style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),),
            Text(temperature, style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500
            ),)
          ],
        ),
      ),);
  }
}
