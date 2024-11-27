import 'package:flutter/material.dart';

class HomeTopSection extends StatefulWidget {
  const HomeTopSection({super.key, required this.tabController});
  final TabController tabController;

  @override
  State<HomeTopSection> createState() => _HomeTopSectionState();
}

class _HomeTopSectionState extends State<HomeTopSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      decoration: BoxDecoration(
          color: Colors.blue.shade100,
          borderRadius: const BorderRadius.only(
            bottomRight: Radius.circular(20),
          )),
      child: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Row(
              children: [
                Expanded(child: Text('Hello, John Doe')),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 226, 241, 253),
                      child: Icon(Icons.search),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 226, 241, 253),
                      child: Icon(Icons.notifications),
                    ),
                  ],
                )
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            child: const Text(
              'Where you off to Next?',
              style: TextStyle(
                fontSize: 26,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
            ),
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 226, 241, 253),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                )),
            child: TabBar(
              controller: widget.tabController,
              indicator: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )),
              labelPadding: const EdgeInsets.all(10),
              labelColor: Colors.black,
              indicatorPadding: EdgeInsets.zero,
              dividerHeight: 0,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.grey.shade600,
              tabs: const [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.flight),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Flight'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.train),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Train'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.local_taxi),
                    SizedBox(
                      width: 8,
                    ),
                    Text('Taxi'),
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
