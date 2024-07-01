import '../widgets/home_sections/home_app_bar_section.dart';
import '../widgets/home_sections/home_historical_character_section.dart';
import '../widgets/home_sections/home_historical_period_section.dart';
import '../widgets/home_sections/home_historical_souvenirs_section.dart';

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: CustomScrollView(
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(child: HomeAppBarSection()),
            SliverToBoxAdapter(child: HistoricalPeriodsSection()),
            SliverToBoxAdapter(child: HistoricalCharactersSection()),
            SliverToBoxAdapter(child: HistoricalSouvenirsSection()),
          ],
        ),
      ),
    );
  }
}
