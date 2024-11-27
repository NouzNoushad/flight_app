import 'package:flight_app/helpers/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../helpers/dotted_line.dart';

const List<String> classes = ['Business', 'Economy', 'First', 'Premium'];

class OneWayFields extends StatefulWidget {
  const OneWayFields({super.key});

  @override
  State<OneWayFields> createState() => _OneWayFieldsState();
}

class _OneWayFieldsState extends State<OneWayFields> {
  DateTime _selectedDateTime = DateTime.now();
  String _selectedClass = classes.first;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(237, 242, 246, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Row(
            children: [
              Expanded(
                  child: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.flight_takeoff_outlined,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Expanded(
                          child: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: 'City or Airport',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ))))
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomPaint(painter: DashedLinePainter(), child: Container()),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.flight_land_outlined,
                        color: Colors.grey.shade600,
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      const Expanded(
                          child: TextField(
                              decoration: InputDecoration.collapsed(
                                  hintText: 'Where are you going?',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ))))
                    ],
                  ),
                ],
              )),
              const CircleAvatar(
                backgroundColor: Colors.white,
                child: RotatedBox(
                  quarterTurns: 1,
                  child: Icon(Icons.sync_alt),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
            vertical: 15,
          ),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(237, 242, 246, 1),
            borderRadius: BorderRadius.circular(5),
          ),
          child: InkWell(
            onTap: () async {
              DateTime? dateTime = await selectDateTime(context);
              if (dateTime != null) {
                setState(() {
                  _selectedDateTime = dateTime;
                });
              }
            },
            child: Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Colors.grey.shade600,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  DateFormat.yMMMMEEEEd().format(_selectedDateTime),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Row(
          children: [
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 15,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(237, 242, 246, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.group_outlined,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  const Expanded(
                      child: TextField(
                          decoration: InputDecoration.collapsed(
                              hintText: 'Passengers',
                              hintStyle: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ))))
                ],
              ),
            )),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 15,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(237, 242, 246, 1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.airline_seat_recline_normal,
                    color: Colors.grey.shade600,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                    value: _selectedClass,
                    items: classes.map((value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _selectedClass = value!;
                      });
                    },
                  )))
                ],
              ),
            )),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 50,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade600,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            child: const Text(
              'Find Tickets',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        )
      ],
    );
  }
}
