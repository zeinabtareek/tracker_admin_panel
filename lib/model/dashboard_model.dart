import 'package:cloud_firestore/cloud_firestore.dart';

class Dashboard{
  String ? bio ;
  String ? id ;
  String ? phone ;
  String ? profileName ;
  String ? timestamp ;

 Dashboard({this.timestamp,this.bio,this.id,this.phone,this.profileName});
  static Dashboard fromMap(DocumentSnapshot  map) {
    return Dashboard(
      timestamp: map['timestamp'],
      profileName: map['profileName'],
      phone: map['phone'],
      id: map['id'],
      bio: map['bio'],
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'timestamp': timestamp,
      'profileName': profileName,
      'id': id,
      'phone': phone,
      'bio': bio,
    };
  }}