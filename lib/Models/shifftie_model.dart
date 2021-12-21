import 'dart:convert';

class ShifttiePostModel {
  final String? postId;
  final String? ownerId;
  final String? userName;
  final String? postTitle;
  final String? description;
  final String? postMediaUrl;
  final String? subHeading;
  final dynamic likes;
  final String? videoLink;
  ShifttiePostModel({
    this.postId,
    this.ownerId,
    this.userName,
    this.postTitle,
    this.description,
    this.postMediaUrl,
    this.subHeading,
    this.likes,
    this.videoLink,
  });

  ShifttiePostModel copyWith({
    String? postId,
    String? ownerId,
    String? userName,
    String? postTitle,
    String? description,
    String? postMediaUrl,
    String? subHeading,
    dynamic likes,
    String? videoLink,
  }) {
    return ShifttiePostModel(
      postId: postId ?? this.postId,
      ownerId: ownerId ?? this.ownerId,
      userName: userName ?? this.userName,
      postTitle: postTitle ?? this.postTitle,
      description: description ?? this.description,
      postMediaUrl: postMediaUrl ?? this.postMediaUrl,
      subHeading: subHeading ?? this.subHeading,
      likes: likes ?? this.likes,
      videoLink: videoLink ?? this.videoLink,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'ownerId': ownerId,
      'userName': userName,
      'postTitle': postTitle,
      'description': description,
      'postMediaUrl': postMediaUrl,
      'subHeading': subHeading,
      'likes': likes,
      'videoLink': videoLink,
    };
  }

  factory ShifttiePostModel.fromDocument(doc) {
    return ShifttiePostModel(
      postId: doc.data()["postId"],
      ownerId: doc.data()["ownerId"],
      userName: doc.data()["userName"],
      description: doc.data()["description"],
      postTitle: doc.data()["postTitle"],
      postMediaUrl: doc.data()["postMediaUrl"],
      likes: doc.data()['likes'],
      subHeading: doc.data()['subHeading'],
      videoLink: doc.data()['videoLink'],
    );
  }
  factory ShifttiePostModel.fromMap(Map<String, dynamic> map) {
    return ShifttiePostModel(
      postId: map['postId'],
      ownerId: map['ownerId'],
      userName: map['userName'],
      postTitle: map['postTitle'],
      description: map['description'],
      postMediaUrl: map['postMediaUrl'],
      subHeading: map['subHeading'],
      likes: map['likes'],
      videoLink: map['videoLink'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ShifttiePostModel.fromJson(String source) =>
      ShifttiePostModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ShifttiePostModel(postId: $postId, ownerId: $ownerId, userName: $userName, postTitle: $postTitle, description: $description, postMediaUrl: $postMediaUrl, subHeading: $subHeading, likes: $likes, videoLink: $videoLink)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ShifttiePostModel &&
        other.postId == postId &&
        other.ownerId == ownerId &&
        other.userName == userName &&
        other.postTitle == postTitle &&
        other.description == description &&
        other.postMediaUrl == postMediaUrl &&
        other.subHeading == subHeading &&
        other.likes == likes &&
        other.videoLink == videoLink;
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        ownerId.hashCode ^
        userName.hashCode ^
        postTitle.hashCode ^
        description.hashCode ^
        postMediaUrl.hashCode ^
        subHeading.hashCode ^
        likes.hashCode ^
        videoLink.hashCode;
  }
}
