import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:weather_app/Forecast_Card.dart';
import 'package:weather_app/additional_infromation.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double temp = 0;
  String weather = "";
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    final res = await http.get(Uri.parse("http://localhost:3000/"));
    final result = jsonDecode(res.body);
    setState(() {
      temp = result[0]["data"][0]["temp"].toDouble();
      weather = result[0]["data"][0]["weather"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(temp.toString(),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              )),
                          const SizedBox(height: 16),
                          Icon(
                            weather == "Rainy" || weather == "Cloud"
                                ? Icons.cloud
                                : Icons.sunny,
                            size: 64,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            weather,
                            style: const TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Weather Forecast",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ForecastCard(
                    time: "9:00",
                    icon: Icons.cloud,
                    temp: "300",
                  ),
                  ForecastCard(
                    time: "10:00",
                    icon: Icons.cloud,
                    temp: "301",
                  ),
                  ForecastCard(
                    time: "11:00",
                    icon: Icons.sunny,
                    temp: "304",
                  ),
                  ForecastCard(
                    time: "12:00",
                    icon: Icons.sunny,
                    temp: "302",
                  ),
                  ForecastCard(
                    time: "13:00",
                    icon: Icons.cloud,
                    temp: "300",
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Additional Information",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Additional(
                    icon: Icons.water_drop, label: "Humidity", value: "90"),
                Additional(icon: Icons.air, label: "Air", value: "10.2"),
                Additional(
                    icon: Icons.beach_access, label: "Pressure", value: "100"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
