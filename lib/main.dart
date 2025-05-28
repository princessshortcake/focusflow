import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'screens/login_page.dart';
import 'screens/register_page.dart';
import 'screens/forgot_password_page.dart';
import 'screens/logout_page.dart';
import 'screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyB6FDlhlLf72PSb2W_7vAXKS2eO8ZHU1TQ",
        authDomain: "focusflow-4a0ee.firebaseapp.com",
        projectId: "focusflow-4a0ee",
        storageBucket: "focusflow-4a0ee.firebasestorage.app",
        messagingSenderId: "1063820813966",
        appId: "1:1063820813966:web:eca65d547c678766efcbdf",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FocusFlow',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/forgot': (context) => const ForgotPasswordPage(),
        '/home': (context) => const HomePage(),
        '/logout': (context) => const LogoutPage(),
      },
    );
  }
}
