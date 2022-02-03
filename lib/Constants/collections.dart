import 'package:cloud_firestore/cloud_firestore.dart';

final userRef = FirebaseFirestore.instance.collection('users');
final commentsRef = FirebaseFirestore.instance.collection('comments');
final chatRoomRef = FirebaseFirestore.instance.collection('chatRoom');
final chatListRef = FirebaseFirestore.instance.collection('chatLists');
final activityFeedsRef = FirebaseFirestore.instance.collection('activityFeeds');
final followerRef = FirebaseFirestore.instance.collection('followerRef');
final followingRef = FirebaseFirestore.instance.collection('followingRef');
