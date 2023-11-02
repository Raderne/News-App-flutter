import 'package:flutter/material.dart';
import 'package:haber/constants/colors.dart';
import 'package:haber/models/category_model.dart';

typedef CategoryCallback = void Function(CategoryModel category);

class CategoryTile extends StatelessWidget {
  final String? category;
  final bool? isSelected;
  final CategoryCallback? onSelected;

  const CategoryTile({super.key, this.category, this.isSelected, this.onSelected,});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: GestureDetector(
        onTap: () {
          onSelected!(CategoryModel(categoryName: category ,isSelected: isSelected!));
        },
        child: Chip(
          label: Text(
            category!,
            style: TextStyle(
              color: isSelected! ? Colors.white : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: isSelected! ? primaryClr : Colors.transparent,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: BorderSide(color: isSelected! ? primaryClr : Colors.grey),
          ),
        ),
      ),
    );
  }
}