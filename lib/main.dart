import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:haber/constants/routes.dart';
import 'package:haber/firebase_options.dart';
import 'package:haber/pages/add_article_page.dart';
import 'package:haber/pages/home_page.dart';
import 'package:haber/pages/landing_page.dart';
import 'package:haber/pages/login_page.dart';
import 'package:haber/pages/profile_page.dart';
import 'package:haber/pages/register_page.dart';
import 'package:haber/pages/saved_articles.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        homeRoute: (context) => const HomePage(),
        bookmarkRoute: (context) => const SavedArticlesPage(),
        profileRoute: (context) => const ProfilePage(),
        loginRoute: (context) => const LoginPage(),
        registerRoute: (context) => const RegisterPage(),
        addArticleRoute: (context) => const AddArticlePage(),
      },
      home: const LandingPage(),
      theme: ThemeData(
        fontFamily: "Nunito",
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
        ),
      ),
    );
  }
}
