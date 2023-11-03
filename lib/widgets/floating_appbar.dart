import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/constants/routes.dart';

class FloatingBottomAppBar extends StatelessWidget {
  final bool isHome;
  final bool isBookmark;
  const FloatingBottomAppBar(
      {super.key, required this.isHome, required this.isBookmark});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: MediaQuery.of(context).size.width / 1.4,
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 2),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              IconButton(
                onPressed: () {
                  if (isHome) return;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    homeRoute,
                    (route) => false,
                  );
                },
                icon: Icon(
                  Icons.home,
                  color: isHome ? primaryClr : Colors.black,
                ),
              ),
              Text(
                'Home',
                style: TextStyle(
                  color: isHome ? primaryClr : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Column(
            children: [
              IconButton(
                onPressed: () {
                  if (isBookmark) return;
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    bookmarkRoute,
                    (route) => false,
                  );
                },
                icon: Icon(
                  Icons.bookmark,
                  color: isBookmark ? primaryClr : Colors.black,
                ),
              ),
              Text(
                'Bookmark',
                style: TextStyle(
                  color: isBookmark ? primaryClr : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
