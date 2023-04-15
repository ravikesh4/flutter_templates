import 'package:chat_ui/screens/chat_screen.dart';
import 'package:chat_ui/screens/settings_screen.dart';
import 'package:chat_ui/screens/user_profile.dart';
import 'package:flutter/material.dart';

class ChatListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chats'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(),
                      ));
              },
              icon: Icon(Icons.settings))
        ],
      ),
      body: ListView.builder(
        itemCount:
            10, // Replace with the number of chat items you want to display
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: GestureDetector(
              onTap: () {
                Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(),
                      ));
                
              },
              child: CircleAvatar(
                backgroundColor: Colors.grey[300],
                child: Icon(Icons.person),
              ),
            ),
            title: Text(
                'John Doe'), // Replace with the name of the user you are chatting with
            subtitle: Text(
                'Hello, how are you?'), // Replace with the last message sent/received
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                    '10:30 AM'), // Replace with the time of the last message sent/received
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 10,
                  child: Text(
                    '3', // Replace with the number of unread messages
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatScreen(
                  username: "John Doe $index",
                ),
                      ));
              
            },
          );
        },
      ),
    );
  }
}
