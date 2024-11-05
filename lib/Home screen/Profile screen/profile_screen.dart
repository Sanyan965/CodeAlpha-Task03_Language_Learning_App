import 'package:flutter/material.dart';

class profile_screen extends StatelessWidget {
  const profile_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SettingsOption(
              icon: Icons.person,
              title: 'Edit Profile',
              onTap: () => showSnackbar(context, 'Edit Profile tapped'),
            ),
            SettingsOption(
              icon: Icons.settings,
              title: 'Settings',
              onTap: () => showSnackbar(context, 'Settings tapped'),
            ),
            SettingsOption(
              icon: Icons.language,
              title: 'My Languages',
              onTap: () => showSnackbar(context, 'My Languages tapped'),
            ),
            SettingsOption(
              icon: Icons.group,
              title: 'Invite Friends',
              onTap: () => showSnackbar(context, 'Invite Friends tapped'),
            ),
            SettingsOption(
              icon: Icons.help,
              title: 'Help',
              onTap: () => showSnackbar(context, 'Help tapped'),
            ),
            SettingsOption(
              icon: Icons.lock,
              title: 'Get Access',
              onTap: () => showSnackbar(context, 'Get Access tapped'),
            ),
          ],
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }
}

class SettingsOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  SettingsOption(
      {required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.deepPurple),
              const SizedBox(width: 16),
              Text(
                title,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
