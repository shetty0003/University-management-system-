import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSectionTitle('Account Settings'),
            _buildSettingsOption(
              context,
              title: 'Profile',
              icon: Icons.account_circle,
              onTap: () {
                // Navigate to profile edit screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen('Profile')));
              },
            ),
            _buildSettingsOption(
              context,
              title: 'Email Settings',
              icon: Icons.email,
              onTap: () {
                // Navigate to email settings screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen('Email Settings')));
              },
            ),
            _buildDivider(),
            _buildSectionTitle('Notification Settings'),
            _buildSettingsOption(
              context,
              title: 'Push Notifications',
              icon: Icons.notifications,
              onTap: () {
                // Navigate to notification settings screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen('Push Notifications')));
              },
            ),
            _buildDivider(),
            _buildSectionTitle('App Settings'),
            _buildSettingsOption(
              context,
              title: 'Dark Mode',
              icon: Icons.dark_mode,
              onTap: () {
                // Handle dark mode toggle
              },
            ),
            _buildSettingsOption(
              context,
              title: 'Language',
              icon: Icons.language,
              onTap: () {
                // Navigate to language settings screen
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PlaceholderScreen('Language')));
              },
            ),
            _buildDivider(),
            _buildSettingsOption(
              context,
              title: 'Log Out',
              icon: Icons.logout,
              onTap: () async {
                // Log out the user
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacementNamed(context, '/login'); // Or navigate to login screen
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingsOption(BuildContext context, {required String title, required IconData icon, required VoidCallback onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.orangeAccent),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return const Divider();
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: Text('This is the $title screen'),
      ),
    );
  }
}
// TODO Implement this library.