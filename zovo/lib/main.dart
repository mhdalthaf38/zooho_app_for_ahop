import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:zovo/customer/view/alloffers/Userhompage.dart';
import 'package:zovo/customer/view/homescreen/homescreen.dart';
import 'package:zovo/shopowner/screen/presentation/mainscreen/collecting%20details/collectingshopimages.dart';
import 'package:zovo/shopowner/screen/presentation/mainscreen/collecting%20details/detailspage.dart';
import 'package:zovo/shopowner/screen/presentation/mainscreen/collecting%20details/placepicker.dart';
import 'package:zovo/shopowner/screen/presentation/mainscreen/mainscreen.dart';
import 'package:zovo/shopowner/screen/presentation/sign_in/welcomescreen.dart';
import 'package:zovo/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(options:DefaultFirebaseOptions.currentPlatform);
   await Supabase.initialize(
    url: 'https://uyoyxxlsihxfcdlfddae.supabase.co', // Replace with your Supabase URL
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InV5b3l4eGxzaWh4ZmNkbGZkZGFlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzM3MjYzMzUsImV4cCI6MjA0OTMwMjMzNX0.aXblVKgYiNvISZhFR5K5xPdiA0L1TMw3VeD0qw8N3gk', // Replace with your Supabase anon key
  );
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'zoho app',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: StreamBuilder<firebase_auth.User?>(
        stream: firebase_auth.FirebaseAuth.instance.authStateChanges(),
        builder: (context, data) {
          if (data.hasData) {
            return StreamBuilder<DocumentSnapshot?>(
              stream: FirebaseFirestore.instance
                .collection('shops')
                .doc(data.data?.email)
                .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null && snapshot.data!.data() != null) {
                  Map<String, dynamic> shopData = snapshot.data!.data() as Map<String, dynamic>;
                  if(!shopData.containsKey('shopName') || shopData['shopName'] == null || shopData['shopName'] == ''){
                    return Detailspage();
                  }
                  else if(!shopData.containsKey('latitude')){
                    return PlacePicker();
                  }else if(!shopData.containsKey('longitude')){
                    return PlacePicker();
                  }
                  else if(!shopData.containsKey('shopImages')){
                    return imageDetailspage();
                  }else{
                    return MainPage();
                  }       
                }else {
                 return  StreamBuilder<DocumentSnapshot?>(
              stream: FirebaseFirestore.instance
                .collection('customers')
                .doc(data.data?.email)
                .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data != null && snapshot.data!.data() != null) {
                  Map<String, dynamic> shopData = snapshot.data!.data() as Map<String, dynamic>;
                  if(shopData.containsKey('email') || shopData['email'] != null || shopData['email'] != ''){
                    return UserHome();
                  }else{
                    return WelcomeScreen();
                  }
                }else {
                  return WelcomeScreen();
                }
              });
                }
               
              },
            );
          }
          return WelcomeScreen();
        },
      ),
    );
  }
}