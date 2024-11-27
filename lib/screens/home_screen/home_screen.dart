import 'package:flutter/material.dart';

import 'components/flight_form.dart';
import 'components/home_top_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: HomeTopSection(
              tabController: tabController,
            ),
          ),
          SliverFillRemaining(
            child: Container(
              color: Colors.white,
              child: TabBarView(controller: tabController, children: const [
                BuildFlightForm(),
                Center(
                  child: Text('Train'),
                ),
                Center(
                  child: Text('Taxi'),
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }
}
