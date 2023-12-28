// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';

const List<String> categories = [
  'Spor',
  'Ekonomi',
  'Teknoloji',
  'Sağlık',
  'Eğitim',
  'Magazin',
  'Dünya',
  'Yaşam',
  'Seyahat',
  'Kültür-Sanat',
  'Otomobil',
  'Yazarlar',
];

class AddArticlePage extends StatefulWidget {
  const AddArticlePage({super.key});

  @override
  State<AddArticlePage> createState() => _AddArticlePageState();
}

class _AddArticlePageState extends State<AddArticlePage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _contentController;
  late TextEditingController _UrlController;

  String dropdownValue = categories.first;

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _contentController = TextEditingController();
    _UrlController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _contentController.dispose();
    _UrlController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.8,
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
                'Makale Ekle',
                style: TextStyle(
                  color: secondaryDarkBlueClr,
                  fontFamily: "Nunito-Black",
                  fontSize: 30,
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
              const SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(
                        hintText: 'Makale Başlığı',
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                          fontFamily: "Nunito-Regular",
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: secondaryDarkBlueClr,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _descriptionController,
                      decoration: InputDecoration(
                        hintText: 'Makale Açıklaması',
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                          fontFamily: "Nunito-Regular",
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: secondaryDarkBlueClr,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 120,
                      child: TextField(
                        controller: _contentController,
                        decoration: InputDecoration(
                          hintText: 'Makale İçeriği',
                          hintStyle: const TextStyle(
                            color: Colors.black54,
                            fontFamily: "Nunito-Regular",
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                            height: 2.3,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(
                              color: secondaryDarkBlueClr,
                              width: 2,
                            ),
                          ),
                        ),
                        maxLines: null,
                        minLines: null,
                        expands: true,
                        textAlignVertical: TextAlignVertical.top,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _UrlController,
                      decoration: InputDecoration(
                        hintText: 'Makale URL',
                        hintStyle: const TextStyle(
                          color: Colors.black54,
                          fontFamily: "Nunito-Regular",
                          fontSize: 20,
                          fontWeight: FontWeight.normal,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: const BorderSide(
                            color: secondaryDarkBlueClr,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    DropdownMenu(
                      width: MediaQuery.of(context).size.width * 0.8,
                      initialSelection: categories.first,
                      dropdownMenuEntries: [
                        for (final category in categories)
                          DropdownMenuEntry(
                            value: category,
                            label: category,
                          ),
                      ],
                      menuStyle: MenuStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      inputDecorationTheme: InputDecorationTheme(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    TextButton(
                      onPressed: () {
                        // TODO: Add article process here
                      },
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(240, 45)),
                        backgroundColor:
                            MaterialStateProperty.all(secondaryDarkBlueClr),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                      ),
                      child: const Text(
                        'Makale Ekle',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Nunito-Black',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        fixedSize:
                            MaterialStateProperty.all(const Size(240, 45)),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                            side: const BorderSide(color: Colors.black),
                          ),
                        ),
                      ),
                      child: const Text(
                        'İPTAL ET',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Nunito-Black',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
