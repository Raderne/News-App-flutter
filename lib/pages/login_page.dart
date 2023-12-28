import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/constants/routes.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.53,
          decoration: BoxDecoration(
            color: const Color(0xffF5F5F5),
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
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
                'GİRİŞ',
                style: TextStyle(
                  color: secondaryDarkBlueClr,
                  fontFamily: "Nunito-Black",
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  height: 2,
                  letterSpacing: 4,
                ),
                textAlign: TextAlign.center,
              ),
              const Divider(
                color: Colors.black38,
                thickness: 1,
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(
                        hintText: 'E-posta',
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                          fontFamily: "Nunito-Regular",
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: secondaryDarkBlueClr,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Şifre',
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                          fontFamily: "Nunito-Regular",
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: const BorderSide(
                            color: secondaryDarkBlueClr,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
              TextButton(
                onPressed: () {
                  if (_emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    // TODO: Login process here
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Lütfen boş alan bırakmayınız.'),
                        margin: EdgeInsets.all(20),
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                      ),
                    );
                  }
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
                  'GİRİŞ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: "Nunito-Regular",
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Hesabınız yok mu?',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontFamily: "Nunito-Regular",
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, registerRoute);
                    },
                    child: const Text(
                      'Kayıt Ol',
                      style: TextStyle(
                        color: secondaryDarkBlueClr,
                        fontSize: 16,
                        fontFamily: "Nunito-Bold",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
