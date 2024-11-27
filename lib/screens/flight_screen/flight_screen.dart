import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'components/flight_results.dart';

class FlightScreen extends StatefulWidget {
  const FlightScreen({super.key});

  @override
  State<FlightScreen> createState() => _FlightScreenState();
}

class _FlightScreenState extends State<FlightScreen> {
  late final List<DateTime> _days;
  late final ScrollController _scrollController;
  late DateTime _selectedDate;
  bool _isSelected = false;

  List<DateTime> _initiateDays(DateTime start, DateTime end) {
    final List<DateTime> days = [];
    bool conditions(int i) =>
        start.add(Duration(days: i)).isBefore(end) ||
        start.add(Duration(days: i)) == end;
    for (int i = 0; conditions(i); i++) {
      days.add(start.add(Duration(days: i)));
    }
    return days;
  }

  double _initialOffset() {
    final DateTime today = DateTime.now();
    final index = _days.indexWhere((day) =>
        day.year == today.year &&
        day.month == today.month &&
        day.day == today.day);

    if (index == -1) {
      return 0;
    }

    double dayWidth = 70;
    double spacing = 8;

    return index * (dayWidth + spacing);
  }

  String _daysOfWeek(DateTime date) {
    final List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];
    return days[date.weekday % 7];
  }

  _changeDate(DateTime day) {
    _isSelected = _selectedDate.year == day.year &&
        _selectedDate.month == day.month &&
        _selectedDate.day == day.day;
  }

  bool _compareDate(DateTime date) {
    return DateUtils.isSameDay(date, DateTime.now());
  }

  @override
  void initState() {
    DateTime startDate = DateTime.now().subtract(const Duration(days: 50));
    DateTime endDate = DateTime.now().add(const Duration(days: 50));
    _days = _initiateDays(startDate, endDate);
    _scrollController = ScrollController(
      initialScrollOffset: _initialOffset(),
    );
    _selectedDate = DateTime.now();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Flight'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
        ],
      ),
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(255, 226, 241, 253),
            child: SizedBox(
              height: 80,
              child: ListView.builder(
                  controller: _scrollController,
                  scrollDirection: Axis.horizontal,
                  itemCount: _days.length,
                  itemBuilder: (context, index) {
                    final DateTime day = _days[index];
                    final bool isToday = day.year == DateTime.now().year &&
                        day.month == DateTime.now().month &&
                        day.day == DateTime.now().day;
                    _changeDate(day);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedDate = day;
                        });
                      },
                      child: Container(
                        width: 70,
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                          ),
                          color: _isSelected || isToday
                              ? Colors.white
                              : Colors.transparent,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${day.day}',
                              style: TextStyle(
                                fontSize: isToday || _isSelected ? 22 : 19,
                                fontWeight: isToday || _isSelected
                                    ? FontWeight.w500
                                    : FontWeight.w400,
                                color: isToday || _isSelected
                                    ? Colors.blue
                                    : Colors.black,
                              ),
                            ),
                            Text(
                              _daysOfWeek(day),
                              style: TextStyle(
                                color: isToday ? Colors.black : Colors.black54,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
          ),
          Expanded(
              child: _compareDate(_selectedDate)
                  ? const FlightResults()
                  : Center(
                      child: Text(
                        DateFormat.yMMMEd().format(_selectedDate),
                      ),
                    )),
        ],
      ),
    );
  }
}
