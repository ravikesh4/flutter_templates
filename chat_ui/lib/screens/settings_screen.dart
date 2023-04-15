import 'package:chat_ui/screens/edit_profile.dart';
import 'package:chat_ui/screens/help_support_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool _isDarkModeEnabled = false;
  bool _areNotificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return MaterialApp(
      theme: ThemeData(
        brightness: _isDarkModeEnabled ? Brightness.dark : Brightness.light,
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_back)),
          title: Text('Settings'),
          
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.notifications),
                title: Text('Notifications', style: textTheme.subtitle1),
                trailing: Switch(
                  value: _areNotificationsEnabled,
                  onChanged: (value) {
                    setState(() {
                      _areNotificationsEnabled = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _areNotificationsEnabled = !_areNotificationsEnabled;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.dark_mode),
                title: Text('Dark Mode', style: textTheme.subtitle1),
                trailing: Switch(
                  value: _isDarkModeEnabled,
                  onChanged: (value) {
                    setState(() {
                      _isDarkModeEnabled = value;
                    });
                  },
                ),
                onTap: () {
                  setState(() {
                    _isDarkModeEnabled = !_isDarkModeEnabled;
                  });
                },
              ),
              ListTile(
                leading: Icon(Icons.language),
                title: Text('Language', style: textTheme.subtitle1),
                trailing: Text('English', style: textTheme.subtitle2),
                onTap: () {
                  // Handle language tap
                },
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Divider(),
              ),
              ListTile(
                leading: Icon(Icons.help),
                title: Text('Help & Support', style: textTheme.subtitle1),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HelpAndSupportScreen(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About', style: textTheme.subtitle1),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  // Handle about tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
