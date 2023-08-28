import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'order.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late String email;
  late String firstName;
  late String address;
  late String country;
  late String district;
  late String landmark;
  late String phoneNumber;
  late String state;

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final userEmail = user.email;
      print('User email: $userEmail');

      if (userEmail != null) {
        final userDoc = await FirebaseFirestore.instance
            .collection('info')
            .doc(userEmail)
            .get();

        if (userDoc.exists) {
          final userData = userDoc.data();
          setState(() {
            email = userEmail;
            firstName = userData!['firstname'] ?? '';
            address = userData['Address'] ?? '';
            country = userData['Country'] ?? '';
            district = userData['District'] ?? '';
            landmark = userData['Landmark'] ?? '';
            phoneNumber = userData['Phone No'] ?? '';
            state = userData['State'] ?? '';
          });
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 70,
                )),
            SizedBox(height: 16),
            Text(
              'Personal Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('$firstName '),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('$email'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('$phoneNumber'),
            ),
            Divider(),
            Text(
              'Address Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('$address'),
            ),
            ListTile(
              leading: Icon(Icons.location_city),
              title: Text('$district'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('$landmark'),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('$country'),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('$state'),
            ),
          ],
        ),
      ),
    );
  }
}
