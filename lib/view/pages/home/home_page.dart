import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone_firebase/database/firestore.dart';
import 'package:twitter_clone_firebase/view/components/defaultButton.dart';
import 'package:twitter_clone_firebase/view/components/defaultDrawer.dart';
import 'package:twitter_clone_firebase/view/components/defaultTextField.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController postController = TextEditingController();

  // Firestore access
  final FirestoreDatabase database = FirestoreDatabase();

  // Post Message
  void postMessage() {
    if (postController.text.isNotEmpty) {
      String message = postController.text;
      database.addPost(message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.transparent,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        elevation: 0,
      ),
      drawer: DefaultDrawer(),
      body: Column(
        children: [
          // Create Post
          Padding(
            padding: const EdgeInsets.all(25),
            child: Row(
              children: [
                Expanded(
                  child: DefaultTextField(
                    hintText: "Say something..",
                    obscureText: false,
                    controller: postController,
                  ),
                ),
                DefaultSubmitButton(
                  onTap: postMessage,
                ),
              ],
            ),
          ),

          // Read Post
          StreamBuilder(
            stream: database.getPostsStream(),
            builder: (context, snapshot) {
              // Loading
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }

              // Get all post
              final posts = snapshot.data!.docs;

              // No Data
              if (snapshot.data == null || posts.isEmpty) {
                return Center(
                  child: Padding(
                    padding: EdgeInsets.all(25),
                    child: Text("No posts.. Post Something!"),
                  ),
                );
              }

              // Data Success
              return Expanded(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    // Get each individual post
                    final post = posts[index];

                    // get data from each post
                    String message = post["Message"];
                    String email = post["Email"];
                    Timestamp timestamp = post["Timestamp"];

                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 10,
                        bottom: 10,
                      ),
                      child: ListTile(
                        title: Text(message),
                        subtitle: Text(
                          email,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
