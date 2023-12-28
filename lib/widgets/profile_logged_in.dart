import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/constants/routes.dart';

class ProfileLoggedInPage extends StatefulWidget {
  const ProfileLoggedInPage({super.key});

  @override
  State<ProfileLoggedInPage> createState() => _ProfileLoggedInPageState();
}

class _ProfileLoggedInPageState extends State<ProfileLoggedInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Profilim',
                  style: TextStyle(
                    color: secondaryDarkBlueClr,
                    fontSize: 25,
                    fontFamily: 'Nunito-Black',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // TODO: Add logout functionality here
                  },
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(secondaryDarkBlueClr),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 10,
                      ),
                    ),
                  ),
                  child: const Text(
                    'ÇIKIŞ YAP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontFamily: 'Nunito-Black',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Kişisel Bilgileriniz',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontFamily: 'Nunito-Black',
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.black87,
                  size: 35,
                ),
                SizedBox(width: 20),
                Text(
                  'Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito-Regular',
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            const Row(
              children: [
                Icon(
                  Icons.person_2,
                  color: Colors.black87,
                  size: 35,
                ),
                SizedBox(width: 20),
                Text(
                  'Surname',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito-Regular',
                  ),
                ),
              ],
            ),
            const Divider(
              color: Colors.black38,
              thickness: 1,
            ),
            const Row(
              children: [
                Icon(
                  Icons.email,
                  color: Colors.black87,
                  size: 35,
                ),
                SizedBox(width: 20),
                Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'Nunito-Regular',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Benim Makalelerim',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontFamily: 'Nunito-Black',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, addArticleRoute);
                  },
                  child: const Text(
                    'EKLE >',
                    style: TextStyle(
                      color: secondaryDarkBlueClr,
                      fontSize: 20,
                      fontFamily: 'Nunito-Regular',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // TODO: Add ListView.builder() here
          ],
        ),
      ),
    );
  }
}
