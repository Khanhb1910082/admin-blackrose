import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Users extends ChangeNotifier {
  final String uid;
  final String email;
  final String phone;
  final String created_at;
  final String last_login;
  final bool isOnline;
  final String username;
  final String avatar;
  final String sex;
  final String story;
  final String place;
  final String study;
  final String relationship;
  final Timestamp birthday;
  List styleOfLife;
  List favourite;
  String pushToken;
  Users({
    required this.uid,
    required this.email,
    required this.phone,
    required this.created_at,
    required this.last_login,
    required this.isOnline,
    required this.username,
    required this.avatar,
    required this.sex,
    required this.story,
    required this.birthday,
    required this.place,
    required this.study,
    required this.relationship,
    required this.styleOfLife,
    required this.favourite,
    required this.pushToken,
  });

  Users copyWith({
    String? uid,
    String? email,
    String? phone,
    String? created_at,
    String? last_login,
    bool? isOnline,
    String? username,
    String? avatar,
    String? sex,
    String? story,
    Timestamp? birthday,
    String? place,
    String? study,
    String? relationship,
    List? styleOfLife,
    List? favourite,
    String? pushToken,
  }) {
    return Users(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      created_at: created_at ?? this.created_at,
      last_login: last_login ?? this.last_login,
      isOnline: isOnline ?? this.isOnline,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      sex: sex ?? this.sex,
      story: story ?? this.story,
      birthday: birthday ?? this.birthday,
      place: place ?? this.place,
      study: study ?? this.study,
      relationship: relationship ?? this.relationship,
      styleOfLife: styleOfLife ?? this.styleOfLife,
      favourite: favourite ?? this.favourite,
      pushToken: pushToken ?? this.pushToken,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'phone': phone,
      'created_at': created_at,
      'last_login': last_login,
      'isOnline': isOnline,
      'username': username,
      'avatar': avatar,
      'sex': sex,
      'story': story,
      'birthday': birthday,
      'place': place,
      'study': study,
      'relationship': relationship,
      'styleOfLife': styleOfLife,
      'favourite': favourite,
      'pushToken': pushToken,
    };
  }

  static Users fromMap(Map<String, dynamic> map) {
    return Users(
      uid: map['uid'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      created_at: map['created_at'] as String,
      last_login: map['last_login'] as String,
      isOnline: map['isOnline'] as bool,
      username: map['username'] as String,
      avatar: map['avatar'] as String,
      sex: map['sex'] as String,
      story: map['story'] as String,
      birthday: map['birthday'],
      place: map['place'] as String,
      study: map['study'] as String,
      relationship: map['relationship'] as String,
      styleOfLife: List<String>.from((map['styleOfLife'])),
      favourite: List<String>.from((map['favourite'])),
      pushToken: map['pushToken'] as String,
    );
  }

  @override
  String toString() {
    return 'Users(uid: $uid, email: $email, phone: $phone, created_at: $created_at, last_login: $last_login, isOnline: $isOnline, username: $username, avatar: $avatar, sex: $sex, story: $story, place: $place, study: $study, relationship: $relationship, birthday: $birthday, styleOfLife: $styleOfLife, favourite: $favourite, pushToken: $pushToken)';
  }
}
