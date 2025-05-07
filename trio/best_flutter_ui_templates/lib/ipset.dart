import 'dart:convert';

import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/newhome.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
// import 'login.dart';




class ipset extends StatefulWidget {
  const ipset({super.key});

  @override
  State<ipset> createState() => _ipsetstate();
}

class _ipsetstate extends State<ipset> {
  final TextEditingController ipController = TextEditingController();
  List<String> dietCharts = [];
  List<dynamic> dietCharts1 = [];

  Future<void> fetchDietCharts() async {
    // try {
    final pref = await SharedPreferences.getInstance();




    String url = "${pref.getString("url") ?? ''}view_details";
    var response = await http.post(
      Uri.parse(url),
      body: {'lid': "lid"},
    );

    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      print("======********************");
      print("======********************");
      print("=======================");
      dietCharts1 = jsonData['task'];
      print(dietCharts1);
      for (var item in dietCharts1) {
        dietCharts.add(item.toString());


        //
      }
      print("++++++++++++++++++");
      print(dietCharts);
      pref.setStringList("key",dietCharts);
      print(dietCharts);
      setState(() {

      });
    } else {
      // Fluttertoast.showToast(msg: "Failed to load diet charts. Status code: ${response.statusCode}");
    }
    // } catch (e) {
    //   print("Error fetching diet charts: $e");
    //   // Fluttertoast.showToast(msg: "An error occurred: $e");
    // }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("SAMPLE APP"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: TextField(

                  controller: ipController,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "IP Address",
                      hintText: "Enter a valid ip address"),


                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: ElevatedButton(
                  onPressed: () async{

                    String ip=ipController.text.toString();
                    final sh = await SharedPreferences.getInstance();
                    sh.setString("url", "http://"+ip+":8000/");
                    fetchDietCharts();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MyAppHome()));
                  },
                  child: const Icon(Icons.key),

                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.amber, // Use a proper color value (e.g., Hex or RGB)
                    ),
                  ),
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}