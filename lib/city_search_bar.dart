import 'package:flutter/material.dart';

class CitySearch extends StatefulWidget{

  final Function(String) onCitySubmitted;

  // const CitySearch({
  //   super.key,
  //   required this.onCitySubmitted
  // });
  const CitySearch({super.key, required this.onCitySubmitted});

  @override
  _CitySearch createState() => _CitySearch();

  }

class _CitySearch extends State<CitySearch>{

  final TextEditingController _cityname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(5),
      child: TextField(
        controller: _cityname,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        onSubmitted: (value){
          widget.onCitySubmitted(_cityname.text);
        },
        decoration: InputDecoration(
            hintText: "Enter your city...",
            hintStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.blueGrey,
            ),
            hintFadeDuration: const Duration(seconds: 1),
            prefixIcon: const Padding(
              padding: EdgeInsets.all(5),
              child: Icon(Icons.location_city),
            ),
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
                onPressed: (){
                  widget.onCitySubmitted(_cityname.text);
                },
                icon:const Icon(Icons.send_rounded)
        ),
      ),
    )
    );
  }
}