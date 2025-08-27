import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account'),
        backgroundColor: const Color(0xFF4C53A5),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              _buildProfileSection(),
              const SizedBox(height: 30),
              _buildSettingsSection(context),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= PROFILE SECTION =================
Widget _buildProfileSection() {
  return Container(
    decoration: const BoxDecoration(
      gradient: LinearGradient(
        colors: [Color(0xFF4C53A5), Color(0xFF6B7CDA)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ),
      borderRadius: BorderRadius.all(Radius.circular(15)),
    ),
    padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
    child: Row(
      children: [
        ClipOval(
          child: Image.asset(
            'assets/images/ucupa.jpg',
            width: 100,
            height: 100,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Abdu Maman',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'abdumaman@example.com',
              style: TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ],
    ),
  );
}

// ================= SETTING ITEM =================
Widget _buildSettingItem(
  BuildContext context, {
  required IconData icon,
  required String title,
  required VoidCallback onTap,
}) {
  return Card(
    elevation: 4,
    margin: const EdgeInsets.symmetric(vertical: 10),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15),
    ),
    child: ListTile(
      leading: Icon(icon, color: const Color(0xFF4C53A5), size: 28),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: onTap,
    ),
  );
}

// ================= SETTINGS SECTION =================
Widget _buildSettingsSection(BuildContext context) {
  return Column(
    children: [
      _buildSettingItem(
        context,
        icon: Icons.person_outline,
        title: 'Profile',
        onTap: () {
          Navigator.pushNamed(context, 'AccountPage');
        },
      ),
      _buildSettingItem(
        context,
        icon: Icons.lock_outline,
        title: 'Change Password',
        onTap: () {
          Navigator.pushNamed(context, 'ChangePassword');
        },
      ),
      _buildSettingItem(
        context,
        icon: Icons.notifications_outlined,
        title: 'Notifications',
        onTap: () {
          Navigator.pushNamed(context, 'Notifications');
        },
      ),
      _buildSettingItem(
        context,
        icon: Icons.help_outline,
        title: 'Help & Support',
        onTap: () {
          Navigator.pushNamed(context, 'Help');
        },
      ),
      _buildSettingItem(
        context,
        icon: Icons.logout,
        title: 'Logout',
        onTap: () {
          _showLogoutDialog(context);
        },
      ),
    ],
  );
}

// ================= LOGOUT DIALOG =================
void _showLogoutDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text(
          'Logout',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, 'LoginPage');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF4C53A5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: const Text(
              'Logout',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      );
    },
  );
}
