import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../models/weather_model.dart';
import '../../utils/helpers.dart';

class WeatherProvider extends ChangeNotifier{

  String location = "Surat";
  weatherModel? _weatherModel;
  TextEditingController citynamecontroller = TextEditingController();
  void locationchanage(String newLocation)
  {
    location = newLocation;
    notifyListeners();
  }
  Future<weatherModel?> Weatherdata(String locationame)async{
    _weatherModel  = await APIHelper.apiHelper.fetchweather(locationame);
    return _weatherModel;
  }
}
