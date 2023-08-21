import 'package:flutter/material.dart';
import 'package:untitled2/commerce.dart';

class BiogasifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biogasify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biogasify'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Open user profile or perform desired action
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic for the "Buy" button
                },
                child: Text('Buy'),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic for the "Sell" button
                  Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => new ECommerceApp(),
                    ),
                  );
                },
                child: Text('Sell'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
