import 'home_custom_category_list_view_item.dart';
import 'package:flutter/material.dart';

class CustomCategoryListView extends StatelessWidget {
  const CustomCategoryListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 133,
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 16,
          );
        },
        itemBuilder: (_, index) {
          return const CustomCategoryListViewItem();
        },
        itemCount: 6,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}