import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AvailabilityPage extends StatefulWidget {
  const AvailabilityPage({super.key});

  @override
  _AvailabilityPageState createState() => _AvailabilityPageState();
}

class _AvailabilityPageState extends State<AvailabilityPage> {
  final List<bool> _availability = List.filled(7, false);
  final List<DateTime> _weekDays = [];

  @override
  void initState() {
    super.initState();
    _generateWeekDays();
  }

  void _generateWeekDays() {
    DateTime now = DateTime.now();
    int currentWeekday = now.weekday;
    DateTime startOfWeek =
        now.subtract(Duration(days: currentWeekday - 1)); // Start from Monday

    for (int i = 0; i < 7; i++) {
      _weekDays.add(startOfWeek.add(Duration(days: i)));
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text(
          'Availability',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: 7,
        itemBuilder: (context, index) {
          bool isPastDay = _weekDays[index].isBefore(now) &&
              !_isSameDay(_weekDays[index], now);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: ListTile(
                title: Text(
                  DateFormat('EEEE, dd/MM').format(_weekDays[index]),
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: Switch(
                  value: _availability[index],
                  onChanged: isPastDay
                      ? null
                      : (bool value) {
                          setState(() {
                            _availability[index] = value;
                          });
                        },
                  activeColor: Colors.blue,
                  inactiveThumbColor: isPastDay ? Colors.grey : null,
                  inactiveTrackColor: isPastDay ? Colors.grey[600] : null,
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Add your save functionality here
        },
        label: const Text('Save'),
        icon: const Icon(Icons.save),
        backgroundColor: const Color.fromARGB(255, 6, 91, 160),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
      ),
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
