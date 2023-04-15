import 'package:flutter/material.dart';

class HelpAndSupportScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help & Support'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'FAQs',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  _buildFAQItem(
                    question: 'How do I change my profile picture?',
                    answer: 'To change your profile picture, go to the settings screen and click on "Edit Profile". From there, you can upload a new profile picture.',
                  ),
                  _buildFAQItem(
                    question: 'How do I delete a chat?',
                    answer: 'To delete a chat, simply swipe left on the chat you want to delete and click on "Delete".',
                  ),
                  _buildFAQItem(
                    question: 'How do I block someone?',
                    answer: 'To block someone, go to their profile and click on "Block User". You will no longer receive messages from them.',
                  ),
                ],
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'If you have any further questions or need help, please email us at support@chatapp.com.',
              style: TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem({required String question,required  String answer}) {
    return ExpansionTile(
      title: Text(
        question,
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            answer,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
