import 'package:chat_ui/screens/user_profile.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String username;

  ChatScreen({required this.username});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  List<Map<String, dynamic>> _messages = [
    {
      'message': 'Hey there, how are you doing?',
      'sender': 'other',
      'time': '10:00 AM',
    },
    {
      'message': 'I am doing good, thanks for asking',
      'sender': 'self',
      'time': '10:02 AM',
    },
    {
      'message': 'That\'s great! What have you been up to?',
      'sender': 'other',
      'time': '10:05 AM',
    },
    {
      'message': 'Not much, just work and stuff. You?',
      'sender': 'self',
      'time': '10:07 AM',
    },
    {
      'message': 'Same here, just busy with work',
      'sender': 'other',
      'time': '10:10 AM',
    },
  ];

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _messages.insert(
        0,
        {
          'message': text,
          'sender': 'self',
          'time': TimeOfDay.now().format(context)
        },
      );
    });
  }

  Widget _buildTextComposer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
              controller: _textController,
              onSubmitted: _handleSubmitted,
              decoration: InputDecoration.collapsed(hintText: 'Send a message'),
            ),
          ),
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () => _handleSubmitted(_textController.text),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.username),
      ),
      body: Column(
        children: <Widget>[
          Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true,
              itemCount: _messages.length,
              itemBuilder: (BuildContext context, int index) {
                final Map<String, dynamic> message = _messages[index];
                final bool isSelf = message['sender'] == 'self';
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Row(
                    children: [
                      if (!isSelf)
                        GestureDetector(
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
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: isSelf
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            Text(
                              message['message'],
                              style: TextStyle(fontSize: 16.0),
                            ),
                            SizedBox(height: 4),
                            Text(
                              message['time'],
                              style:
                                  TextStyle(fontSize: 12.0, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Divider(height: 1.0),
          Container(
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
            ),
            child: _buildTextComposer(),
          ),
        ],
      ),
    );
  }
}
