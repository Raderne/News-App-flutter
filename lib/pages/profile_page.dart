import 'package:flutter/material.dart';
import 'package:haber/widgets/floating_appbar.dart';
import 'package:haber/widgets/profile_logged_in.dart';

import 'package:haber/widgets/profile_main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  late String _token;

  Future<String> getToken() async {
    final SharedPreferences prefs = await _prefs;
    final String token = prefs.getString('token') ?? '';

    return token;
  }

  @override
  void initState() {
    super.initState();
    _token = '';
    getToken().then((value) {
      setState(() {
        _token = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _prefs,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (_token == '') {
              return const ProfileMainPage();
            } else {
              return const ProfileLoggedInPage();
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: const FloatingBottomAppBar(
        isHome: false,
        isBookmark: false,
        isProfilePage: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
