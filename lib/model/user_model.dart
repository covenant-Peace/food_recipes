import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String fullname;
  // final String uid;
  final String email;
  final String password;
  final phoneNumber;


  const UserModel({this.password, this.phoneNumber, this.fullname, this.email});


  factory UserModel.fromMap(Map<String, dynamic> snapshot)
  {
    return UserModel(
      email: snapshot['email'],
      fullname: snapshot['Full name'],
      password: snapshot['password'],
      phoneNumber: snapshot['phone number'],
    );
  }

  static UserModel fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(
      email: snapshot['email'],
      // uid: snapshot['uid'],
      fullname: snapshot['Full name'],
      password: snapshot['password'],
      phoneNumber: snapshot['phone number']
    );
  }
}