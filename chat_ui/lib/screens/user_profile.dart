import 'package:chat_ui/screens/edit_profile.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfileScreen(),
                    ));
              },
              icon: Icon(Icons.edit))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          CircleAvatar(
            radius: 64,
            // backgroundImage: AssetImage(''),
            child: Icon(Icons.person),
          ),
          SizedBox(height: 16),
          Text(
            'John Doe',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'johndoe@gmail.com',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Divider(),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('123-456-7890'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle phone number tap
            },
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text('johndoe@gmail.com'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle email tap
            },
          ),
          ListTile(
            leading: Icon(Icons.lock),
            title: Text('Change Password'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Handle password change tap
            },
          ),
        ],
      ),
    );
  }
}
