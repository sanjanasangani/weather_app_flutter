int i =0;

class weatherModel {
  String name;
  String region;
  String country;
  String localtime;
  double temp_f;
  double temp_c;
  String icon;
  String text;
  int isday;
  int cloud;
  String sunrise;
  String sunset;
  List hour;
  String time;
  double temp;
  String icon1;

  weatherModel ({
    required this.name,
    required this.region,
    required this.country,
    required this.localtime,
    required this.temp_f,
    required this.temp_c,
    required this.icon,
    required this.text,
    required this.isday,
    required this.cloud,
    required this.sunrise,
    required this.sunset,
    required this.hour,
    required this.time,
    required this.temp,
    required this.icon1
  });
  factory weatherModel.fromMap({required Map data}) {
    return weatherModel(
      name: data['location']['name'],
      region: data['location']['region'],
      country: data['location']['country'],
      localtime: data['location']['localtime'],
      temp_f: data['current']['temp_f'],
      temp_c: data['current']['temp_c'],
      icon: data['current']['condition']['icon'],
      text: data['current']['condition']['text'],
      isday: data['current']['is_day'],
      cloud: data['current']['cloud'],
      sunrise: data['forecast']['forecastday'][0]['astro']['sunrise'],
      sunset: data['forecast']['forecastday'][0]['astro']['sunset'],
      hour: data['forecast']['forecastday'][i]['hour'],
      time: data['forecast']['forecastday'][i]['hour'][i]['time'],
      temp: data['forecast']['forecastday'][i]['hour'][i]['temp_c'],
      icon1: data['forecast']['forecastday'][i]['hour'][1]['condition']['icon'],
    );
  }
}
