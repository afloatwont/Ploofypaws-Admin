import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:ploofypaws_doctor/widgets/patient_card.dart';

class AppointmentPage extends StatefulWidget {
  const AppointmentPage({super.key});

  @override
  _AppointmentPageState createState() => _AppointmentPageState();
}

class _AppointmentPageState extends State<AppointmentPage> {
  final List<DateTime> _weekDays = [];
  DateTime _selectedDate = DateTime.now();

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
    return Scaffold(
      appBar: AppBar(
        title: Text(DateFormat('MMMM yyyy').format(DateTime.now())),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _weekDays.length,
              itemBuilder: (context, index) {
                bool isSelected = _isSameDay(_weekDays[index], _selectedDate);
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedDate = _weekDays[index];
                    });
                  },
                  child: Container(
                    width: MediaQuery.sizeOf(context).width * 0.25,
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.blue : Colors.grey[800],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          DateFormat('d').format(_weekDays[index]),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          DateFormat('E').format(_weekDays[index]),
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Appointments',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          // const Expanded(
          //   child: Center(
          //     child: Text(
          //       'No Appointments',
          //       style: TextStyle(fontSize: 18, color: Colors.white),
          //     ),
          //   ),
          // ),
          const PatientCard(
              totalPatients: 3, addedPatientsToday: 7, totalSessions: 16),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }
}
