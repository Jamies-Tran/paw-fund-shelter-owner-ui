
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/constans/route/paw_routes.dart';
import 'package:paw_fund_shelter_owner/share/data_binding/data_binding.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';
import 'dart:js_interop';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final apiKey = FIREBASE_API_KEY;
  final authDomain = FIREBASE_AUTH_DOMAIN;
  final databaseURL = FIREBASE_DB_URL;
  final projectId = FIREBASE_PROJECT_ID;
  final storageBucket = FIREBASE_STORAGE_BUCKET;
  final messagingSenderId = FIREBASE_MESSAGING_SENDER_ID;
  final appId = FIREBASE_APP_ID;
  final measurementId = FIREBASE_MEASUREMENT_ID;
  final test = PAW_REGISTRATION;
  print(test);
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: apiKey,
        authDomain: authDomain,
        databaseURL: databaseURL,
        projectId: projectId,
        storageBucket: storageBucket,
        messagingSenderId: messagingSenderId,
        appId: appId,
        measurementId: measurementId,
    )
  );
  runApp(const PawFundApp());
}

class PawFundApp extends StatelessWidget {
  const PawFundApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: PDataBinding(),
      getPages: PAppRoute.pages,
    );
  }
}

