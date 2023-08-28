import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:untitled2/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:untitled2/product.dart';

import 'Productdescription.dart';

class UserDetailsApp extends StatelessWidget {
  final String email, userid;
  UserDetailsApp(this.email, this.userid);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Details Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserDetailsScreen(emailfromhome: email, useridentity: userid),
    );
  }
}

class UserDetailsScreen extends StatefulWidget {
  final String emailfromhome, useridentity;

  UserDetailsScreen(
      {required this.emailfromhome,
      required this.useridentity}); // Receive the emailFromHome parameter

  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState(
      emailid: emailfromhome,
      uid: useridentity); // Pass the emailFromHome to the state
}

final databaseRef = FirebaseDatabase.instance.reference();

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  String emailid, uid;
  _UserDetailsScreenState({required this.emailid, required this.uid});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _firstNameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _landmarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _districtController,
                  decoration: const InputDecoration(labelText: 'District'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your district';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _stateController,
                  decoration: const InputDecoration(labelText: 'State'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _countryController,
                  decoration: const InputDecoration(labelText: 'Country'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your country';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _landmarkController,
                  decoration: const InputDecoration(labelText: 'Landmark'),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyLogin(),
                      ),
                    );
                    // Form is valid, process the data
                    // You can use the controllers' values to get user details
                    // For example: _firstNameController.text, _lastNameController.text, etc.
                    // Add your logic here to save or display the user details
                    String fname = _firstNameController.text;
                    String Phone = _phoneController.text;
                    String address = _addressController.text;
                    String district = _districtController.text;
                    String state = _stateController.text;
                    String country = _countryController.text;
                    String landmark = _landmarkController.text;

                    final String email = '$emailid';
                    final String uid1 = '$uid';
                    print(uid1);
                    print(email);
                    CollectionReference collRef =
                        FirebaseFirestore.instance.collection('info');
                    DocumentSnapshot docSnapshot =
                        await collRef.doc(email).get();

                    try {
                      if (!docSnapshot.exists) {
                        await collRef.doc(email).set({
                          'firstname': fname,
                          'Email': email,
                          'UID': uid1,
                          'Phone No': Phone,
                          'Address': address,
                          'District': district,
                          'State': state,
                          'Country': country,
                          'Landmark': landmark
                        });
                        print('Document added successfully');
                      }
                    } catch (e) {
                      print('Error adding document: $e');
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyLogin(),
                      ),
                    );
                  },
                  child: const Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
