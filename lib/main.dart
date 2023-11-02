import 'package:blackrose_admin_panel/core/constants/color_constants.dart';
import 'package:blackrose_admin_panel/core/init/provider_list.dart';
import 'package:blackrose_admin_panel/routes/routes.dart';
import 'package:blackrose_admin_panel/screens/login/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
        apiKey: "AIzaSyA73ZmMHjBJBdGZcoY0uos8fPY5G15tD0s",
        authDomain: "k-blackrose.firebaseapp.com",
        projectId: "k-blackrose",
        storageBucket: "k-blackrose.appspot.com",
        messagingSenderId: "851244104074",
        appId: "1:851244104074:web:07a609b44446388e887073"),
  );
  runApp(const MyApp());
}

Widget build(BuildContext context) {
  return const MyApp();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: ApplicationProvider.providers,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'BlackRose Dashboard - Admin Panel',
        theme: ThemeData.dark().copyWith(
          appBarTheme:
              const AppBarTheme(backgroundColor: bgColor, elevation: 0),
          scaffoldBackgroundColor: bgColor,
          primaryColor: greenColor,
          dialogBackgroundColor: secondaryColor,
          buttonTheme: const ButtonThemeData(buttonColor: greenColor),
          textTheme: GoogleFonts.openSansTextTheme(Theme.of(context).textTheme)
              .apply(bodyColor: Colors.white),
          canvasColor: secondaryColor,
        ),

        routerConfig: WebRoutes.router,
        // home: const Login(title: "Wellcome to the Admin & Dashboard Panel"),
      ),
    );
  }
}
