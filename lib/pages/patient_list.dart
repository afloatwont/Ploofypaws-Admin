import 'package:flutter/material.dart';

class PatientListPage extends StatefulWidget {
  const PatientListPage({super.key});

  @override
  State<PatientListPage> createState() => _PatientListPageState();
}

class _PatientListPageState extends State<PatientListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title:
            const Text('Patient List', style: TextStyle(color: Colors.white)),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              borderRadius: BorderRadius.circular(40),
            ),
            child: const Row(
              children: [
                Icon(Icons.add, color: Colors.white),
                // const SizedBox(width: 10),
                Text("Add Patient"),
              ],
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDateSection('30/5/2024', [
            _buildPatientCard('wjahahh', '18:10 PM', 'path/to/image1.jpg'),
          ]),
          _buildDateSection('19/1/2024', [
            _buildPatientCard('fyti', '22:33 PM', 'path/to/image2.jpg'),
          ]),
          _buildDateSection('7/12/2023', [
            _buildPatientCard('hah', '22:22 PM', 'path/to/image3.jpg'),
          ]),
        ],
      ),
    );
  }

  Widget _buildDateSection(String date, List<Widget> patientCards) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            date,
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
        Column(children: patientCards),
      ],
    );
  }

  Widget _buildPatientCard(String name, String time, String imagePath) {
    return Card(
      color: Colors.grey[900],
      child: Container(
        alignment: Alignment.center,
        height: MediaQuery.sizeOf(context).height * 0.1,
        child: ListTile(
          leading: const CircleAvatar(
            // backgroundImage: AssetImage(imagePath),
            backgroundColor: Colors.white,
          ),
          title: Text(name, style: const TextStyle(color: Colors.white)),
          subtitle: Text(time, style: const TextStyle(color: Colors.grey)),
          trailing: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black12,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                    side: BorderSide(color: Colors.white, width: 1))),
            child: const Text('View Report'),
          ),
        ),
      ),
    );
  }
}
