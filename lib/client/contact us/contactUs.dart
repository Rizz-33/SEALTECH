import 'package:flutter/material.dart';
import 'package:sealtech/client/contact%20us/chat.dart';
import 'package:sealtech/client/contact%20us/components/userTile.dart';
import 'package:sealtech/components/theme.dart';
import 'package:sealtech/services/auth/auth_service.dart';
import 'package:sealtech/services/chat/chat_service.dart';

class ContactUsPage extends StatelessWidget {
  ContactUsPage({Key? key});

  // Chat and auth services
  final ChatService _chatService = ChatService();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Contact Us'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Image.asset('lib/images/logoIconBlack.png'),
          ),
        ],
      ),
      body: _buildUserList(),
    );
  }

  // Build a list of users except for the current logged-in user
  Widget _buildUserList() {
    return StreamBuilder(
      stream: _chatService.getUserStream(),
      builder: (context, snapshot) {
        // Error
        if (snapshot.hasError) {
          return Text('Error');
        }

        // Loading
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading...");
        }

        // Return list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) =>
              _buildUserListItem(userData, context)).toList(),
        );
      },
    );
  }

  // Build individual list tile for user
  Widget _buildUserListItem(Map<String, dynamic> userData, BuildContext context) {
    // Display users except the current user
    if (userData['email'] != _authService.getCurrentUser()!.email) {
      return UserTile(
        text: userData['email'],
        isNewMessage: false,
        onTap: () {
          // Tapped on a user -> go to chat
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ChatPage(
                  receiverEmail: userData['email'],
                  receiverID: userData['uid'],
                ),
              ));
        },
      );
    } else {
      return Container();
    }
  }
}
