import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haber/constants/categories.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/constants/routes.dart';
import 'package:haber/models/article_model.dart';
import 'package:haber/services/article_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:image_picker/image_picker.dart';

const List<String> categories = categoriesList;

class AddArticlePage extends StatefulWidget {
  const AddArticlePage({super.key});

  @override
  State<AddArticlePage> createState() => _AddArticlePageState();
}

class _AddArticlePageState extends State<AddArticlePage> {
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _contentController;
  late TextEditingController _urlController;

  String dropdownValue = categories.first;
  String _img = '';

  ArticleModel article = ArticleModel();

  Future<XFile?> getImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return image;
  }

  @override
  void initState() {
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _contentController = TextEditingController();
    _urlController = TextEditingController();

    super.initState();
  }

  addArticle(
    String title,
    String description,
    String content,
    String url,
    String img,
    String category,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String token = prefs.getString('token') ?? '';
    ArticleService articleService = ArticleService(token);
    article = await articleService.createArticle(
      title,
      description,
      content,
      url,
      img,
      category,
    );
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _contentController.dispose();
    _urlController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.85,
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
          child: ListView(
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
                      textInputAction: TextInputAction.next,
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
                      textInputAction: TextInputAction.next,
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
                      controller: _urlController,
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
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: _img == ''
                              ? const Icon(
                                  Icons.image,
                                  size: 150,
                                  color: Colors.black54,
                                )
                              : Image.file(
                                  File(_img),
                                  fit: BoxFit.cover,
                                ),
                        ),
                        Semantics(
                          label: 'Resim Seç',
                          child: TextButton(
                            onPressed: () async {
                              final XFile? image = await getImage();
                              if (image != null) {
                                setState(() {
                                  _img = image.path;
                                });
                              }
                            },
                            style: ButtonStyle(
                              fixedSize: MaterialStateProperty.all(
                                  const Size(140, 75)),
                              backgroundColor: MaterialStateProperty.all(
                                  secondaryDarkBlueClr),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              alignment: Alignment.center,
                            ),
                            child: const Text(
                              'Resim Seç',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Nunito-Black',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    TextButton(
                      onPressed: () async {
                        await addArticle(
                          _titleController.text,
                          _descriptionController.text,
                          _contentController.text,
                          _urlController.text,
                          _img,
                          dropdownValue,
                        );

                        _titleController.clear();
                        _descriptionController.clear();
                        _contentController.clear();
                        _urlController.clear();
                        dropdownValue = categories.first;
                        _img = '';

                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Makale Eklendi.',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontFamily: "Nunito-Regular",
                              ),
                            ),
                            margin: EdgeInsets.all(20),
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(20),
                              ),
                            ),
                          ),
                        );
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
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, profileRoute);
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
                    const SizedBox(height: 40),
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
