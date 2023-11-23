/*
Store posts that users have published in the app.
It stored in a collection "Posts" in Firebase

Each post contains:
- messages
- email
- timestamp
*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase{
  // current logged in user
  User? user = FirebaseAuth.instance.currentUser;

  // get collection
  final CollectionReference posts = FirebaseFirestore.instance.collection("Posts");

  // post message
  Future<void> addPost(String message){
    return posts.add({
        "Email": user!.email,
        "Message": message,
        "Timestamp": Timestamp.now(),
    });
  }

  // read posts
  Stream<QuerySnapshot> getPostsStream(){
    final postsStream = FirebaseFirestore.instance
    .collection("Posts")
    .orderBy("Timestamp", descending: true)
    .snapshots();
    return postsStream;
  }

}