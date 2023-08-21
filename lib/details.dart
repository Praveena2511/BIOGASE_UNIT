import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:untitled2/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Details Form',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: UserDetailsScreen(),
    );
  }
}

class UserDetailsScreen extends StatefulWidget {
  @override
  _UserDetailsScreenState createState() => _UserDetailsScreenState();
}

final databaseRef = FirebaseDatabase.instance.reference();
final _firestore = FirebaseFirestore.instance;

class _UserDetailsScreenState extends State<UserDetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _countryController = TextEditingController();
  TextEditingController _landmarkController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DetailsRef = databaseRef.child('info/');

    return Scaffold(
      appBar: AppBar(
        title: Text('User Details Form'),
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
                  decoration: InputDecoration(labelText: 'First Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _lastNameController,
                  decoration: InputDecoration(labelText: 'Last Name'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _addressController,
                  decoration: InputDecoration(labelText: 'Address'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your address';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _districtController,
                  decoration: InputDecoration(labelText: 'District'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your district';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _stateController,
                  decoration: InputDecoration(labelText: 'State'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your state';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _countryController,
                  decoration: InputDecoration(labelText: 'Country'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter your country';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _landmarkController,
                  decoration: InputDecoration(labelText: 'Landmark'),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () async {
                    // Form is valid, process the data
                    // You can use the controllers' values to get user details
                    // For example: _firstNameController.text, _lastNameController.text, etc.
                    // Add your logic here to save or display the user details

                    Navigator.push(
                      context,
                      new MaterialPageRoute(
                        builder: (context) => new MyLogin(),
                      ),
                    );
                    try {
                       createUser(UserModel user){
                         _firestore.collection('info').add()
                       }
                      print('Process Sucess');
                    } catch (e) {
                      print('You got an Error! $e');
                    }
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserModel{
  final String? id;
  String fname = _firstNameController.text;
  String lname = _lastNameController.text;
  const UserModel({
    this.id,
    required this.fname,
    required this.lname,
  });
}
