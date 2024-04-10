import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sealtech/client/components/message.dart';

class ChatService {

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<List<Map<String,dynamic>>> getUserStream() {
    return _firestore.collection("Users").snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final user = doc.data();

        return user;

      }).toList();
    });
  }


  Future<void> sendMessage(String reveicerID, message) async {
    final String currentUserID = _auth.currentUser!.uid;
    final String currentUserEmail = _auth.currentUser!.email!;
    final Timestamp timestamp = Timestamp.now();

    
    Message newMessage = Message(
      senderID: currentUserID,
      senderEmail: currentUserEmail,
      receiverID: reveicerID,
      message: message,
      timestamp: timestamp,
    );


    List<String> ids = [currentUserID, reveicerID];
    ids.sort();
    String chatRoomID = ids.join('_');


    await _firestore
      .collection("Contact_Us")
      .doc(chatRoomID)
      .collection("message")
      .add(newMessage.toMap());

  }


  Stream<QuerySnapshot> getMessage(String userID, otherUserID) {
    List<String> ids = [userID, otherUserID];
    ids.sort();
    String chatRoomID = ids.join('_');

    return _firestore
    .collection("Contact_Us")
    .doc(chatRoomID)
    .collection("message")
    .orderBy("timestamp", descending: false)
    .snapshots();
  }
}