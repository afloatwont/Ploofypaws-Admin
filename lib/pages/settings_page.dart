import 'package:flutter/material.dart';

class ProfileSettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Profile Settings'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: size.width * 0.15,
                    backgroundColor: Colors.grey[800],
                    child: Text(
                      'J',
                      style: TextStyle(
                        fontSize: size.width * 0.15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.photo_camera),
                    label: const Text('Change Photo'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[700],
                      foregroundColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.02),
            _buildTextField(context,
                label: 'Name', initialValue: 'Angad Singh'),
            _buildTextField(context,
                label: 'Speciality',
                hintText: 'Please enter your speciality eg. Cardiologist'),
            _buildTextField(
              context,
              label: 'Email Address',
              initialValue: 'singhjaskeerat753@gmail.com',
              readOnly: true,
              suffixIcon: const Icon(Icons.verified, color: Colors.green),
            ),
            _buildTextField(context,
                label: 'Phone Number', initialValue: '+91 - 7303413985'),
            SizedBox(height: size.height * 0.02),
            Text(
              'Verified',
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.04,
              ),
            ),
            SizedBox(height: size.height * 0.01),
            Container(
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.015, horizontal: size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(size.width * 0.02),
              ),
              child: Row(
                children: [
                  Text(
                    'Medical ID',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.width * 0.04,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Uploaded (Under Verification)',
                    style: TextStyle(
                      color: Colors.orange,
                      fontSize: size.width * 0.035,
                    ),
                  ),
                  Icon(
                    Icons.warning,
                    color: Colors.orange,
                    size: size.width * 0.05,
                  ),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: size.height * 0.08,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                ),
                child:
                    Text('Save', style: TextStyle(fontSize: size.width * 0.05)),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  Widget _buildTextField(BuildContext context,
      {required String label,
      String? initialValue,
      String? hintText,
      bool readOnly = false,
      Widget? suffixIcon}) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: size.width * 0.04,
            ),
          ),
          SizedBox(height: size.height * 0.005),
          TextFormField(
            initialValue: initialValue,
            readOnly: readOnly,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: Colors.grey[800],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(size.width * 0.02),
                borderSide: BorderSide.none,
              ),
              suffixIcon: suffixIcon,
            ),
            style: const TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
