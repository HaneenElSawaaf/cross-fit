import 'package:cross_fit/app.dart';
import 'package:cross_fit/core/shared/user_utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/shared/bloc_observer.dart';
import 'firebase_options.dart';
import 'injector.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.init();
  Bloc.observer = MyBlocObserver();
  UserUtils.uid = FirebaseAuth.instance.currentUser?.uid;
  runApp(const CrossFitApp());
}
