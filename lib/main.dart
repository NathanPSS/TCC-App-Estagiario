import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'package:hujb/api/token.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hujb/config/brightness_mode.dart';
import 'package:hujb/global/colors.dart';
import 'package:hujb/providers/theme_mode.dart';
import 'package:hujb/screens/NewHomeScreen.dart';
import 'package:hujb/screens/login.dart';

List<CameraDescription> cameras = [];


Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    cameras = await availableCameras();
    print(cameras);
    await dotenv.load(fileName: '.env');
  } on CameraException catch (e) {
    print('Error in fetching the cameras: $e');
  }
  runApp(
    ProviderScope(
      child: Consumer(
        builder: (ctx,ref,child) {
        return MaterialApp(
          darkTheme: kappDarkTheme,
        theme: kappLightTheme,
        themeMode: ref.watch(themeModeController),
        home: FutureBuilder(
          future: hasValidToken(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              if(snapshot.connectionState == ConnectionState.done){
                if(snapshot.data!){
                  return  LoginScreen();
                }
                return const LoginScreen();
              }
              return const Scaffold(body: Center(child: CircularProgressIndicator()));
          },
        )// HomeScreen() LoginScreen() CheckInScreen()
          );}
      ),
      ),
  );
}


