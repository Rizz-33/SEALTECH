import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sealtech/client/contact_us/components/message.dart';

class ChatService {

  //get instance of firestore and auth
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //get user stream
  Stream<List<Map<String,dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        //got through each individual user
        final user = doc.data();

        //return user
        return user;

      }).toList();
    });
  }


  //send message
  Future<void> sendMessage(String reveicerID, message) async {
    //get current user info
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    
    //create a new message
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: reveicerID,
      message: message,
      timestamp: timestamp
    );


    //construct chat room ID for the two users
    List<String> ids = [currentUserID, reveicerID];
    ids.sort();
    String chatRoomID = ids.join('_');


    //add new message to database
    await _firestore
      .collection("chat_rooms")
      .doc(chatRoomID)
      .collection("message")
      .add(newMessage.toMap());

  }


  //get message
  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
    //construct a chatroom ID for the two users
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
    .collection("chat_rooms")
    .doc(chatRoomID)
    .collection("message")
    .orderBy("timestamp", descending: false)
    .snapshots();
  }
}