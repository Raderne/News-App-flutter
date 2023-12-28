import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/constants/routes.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late TextEditingController _userNameController;
  late TextEditingController _userLastNameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    _userNameController = TextEditingController();
    _userLastNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _userLastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kayıt Ol',
          style: TextStyle(
            color: secondaryDarkBlueClr,
            fontSize: 35,
            fontFamily: 'Nunito-Black',
            height: 2,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: SizedBox(
                child: Image.asset('assets/images/register_img.png'),
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                hintText: 'Kullanıcı Adı',
                hintStyle: const TextStyle(
                  color: Colors.black54,
                  fontFamily: "Nunito-Regular",
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
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
              controller: _userLastNameController,
              decoration: InputDecoration(
                hintText: 'Kullanıcı Soyadı',
                hintStyle: const TextStyle(
                  color: Colors.black54,
                  fontFamily: "Nunito-Regular",
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
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
                  borderRadius: BorderRadius.circular(10),
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
                  borderRadius: BorderRadius.circular(10),
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
            const SizedBox(height: 40),
            TextButton(
              onPressed: () {
                if (_userNameController.text.isNotEmpty &&
                    _userLastNameController.text.isNotEmpty &&
                    _emailController.text.isNotEmpty &&
                    _passwordController.text.isNotEmpty) {
                  Navigator.popAndPushNamed(context, loginRoute);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        'Lütfen tüm alanları doldurunuz.',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontFamily: "Nunito-Regular",
                        ),
                      ),
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
                'KAYIT OL',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: "Nunito-Regular",
                ),
              ),
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Bir hesabınız var mı?',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: "Nunito-Regular",
                    fontWeight: FontWeight.normal,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.popAndPushNamed(context, loginRoute);
                  },
                  child: const Text(
                    'Giriş Yap',
                    style: TextStyle(
                      color: secondaryDarkBlueClr,
                      fontSize: 16,
                      fontFamily: "Nunito-Bold",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
              ],
            )
          ],
        ),
      ),
    );
  }
}
