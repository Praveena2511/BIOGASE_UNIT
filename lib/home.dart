import 'package:flutter/material.dart';
import 'package:untitled2/faq.dart';
import 'package:untitled2/productlist.dart';
import 'package:untitled2/profile.dart';
import 'package:untitled2/sell.dart';

class BiogasifyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Biogasify',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Biogasify'),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FAQPage(),
                ),
              );
            },
            child: Text("FAQ"),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic for the "Buy" button
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ECommerceApp(),
                    ),
                  );
                },
                child: const Text('Buy'),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              height: 100,
              child: ElevatedButton(
                onPressed: () {
                  // Add your logic for the "Sell" button

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SellPage(),
                    ),
                  );
                },
                child: const Text('Sell'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.person),
          ),
        ],
        currentIndex: currentIndex,
        onTap: (int index) {
          if (index == 0) {
            // Handle home navigation here
          } else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
              ),
            );
          }
        },
      ),
    );
  }
}
