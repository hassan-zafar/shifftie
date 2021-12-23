import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class ShifttiePostModel {
  final String? postId;
  final String? userId;
  final String? userName;
  final String? postTitle;
  final String? videoUrl;
  final String? postDescription;
  final String? videoLength;
  final Timestamp? createdAt;

  final String? postCategory;
  final String? posttImageUrl;
  final String? subHeading;
  final dynamic likes;
  final String? categoryDescription;
  ShifttiePostModel({
    this.postId,
    this.userId,
    this.userName,
    this.postTitle,
    this.videoUrl,
    this.postDescription,
    this.videoLength,
    this.createdAt,
    this.postCategory,
    this.posttImageUrl,
    this.subHeading,
    this.likes,
    this.categoryDescription,
  });

  ShifttiePostModel copyWith({
    String? postId,
    String? userId,
    String? userName,
    String? postTitle,
    String? videoUrl,
    String? postDescription,
    String? videoLength,
    Timestamp? createdAt,
    String? postCategory,
    String? posttImageUrl,
    String? subHeading,
    dynamic? likes,
    String? categoryDescription,
  }) {
    return ShifttiePostModel(
      postId: postId ?? this.postId,
      userId: userId ?? this.userId,
      userName: userName ?? this.userName,
      postTitle: postTitle ?? this.postTitle,
      videoUrl: videoUrl ?? this.videoUrl,
      postDescription: postDescription ?? this.postDescription,
      videoLength: videoLength ?? this.videoLength,
      createdAt: createdAt ?? this.createdAt,
      postCategory: postCategory ?? this.postCategory,
      posttImageUrl: posttImageUrl ?? this.posttImageUrl,
      subHeading: subHeading ?? this.subHeading,
      likes: likes ?? this.likes,
      categoryDescription: categoryDescription ?? this.categoryDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userId': userId,
      'userName': userName,
      'postTitle': postTitle,
      'videoUrl': videoUrl,
      'postDescription': postDescription,
      'videoLength': videoLength,
      'createdAt': createdAt,
      'postCategory': postCategory,
      'posttImageUrl': posttImageUrl,
      'subHeading': subHeading,
      'likes': likes,
      'categoryDescription': categoryDescription,
    };
  }

  factory ShifttiePostModel.fromDocument(doc) {
    return ShifttiePostModel(
      postId: doc.date()['postId'],
      userId: doc.date()['userId'],
      userName: doc.date()['userName'],
      postTitle: doc.date()['postTitle'],
      videoUrl: doc.date()['videoUrl'],
      postDescription: doc.date()['postDescription'],
      videoLength: doc.date()['videoLength'],
      createdAt:
          doc.date()['createdAt'] != null ? doc.date()['createdAt'] : null,
      postCategory: doc.date()['postCategory'],
      posttImageUrl: doc.date()['posttImageUrl'],
      subHeading: doc.date()['subHeading'],
      likes: doc.date()['likes'] ?? null,
      categoryDescription: doc.date()['categoryDescription'],
    );
  }
  factory ShifttiePostModel.fromMap(Map<String, dynamic> map) {
    return ShifttiePostModel(
      postId: map['postId'],
      userId: map['userId'],
      userName: map['userName'],
      postTitle: map['postTitle'],
      videoUrl: map['videoUrl'],
      postDescription: map['postDescription'],
      videoLength: map['videoLength'],
      createdAt: map['createdAt'],
      // != null ? Timestamp.fromMap(map['createdAt']) : null,
      postCategory: map['postCategory'],
      posttImageUrl: map['posttImageUrl'],
      subHeading: map['subHeading'],
      likes: map['likes'] ?? null,
      categoryDescription: map['categoryDescription'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ShifttiePostModel.fromJson(String source) =>
      ShifttiePostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShifttiePostModel(postId: $postId, userId: $userId, userName: $userName, postTitle: $postTitle, videoUrl: $videoUrl, postDescription: $postDescription, videoLength: $videoLength, createdAt: $createdAt, postCategory: $postCategory, posttImageUrl: $posttImageUrl, subHeading: $subHeading, likes: $likes, categoryDescription: $categoryDescription)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShifttiePostModel &&
        other.postId == postId &&
        other.userId == userId &&
        other.userName == userName &&
        other.postTitle == postTitle &&
        other.videoUrl == videoUrl &&
        other.postDescription == postDescription &&
        other.videoLength == videoLength &&
        other.createdAt == createdAt &&
        other.postCategory == postCategory &&
        other.posttImageUrl == posttImageUrl &&
        other.subHeading == subHeading &&
        other.likes == likes &&
        other.categoryDescription == categoryDescription;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        userId.hashCode ^
        userName.hashCode ^
        postTitle.hashCode ^
        videoUrl.hashCode ^
        postDescription.hashCode ^
        videoLength.hashCode ^
        createdAt.hashCode ^
        postCategory.hashCode ^
        posttImageUrl.hashCode ^
        subHeading.hashCode ^
        likes.hashCode ^
        categoryDescription.hashCode;
  }
}
