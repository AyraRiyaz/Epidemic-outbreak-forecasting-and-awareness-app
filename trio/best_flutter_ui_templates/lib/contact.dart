import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pandemic Contacts',
      theme: ThemeData.dark(),
      home: ContactInfoPage(),
    );
  }
}

class ContactInfoPage extends StatelessWidget {
  final List<Map<String, String>> contacts = [
    {
      'name': 'National Helpline',
      'description': 'For COVID-19 related queries and assistance.',
      'number': '1075',
      'email': 'ncov2019@gov.in',
    },
    {
      'name': 'State Helpline',
      'description': 'State-specific helpline for pandemic-related issues.',
      'number': '104',
      'email': 'statehealth@example.com',
    },
    {
      'name': 'Emergency Ambulance',
      'description': '24/7 ambulance service for emergencies.',
      'number': '108',
      'email': 'ambulance@example.com',
    },
    {
      'name': 'Local Hospital',
      'description': 'Nearest hospital for COVID-19 testing and treatment.',
      'number': '1800-123-4567',
      'email': 'hospital@example.com',
    },
    {
      'name': 'Mental Health Support',
      'description': 'Helpline for mental health support during the pandemic.',
      'number': '080-4611-0007',
      'email': 'mentalhealth@example.com',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Important Contacts'),
      ),
      body: ListView.builder(
        itemCount: contacts.length,
        itemBuilder: (context, index) {
          final contact = contacts[index];
          return Card(
            margin: EdgeInsets.all(12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ExpansionTile(
              leading: Icon(Icons.contact_phone, size: 40),
              title: Text(
                contact['name']!,
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
                        contact['description']!,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Contact Number:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        contact['number']!,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 16),
                      Text(
                        'Email:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 8),
                      Text(
                        contact['email']!,
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