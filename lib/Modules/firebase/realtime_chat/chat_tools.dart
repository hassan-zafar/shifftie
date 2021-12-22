import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

CachedNetworkImage getCachedAvatar(String avatarUrl) {
  return CachedNetworkImage(
    placeholder: (context, url) => const CircularProgressIndicator(),
    imageUrl: avatarUrl,
    imageBuilder: (context, imageProvider) => CircleAvatar(
      backgroundImage: imageProvider,
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

CachedNetworkImage getCachedImage(String imageUrl) {
  return CachedNetworkImage(
    placeholder: (context, url) => const CircularProgressIndicator(),
    imageUrl: imageUrl,
    imageBuilder: (context, imageProvider) => Image.network(
      imageUrl,
    ),
    errorWidget: (context, url, error) => const Icon(Icons.error),
  );
}

//var file = await DefaultCacheManager().getFileFromCache(url)
