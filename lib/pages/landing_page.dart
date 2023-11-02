import 'package:flutter/material.dart';
import 'package:haber/constants/routes.dart';
import 'package:haber/constants/colors.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/newspaperbg.jpg",
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
            ),
          ),
        ),
        Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 1.8),
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Text(
                "   İlk günden\nhaberdar olun",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontFamily: "Nunito-Black",
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                "Kusursuz Haber Uygulamamızla\n  en son Haberleri keşfedin",
                style: TextStyle(
                  fontSize: 20,
                  color: textLightClr,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 60),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: secondaryClr,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      homeRoute,
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: secondaryClr,
                    foregroundColor: Colors.white,
                    elevation: 0.0,
                    textStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text("Başlayalım"),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
