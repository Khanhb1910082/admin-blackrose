import 'dart:js';

import 'package:blackrose_admin_panel/routes/routes.dart';
import 'package:blackrose_admin_panel/service/api.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Authentication {
  void login(BuildContext context,
      {required String email, required String password}) async {
    try {
      final credential = await GetAPI.auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        if (value.user != null) {
          context.pushReplacement(WebRoutes.homeScreen);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
}
