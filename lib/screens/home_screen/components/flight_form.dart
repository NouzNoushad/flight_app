import 'package:flutter/material.dart';

import 'one_way_fields.dart';

class BuildFlightForm extends StatefulWidget {
  const BuildFlightForm({super.key});

  @override
  State<BuildFlightForm> createState() => _BuildFlightFormState();
}

class _BuildFlightFormState extends State<BuildFlightForm>
    with TickerProviderStateMixin {
  late TabController _flightController;

  @override
  void initState() {
    _flightController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromRGBO(237, 242, 246, 1),
              ),
              child: TabBar(
                  controller: _flightController,
                  dividerHeight: 0,
                  overlayColor:
                      const WidgetStatePropertyAll(Colors.transparent),
                  labelColor: Colors.black,
                  indicatorPadding: const EdgeInsets.all(3),
                  indicator: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelPadding: const EdgeInsets.symmetric(vertical: 10),
                  tabs: const [
                    Text('One-way'),
                    Text('Round Trip'),
                  ]),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 400,
              child: TabBarView(
                controller: _flightController,
                children: const [
                  OneWayFields(),
                  Center(
                    child: Text('Round Trip'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
