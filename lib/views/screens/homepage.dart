import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/weather_provider.dart';
import '../../models/Connectivity_Model.dart';
import '../../models/weather_model.dart';
import 'package:intl/intl.dart';

class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  DateTime dateTime = DateTime.now();

  // TextEditingController SearchController = TextEditingController();
  // weatherModel? weathermodel;
  // late Future<weatherModel?> weatherdata;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<ConnectivityProvider>(context, listen: false)
  //       .checkInternetConnectivity();
  //   weatherdata = APIHelper.apiHelper.fetchweather(location: "surat");
  //
  // }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double _Height = size.height;
    double _Width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      // appBar: AppBar(
      //   title: Text("Weather"),
      //   actions: [
      //     IconButton(
      //         onPressed: () {
      //           Provider.of<ThemeProvider>(context, listen: false)
      //               .ChangeTheme();
      //         },
      //         icon: (Provider.of<ThemeProvider>(context).themeModel.isDark)
      //             ? Icon(Icons.dark_mode_rounded)
      //             : Icon(Icons.light_mode_rounded))
      //   ],
      // ),
      body: (Provider.of<ConnectivityProvider>(context)
                  .connectivityModel
                  .Connectivitystatus ==
              "waiting")
          ? Center(
              child: Text(
                "Offline",
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            )
          : SafeArea(
              child: Column(
              children: [
                Expanded(
                  child: FutureBuilder(
                    future: Provider.of<WeatherProvider>(context, listen: false)
                        .Weatherdata(
                            Provider.of<WeatherProvider>(context, listen: true)
                                .location),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("ERROR : ${snapshot.error}"),
                        );
                      } else if (snapshot.hasData) {
                        weatherModel? weatherdata = snapshot.data;
                        return (weatherdata == null)
                            ? const Center(
                                child: Text("No Data avilable"),
                              )
                            : Container(
                                height: double.infinity,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      (weatherdata.isday == 1
                                          ? 'assets/images/day image.jpg'
                                          : 'assets/images/dark image.jpg'),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      SizedBox(height: 30,),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                          left: 14,
                                          right: 14,
                                        ),
                                        child: TextField(
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          controller: Provider.of<WeatherProvider>(
                                                      context,
                                                      listen: false)
                                                  .citynamecontroller,
                                          onSubmitted: (String name) {
                                            if (name.isNotEmpty) {
                                              print(name);
                                              Provider.of<WeatherProvider>(
                                                      context,
                                                      listen: false)
                                                  .locationchanage(name);
                                            }
                                          },
                                          decoration: InputDecoration(
                                              suffixIcon: Icon(Icons.search),
                                              hintText: "search city here...",
                                              filled: true,
                                              fillColor: Colors.white.withOpacity(0.3),
                                              border: OutlineInputBorder(
                                                  borderRadius: BorderRadius.circular(50)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: _Height * 0.15,
                                            width: _Width * 0.8,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                width: 2,
                                                color: Colors.white,
                                              ),
                                              color: Colors.black26,
                                            ),
                                            child: Column(
                                              children: [
                                                SizedBox(
                                                  height: _Width * 0.02,
                                                ),
                                                Icon(
                                                  Icons.location_on_outlined,
                                                  size: 30,
                                                  color: Colors.white,
                                                ),
                                                SizedBox(
                                                  height: _Width * 0.02,
                                                ),
                                                Text(
                                                  "${weatherdata.name}",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: _Width * 0.02,
                                                ),
                                                Text(
                                                  "${weatherdata.region}, ${weatherdata.country}.",
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 35),

                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            height: _Height * 0.18,
                                            width: _Width * 0.8,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              border: Border.all(
                                                width: 2,
                                                color: Colors.white,
                                              ),
                                              color: Colors.black26,
                                            ),
                                            // alignment:Alignment.topCenter,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Image(
                                                          height: 140,
                                                          width: 150,
                                                          image: NetworkImage(
                                                            "http:${weatherdata.icon}",
                                                          ),
                                                          fit: BoxFit.cover),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                          top: 20,
                                                        ),
                                                        child: Text(
                                                            "${DateFormat('MMMM').format(dateTime)} ${dateTime.day}, ${dateTime.year}",
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 22,
                                                            )),
                                                      ),
                                                      SizedBox(
                                                        height: 20,
                                                      ),
                                                      Text(
                                                          "${weatherdata.localtime.split(" ")[1]}",
                                                          style: TextStyle(
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 22,
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),

                                      SizedBox(
                                        height: 30,
                                      ),
                                      Container(
                                        height: _Height * 0.2,
                                        width: _Width * 0.8,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            width: 2,
                                            color: Colors.white,
                                          ),
                                          color: Colors.black26,
                                        ),
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: _Width * 0.02,
                                            ),
                                            Text(
                                              "${weatherdata.temp_c}°C",
                                              style: TextStyle(
                                                  fontSize: 60,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(
                                              "${weatherdata.text}",
                                              style: TextStyle(
                                                  fontSize: 28,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Container(
                                          height: _Height * 0.2,
                                          width: _Width * 0.8,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            border: Border.all(
                                              width: 2,
                                              color: Colors.white,
                                            ),
                                            color: Colors.black26,
                                          ),
                                          // alignment:Alignment.topCenter,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/download__3_-removebg-preview (1).png"))),
                                                        ),
                                                        Text("${weatherdata.temp_f}\nTemp F",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/download__4_-removebg-preview (1).png"))),
                                                        ),
                                                        Text("    ${weatherdata.cloud}\nCloud",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/sun2.png"))),
                                                        ),
                                                        Text("${weatherdata.sunrise}\nSunRise",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
                                                      ],
                                                    ),
                                                    Row(
                                                      children: [
                                                        Container(
                                                          height: 60,
                                                          width: 60,
                                                          decoration: BoxDecoration(
                                                              image: DecorationImage(
                                                                  image: AssetImage(
                                                                      "assets/images/download__8_-removebg-preview (1).png"))),
                                                        ),
                                                        Text("    ${weatherdata.sunset}\nSunSet",style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),)
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ),
                              );
                      }
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    },
                  ),
                ),
              ],
            )),
    );
  }
}
