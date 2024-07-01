import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/widgets/custom_header_text.dart';
import '../home_custom_category_list_view.dart';
import 'package:flutter/material.dart';

class HistoricalSouvenirsSection extends StatelessWidget {
  const HistoricalSouvenirsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomHeaderText(
                  text: AppStrings.historicalSouvenirs,
                ),
        SizedBox(height: 16),
        CustomCategoryListView(),
        SizedBox(height: 64),
      ],
    );
  }
}