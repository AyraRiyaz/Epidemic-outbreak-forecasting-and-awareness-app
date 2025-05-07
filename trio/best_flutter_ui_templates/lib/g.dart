// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Disease Awareness',
//       theme: ThemeData.dark(),
//       home: DiseaseInfoPage(),
//     );
//   }
// }
//
// class DiseaseInfoPage extends StatelessWidget {
//   final List<Map<String, String>> diseases = [
//     {
//       'name': 'COVID-19',
//       'image': 'assets/fitness_app/corona.png',
//       'description':
//       'COVID-19 is a respiratory disease caused by the SARS-CoV-2 virus. It spreads through respiratory droplets.'
//     },
//     {
//       'name': 'Dengue',
//       'image': 'assets/fitness_app/dengue.png',
//       'description':
//       'Dengue is a mosquito-borne disease caused by the dengue virus. Symptoms include fever, rash, and muscle pain.'
//     },
//     {
//       'name': 'Malaria',
//       'image': 'assets/fitness_app/malaria.png',
//       'description':
//       'Malaria is a life-threatening disease caused by Plasmodium parasites, transmitted through Anopheles mosquito bites.'
//     }
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Disease Awareness'),
//       ),
//       body: ListView.builder(
//         itemCount: diseases.length,
//         itemBuilder: (context, index) {
//           final disease = diseases[index];
//           return Card(
//             margin: EdgeInsets.all(12),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(15),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Image.asset(
//                   disease['image']!,
//                   fit: BoxFit.cover,
//                   height: 200,
//                   width: 200,
//                 ),
//                 Padding(
//                   padding: EdgeInsets.all(16),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         disease['name']!,
//                         style: TextStyle(
//                             fontSize: 24, fontWeight: FontWeight.bold),
//                       ),
//                       SizedBox(height: 10),
//                       Text(
//                         disease['description']!,
//                         style: TextStyle(fontSize: 16),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Disease Awareness',
      theme: ThemeData.dark(),
      home: DiseaseInfoPage(),
    );
  }
}

class DiseaseInfoPage extends StatelessWidget {
  final List<Map<String, String>> diseases = [
    {
      'name': 'COVID-19',
      'image': 'assets/fitness_app/corona.png',
      'description':
      'COVID-19 is a respiratory disease caused by the SARS-CoV-2 virus. It spreads through respiratory droplets.',
      'prevention':
      '1. Get vaccinated.\n2. Wear masks in crowded areas.\n3. Wash hands frequently.\n4. Maintain social distancing.\n5. Avoid touching your face.',
      'symptoms': 'Fever, cough, fatigue, loss of taste or smell, difficulty breathing.',
      'additionalTips': 'Use hand sanitizer with at least 60% alcohol. Follow local health guidelines.',
    },
    {
      'name': 'Dengue',
      'image': 'assets/fitness_app/dengue.png',
      'description':
      'Dengue is a mosquito-borne disease caused by the dengue virus. Symptoms include fever, rash, and muscle pain.',
      'prevention':
      '1. Eliminate standing water.\n2. Use mosquito repellent.\n3. Wear protective clothing.\n4. Use mosquito nets.\n5. Install window screens.',
      'symptoms': 'High fever, severe headache, pain behind the eyes, joint and muscle pain, rash.',
      'additionalTips': 'Seek medical attention if symptoms appear. Avoid self-medication with aspirin or ibuprofen.',
    },
    {
      'name': 'Malaria',
      'image': 'assets/fitness_app/malaria.png',
      'description':
      'Malaria is a life-threatening disease caused by Plasmodium parasites, transmitted through Anopheles mosquito bites.',
      'prevention':
      '1. Use insecticide-treated nets.\n2. Take antimalarial medication if traveling to high-risk areas.\n3. Wear long-sleeved clothing.\n4. Use mosquito repellents.\n5. Avoid stagnant water.',
      'symptoms': 'Fever, chills, headache, vomiting, muscle pain.',
      'additionalTips': 'Seek prompt treatment if symptoms occur. Use mosquito coils or vapor mats.',
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Disease Awareness'),
      ),
      body: ListView.builder(
        itemCount: diseases.length,
        itemBuilder: (context, index) {
          final disease = diseases[index];
          return Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ExpansionTile(
              leading: Image.asset(
                disease['image']!,
                width: 50,
                height: 50,
              ),
              title: Text(
                disease['name']!,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              children: [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Description:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        disease['description']!,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Symptoms:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        disease['symptoms']!,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Prevention:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        disease['prevention']!,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Additional Tips:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        disease['additionalTips']!,
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}