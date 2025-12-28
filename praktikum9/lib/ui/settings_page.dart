import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notifications = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
        backgroundColor: Colors.purple,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader('Preferensi'),
          _buildSwitchSetting(
            'Notifikasi',
            'Terima notifikasi aplikasi',
            _notifications,
            (value) {
              setState(() {
                _notifications = value;
              });
            },
            Icons.notifications,
          ),
          _buildSwitchSetting(
            'Mode Gelap',
            'Aktifkan tampilan dark mode',
            _darkMode,
            (value) {
              setState(() {
                _darkMode = value;
              });
            },
            Icons.dark_mode,
          ),
          const SizedBox(height: 20),
          _buildSectionHeader('Akun'),
          _buildListTile('Ubah Password', Icons.lock, () {}),
          _buildListTile('Privasi & Keamanan', Icons.security, () {}),
          const SizedBox(height: 20),
          _buildSectionHeader('Lainnya'),
          _buildListTile('Bantuan & Dukungan', Icons.help, () {}),
          _buildListTile('Tentang Aplikasi', Icons.info, () {}),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.purple,
        ),
      ),
    );
  }

  Widget _buildSwitchSetting(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
    IconData icon,
  ) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: onChanged,
      secondary: Icon(icon, color: Colors.purple),
    );
  }

  Widget _buildListTile(String title, IconData icon, Function() onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.purple),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}