import 'package:flutter/material.dart';
import 'package:haber/widgets/floating_appbar.dart';
import 'package:haber/widgets/profile_logged_in.dart';

import 'package:haber/widgets/profile_main_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProfileLoggedInPage(),
      floatingActionButton: FloatingBottomAppBar(
        isHome: false,
        isBookmark: false,
        isProfilePage: true,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
