//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ChartData {
//   final double original;
//   final double predicted;
//   final String month;
//
//   ChartData({required this.original, required this.predicted, required this.month});
//
//   factory ChartData.fromJson(Map<String, dynamic> json) {
//     print(json['x_value']);
//     return ChartData(
//       original: json['y_value'].toDouble(),
//       predicted: json['y_value2'].toDouble(),
//       month: json['x_value'],
//     );
//   }
// }
//
// Future<List<ChartData>> fetchChartData() async {
//   final pref = await SharedPreferences.getInstance();
//   final response = await http.get(Uri.parse(pref.getString("data") ?? ''));
//
//   if (response.statusCode == 200) {
//     List<dynamic> data = json.decode(response.body);
//     print(data);
//     return data.map((e) => ChartData.fromJson(e)).toList();
//   } else {
//     throw Exception('Failed to load chart data');
//   }
// }
//
// class BarChartPainter extends CustomPainter {
//   final List<ChartData> dataPoints;
//   final double maxY;
//   final Function(String) onBarClick;
//
//   BarChartPainter(this.dataPoints, {required this.maxY, required this.onBarClick});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final barWidth = size.width / (dataPoints.length * 3);
//
//     final Paint actualPaint = Paint()..color = Colors.blue;
//     final Paint predictedPaint = Paint()..color = Colors.orange;
//
//     for (int i = 0; i < dataPoints.length; i++) {
//       final data = dataPoints[i];
//       final xActual = i * (barWidth * 3) + barWidth / 2;
//       final xPredicted = xActual + barWidth * 1.5;
//
//       final yActual = size.height - (data.original * (size.height / maxY));
//       final yPredicted = size.height - (data.predicted * (size.height / maxY));
//
//       // Draw bars with animations
//       canvas.drawRect(Rect.fromLTWH(xActual, yActual, barWidth, size.height - yActual), actualPaint);
//       canvas.drawRect(Rect.fromLTWH(xPredicted, yPredicted, barWidth, size.height - yPredicted), predictedPaint);
//
//       // Detect click areas
//       canvas.drawRect(Rect.fromLTWH(xActual, yActual, barWidth, size.height - yActual), Paint()..color = Colors.transparent);
//       canvas.drawRect(Rect.fromLTWH(xPredicted, yPredicted, barWidth, size.height - yPredicted), Paint()..color = Colors.transparent);
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
//
// class GraphScreen extends StatefulWidget {
//   @override
//   _GraphScreenState createState() => _GraphScreenState();
// }
//
// class _GraphScreenState extends State<GraphScreen> {
//   late Future<List<ChartData>> futureChartData;
//   double maxY = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     futureChartData = fetchChartData();
//   }
//
//   void showValue(String value) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(value)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Actual vs Predicted Bar Chart')),
//       body: FutureBuilder<List<ChartData>>(
//         future: futureChartData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             maxY = snapshot.data!.map((data) => data.original > data.predicted ? data.original : data.predicted).reduce((a, b) => a > b ? a : b);
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: CustomPaint(
//                 size: Size(double.infinity, MediaQuery.of(context).size.height * 0.6),
//                 painter: BarChartPainter(snapshot.data!, maxY: maxY, onBarClick: showValue),
//               ),
//             );
//           } else {
//             return Center(child: Text('No data available.'));
//           }
//         },
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: GraphScreen(),
//   ));
// }
//
//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ChartData {
//   final double original;
//   final double predicted;
//   final String month;
//
//   ChartData({required this.original, required this.predicted, required this.month});
//
//   factory ChartData.fromJson(Map<String, dynamic> json) {
//     return ChartData(
//       original: json['y_value'].toDouble(),
//       predicted: json['y_value2'].toDouble(),
//       month: json['x_value'],
//     );
//   }
// }
//
// Future<List<ChartData>> fetchChartData() async {
//   final pref = await SharedPreferences.getInstance();
//   final response = await http.get(Uri.parse(pref.getString("data") ?? ''));
//
//   if (response.statusCode == 200) {
//     List<dynamic> data = json.decode(response.body);
//     return data.map((e) => ChartData.fromJson(e)).toList();
//   } else {
//     throw Exception('Failed to load chart data');
//   }
// }
//
// class BarChartPainter extends CustomPainter {
//   final List<ChartData> dataPoints;
//   final double maxY;
//   final Function(String) onBarClick;
//
//   BarChartPainter(this.dataPoints, {required this.maxY, required this.onBarClick});
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     final barWidth = size.width / (dataPoints.length * 3);
//
//     final Paint actualPaint = Paint()..color = Colors.blue;
//     final Paint predictedPaint = Paint()..color = Colors.orange;
//
//     final Paint axisPaint = Paint()
//       ..color = Colors.black
//       ..strokeWidth = 2.0;
//
//     final textPainter = TextPainter(
//       textDirection: TextDirection.ltr,
//       textAlign: TextAlign.center,
//     );
//
//     // Draw X and Y axes
//     canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height), axisPaint);
//     canvas.drawLine(Offset(0, 0), Offset(0, size.height), axisPaint);
//
//     // Draw labels and bars
//     for (int i = 0; i < dataPoints.length; i++) {
//       final data = dataPoints[i];
//       final xActual = i * (barWidth * 3) + barWidth / 2;
//       final xPredicted = xActual + barWidth * 1.5;
//
//       final yActual = size.height - (data.original * (size.height / maxY));
//       final yPredicted = size.height - (data.predicted * (size.height / maxY));
//
//       // Draw bars
//       canvas.drawRect(Rect.fromLTWH(xActual, yActual, barWidth, size.height - yActual), actualPaint);
//       canvas.drawRect(Rect.fromLTWH(xPredicted, yPredicted, barWidth, size.height - yPredicted), predictedPaint);
//
//       // Draw month labels
//       textPainter.text = TextSpan(
//         text: data.month,
//         style: TextStyle(color: Colors.black, fontSize: 12),
//       );
//       textPainter.layout();
//       textPainter.paint(canvas, Offset(xActual + barWidth / 2 - textPainter.width / 2, size.height + 5));
//
//       // Draw bar click events
//       canvas.drawRect(Rect.fromLTWH(xActual, yActual, barWidth, size.height - yActual), Paint()..color = Colors.transparent);
//       canvas.drawRect(Rect.fromLTWH(xPredicted, yPredicted, barWidth, size.height - yPredicted), Paint()..color = Colors.transparent);
//
//       // Detect clicks and display values
//       onBarClick('${data.month} - Actual: ${data.original}, Predicted: ${data.predicted}');
//     }
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
// }
//
// class GraphScreen extends StatefulWidget {
//   @override
//   _GraphScreenState createState() => _GraphScreenState();
// }
//
// class _GraphScreenState extends State<GraphScreen> {
//   late Future<List<ChartData>> futureChartData;
//   double maxY = 0.0;
//
//   @override
//   void initState() {
//     super.initState();
//     futureChartData = fetchChartData();
//   }
//
//   void showValue(String value) {
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(content: Text(value)),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Actual vs Predicted Bar Chart')),
//       body: FutureBuilder<List<ChartData>>(
//         future: futureChartData,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           } else if (snapshot.hasData) {
//             maxY = snapshot.data!.map((data) => data.original > data.predicted ? data.original : data.predicted).reduce((a, b) => a > b ? a : b);
//             return Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: CustomPaint(
//                 size: Size(double.infinity, MediaQuery.of(context).size.height * 0.6),
//                 painter: BarChartPainter(snapshot.data!, maxY: maxY, onBarClick: showValue),
//               ),
//             );
//           } else {
//             return Center(child: Text('No data available.'));
//           }
//         },
//       ),
//     );
//   }
// }
//
// void main() {
//   runApp(MaterialApp(
//     home: GraphScreen(),
//   ));
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ChartData {
  final double original;
  final double predicted;
  final String month;

  ChartData({required this.original, required this.predicted, required this.month});

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(
      original: json['y_value'].toDouble(),
      predicted: json['y_value2'].toDouble(),
      month: json['x_value'],
    );
  }
}

Future<List<ChartData>> fetchChartData() async {
  final pref = await SharedPreferences.getInstance();
  final response = await http.get(Uri.parse(pref.getString("data") ?? ''));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((e) => ChartData.fromJson(e)).toList();
  } else {
    throw Exception('Failed to load chart data');
  }
}

class BarChartPainter extends CustomPainter {
  final List<ChartData> dataPoints;
  final double maxY;
  final Function(String) onBarClick;

  BarChartPainter(this.dataPoints, {required this.maxY, required this.onBarClick});

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = size.width / (dataPoints.length * 3);

    final Paint actualPaint = Paint()..color = Colors.blue;
    final Paint predictedPaint = Paint()..color = Colors.orange;

    final Paint axisPaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 2.0;

    final textPainter = TextPainter(
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.center,
    );

    // Draw X and Y axes
    canvas.drawLine(Offset(0, size.height), Offset(size.width, size.height), axisPaint);
    canvas.drawLine(Offset(0, 0), Offset(0, size.height), axisPaint);

    for (int i = 0; i < dataPoints.length; i++) {
      final data = dataPoints[i];
      final xActual = i * (barWidth * 3) + barWidth / 2;
      final xPredicted = xActual + barWidth * 1.5;

      final yActual = size.height - (data.original * (size.height / maxY));
      final yPredicted = size.height - (data.predicted * (size.height / maxY));

      // Draw bars
      canvas.drawRect(Rect.fromLTWH(xActual, yActual, barWidth, size.height - yActual), actualPaint);
      canvas.drawRect(Rect.fromLTWH(xPredicted, yPredicted, barWidth, size.height - yPredicted), predictedPaint);

      // Draw month labels
      textPainter.text = TextSpan(
        text: data.month,
        style: TextStyle(color: Colors.black, fontSize: 12),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(xActual + barWidth / 2 - textPainter.width / 2, size.height + 5));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class GraphScreen extends StatefulWidget {
  @override
  _GraphScreenState createState() => _GraphScreenState();
}

class _GraphScreenState extends State<GraphScreen> {
  late Future<List<ChartData>> futureChartData;
  double maxY = 0.0;

  @override
  void initState() {
    super.initState();
    futureChartData = fetchChartData();
  }

  void showValue(String value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(value)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Actual vs Predicted Bar Chart')),
      body: FutureBuilder<List<ChartData>>(
        future: futureChartData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            maxY = snapshot.data!.map((data) => data.original > data.predicted ? data.original : data.predicted).reduce((a, b) => a > b ? a : b);
            return GestureDetector(
              onTapUp: (details) {
                final RenderBox box = context.findRenderObject() as RenderBox;
                final localPosition = box.globalToLocal(details.globalPosition);

                for (int i = 0; i < snapshot.data!.length; i++) {
                  final data = snapshot.data![i];
                  final barWidth = box.size.width / (snapshot.data!.length * 3);
                  final xActual = i * (barWidth * 3) + barWidth / 2;
                  final xPredicted = xActual + barWidth * 1.5;

                  if ((localPosition.dx >= xActual && localPosition.dx <= xActual + barWidth) ||
                      (localPosition.dx >= xPredicted && localPosition.dx <= xPredicted + barWidth)) {
                    showValue('${data.month} - Actual: ${data.original}, Predicted: ${data.predicted}');
                    break;
                  }
                }
              },
              child: CustomPaint(
                size: Size(double.infinity, MediaQuery.of(context).size.height * 0.6),
                painter: BarChartPainter(snapshot.data!, maxY: maxY, onBarClick: showValue),
              ),
            );
          } else {
            return Center(child: Text('No data available.'));
          }
        },
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: GraphScreen(),
  ));
}