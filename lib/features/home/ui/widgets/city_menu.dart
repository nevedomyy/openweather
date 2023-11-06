import 'package:flutter/material.dart';
import 'package:openweather/core/global/constants.dart';
import 'package:openweather/core/utils/utils.dart';
import 'package:openweather/features/home/bloc/home_bloc.dart';

class CityMenu extends StatefulWidget {
  const CityMenu({super.key});

  @override
  State<CityMenu> createState() => _CityMenuState();
}

class _CityMenuState extends State<CityMenu> {
  String dropdownValue = cities.first;

  @override
  void initState() {
    super.initState();
    dropdownValue = context.bloc<HomeBloc>().getCity;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: AppTextStyle.black24,
      onChanged: (String? value) {
        dropdownValue = value!;
        context.bloc<HomeBloc>().setCity(value);
        setState(() {});
      },
      underline: Container(
        color: Colors.black,
        height: 1,
      ),
      items: cities.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
