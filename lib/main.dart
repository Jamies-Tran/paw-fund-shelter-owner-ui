

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:paw_fund_shelter_owner/repository/hive/models/auth_hive_model.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/route/paw_routes.dart';
import 'package:paw_fund_shelter_owner/share/data_binding/data_binding.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/configuration/env_interop.dart';

import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  await Hive.initFlutter();
  Hive.registerAdapter(AuthHiveAdapter());
  await Hive.openBox<AuthHive>("authBox");

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: FIREBASE_API_KEY,
        authDomain: FIREBASE_AUTH_DOMAIN,
        projectId: FIREBASE_PROJECT_ID,
        storageBucket: FIREBASE_STORAGE_BUCKET,
        messagingSenderId: FIREBASE_MESSAGING_SENDER_ID,
        appId: FIREBASE_APP_ID,
        measurementId: FIREBASE_MEASUREMENT_ID,
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

