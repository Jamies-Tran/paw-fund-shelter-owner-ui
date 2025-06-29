import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:paw_fund_shelter_owner/share/constans/route/paw_routes.dart';
import 'package:paw_fund_shelter_owner/share/data_binding/data_binding.dart';

Future<void> main() async {
  await dotenv.load(fileName: ".env.develop");
  WidgetsFlutterBinding.ensureInitialized();

  final apiKey = dotenv.env['FIREBASE_API_KEY'];
  final authDomain = dotenv.env['FIREBASE_AUTH_DOMAIN'];
  final databaseURL = dotenv.env['FIREBASE_DB_URL'];
  final projectId = dotenv.env['FIREBASE_PROJECT_ID'];
  final storageBucket = dotenv.env['FIREBASE_STORAGE_BUCKET'];
  final messagingSenderId = dotenv.env['FIREBASE_MESSAGING_SENDER_ID'];
  final appId = dotenv.env['FIREBASE_APP_ID'];
  final measurementId = dotenv.env['FIREBASE_MEASUREMENT_ID'];

  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: apiKey!,
        authDomain: authDomain!,
        databaseURL: databaseURL!,
        projectId: projectId!,
        storageBucket: storageBucket!,
        messagingSenderId: messagingSenderId!,
        appId: appId!,
        measurementId: measurementId!,
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

