class UserModel {
  final String? id;
  String fname = _firstNameController.text;
  String lname = _lastNameController.text;
  const UserModel({
    this.id,
    required this.fname,
    required this.lname,
  });
}
