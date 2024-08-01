import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Menu'),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: size.width * 0.1,
              backgroundColor: Colors.grey[800],
              child: Text(
                'J',
                style: TextStyle(
                  fontSize: size.width * 0.1,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              'Dr. Angad Singh',
              style: TextStyle(
                fontSize: size.width * 0.05,
                color: Colors.white,
              ),
            ),
            SizedBox(height: size.height * 0.02),
            _buildMenuItem(
              context,
              icon: Icons.account_balance_wallet,
              label: 'Wallet',
              isLocked: true,
            ),
            _buildMenuItem(
              context,
              icon: Icons.settings,
              label: 'Profile Settings',
            ),
            _buildMenuItem(
              context,
              icon: Icons.description,
              label: 'Terms & Conditions',
            ),
            _buildMenuItem(
              context,
              icon: Icons.support_agent,
              label: 'Support',
            ),
            _buildMenuItem(
              context,
              icon: Icons.logout,
              label: 'Logout',
            ),
            _buildMenuItem(
              context,
              icon: Icons.delete,
              label: 'Delete Account',
              isDestructive: true,
            ),
            const Spacer(),
            Text(
              'Version 1.0.0',
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.04,
              ),
            ),
          ],
        ),
      ),
    
      backgroundColor: Colors.black,
    );
  }

  Widget _buildMenuItem(BuildContext context, {required IconData icon, required String label, bool isLocked = false, bool isDestructive = false}) {
    final size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
      child: Row(
        children: [
          Icon(
            icon,
            color: isDestructive ? Colors.red : Colors.white,
            size: size.width * 0.07,
          ),
          SizedBox(width: size.width * 0.04),
          Text(
            label,
            style: TextStyle(
              fontSize: size.width * 0.045,
              color: isDestructive ? Colors.red : Colors.white,
            ),
          ),
          const Spacer(),
          if (isLocked)
            Icon(
              Icons.lock,
              color: Colors.grey,
              size: size.width * 0.05,
            ),
        ],
      ),
    );
  }
}
