import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/constants/routes.dart';

class ProfileMainPage extends StatelessWidget {
  const ProfileMainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: const Color(0xffF5F5F5),
          borderRadius: const BorderRadius.all(
            Radius.circular(20),
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
          border: Border.all(
            color: Colors.black12,
            width: 1,
          ),
        ),
        child: Column(
          children: [
            const Text(
              'Profilim',
              style: TextStyle(
                color: secondaryDarkBlueClr,
                fontFamily: "Nunito-Black",
                fontSize: 30,
                fontWeight: FontWeight.bold,
                height: 2,
              ),
              textAlign: TextAlign.center,
            ),
            const Divider(
              color: Colors.black,
              thickness: 1,
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 240,
              width: MediaQuery.of(context).size.width * 0.7,
              child: Image.asset(
                'assets/images/login.png',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, loginRoute);
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(240, 60)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.0),
                    side: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
              child: const Text(
                'GİRİŞ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: "Nunito-Regular",
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              '--- Ya Da ---',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontFamily: "Nunito-Bold",
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, registerRoute);
              },
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(240, 60)),
                backgroundColor:
                    MaterialStateProperty.all(secondaryDarkBlueClr),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(26.0),
                    side: const BorderSide(color: secondaryDarkBlueClr),
                  ),
                ),
              ),
              child: const Text(
                'KAYIT OL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontFamily: "Nunito-Regular",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
