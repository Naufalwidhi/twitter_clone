import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone_firebase/view/components/defaultButton.dart';
import 'package:twitter_clone_firebase/view/components/defaultPopup.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection("Users").snapshots(),
        builder: (context, snapshot) {
          // Error
          if (snapshot.hasError) {
            defaultPopUp("Something went wrong", context);
          }

          // Loading
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          // Success
          final users = snapshot.data!.docs;

          return Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(
                  top: 25,
                  left: 25,
                ),
                child: Row(
                  children: [
                    DefaultBackButton(),
                  ],
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.all(0),
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    final user = users[index];

                    return ListTile(
                      title: Text(user["username"]),
                      subtitle: Text(user["email"]),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
