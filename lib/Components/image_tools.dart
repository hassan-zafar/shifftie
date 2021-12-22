import 'dart:async';
import 'dart:convert';
import 'dart:io' as file;
import 'dart:typed_data';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:extended_image/extended_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_image/flutter_native_image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:shifftie/Components/Tools/skeleton.dart';
import 'package:shifftie/Theme/colors.dart';
import 'package:transparent_image/transparent_image.dart';


enum kSize { small, medium, large }

class ImageTools {
  static String prestashopImage(String url, [kSize? size = kSize.medium]) {
    if (url.contains('?')) {
      switch (size) {
        case kSize.large:
          return url.replaceFirst('?', '/large_default?');
        case kSize.small:
          return url.replaceFirst('?', '/small_default?');
        default: // kSize.medium
          return url.replaceFirst('?', '/medium_default?');
      }
    }
    switch (size) {
      case kSize.large:
        return '$url/large_default';
      case kSize.small:
        return '$url/small_default';
      default: // kSize.medium
        return '$url/medium_default';
    }
  }

  static String? formatImage(String? url, [kSize? size = kSize.medium]) {


    // if (Config().isCacheImage ?? kAdvanceConfig['kIsResizeImage'] ?? false) {
    //   var pathWithoutExt = p.withoutExtension(url!);
    //   var ext = p.extension(url);
    //   String? imageURL = url;

    //   if (ext == '.jpeg') {
    //     imageURL = url;
    //   } else {
    //     switch (size) {
    //       case kSize.large:
    //         imageURL = '$pathWithoutExt-large$ext';
    //         break;
    //       case kSize.small:
    //         imageURL = '$pathWithoutExt-small$ext';
    //         break;
    //       default: // kSize.medium:e
    //         imageURL = '$pathWithoutExt-medium$ext';
    //         break;
    //     }
    //   }

    //   return imageURL;
    // } 
    // else {
      return url;
    // }
  }

  static NetworkImage networkImage(String? url, [kSize size = kSize.medium]) {
    return NetworkImage(formatImage(url, size)! );
  }

  /// Smart image function to load image cache and check empty URL to return empty box
  /// Only apply for the product image resize with (small, medium, large)
  static Widget image({
    String? url,
    kSize? size,
    double? width,
    double? height,
    BoxFit? fit,
    String? tag,
    double offset = 0.0,
    bool isResize = false,
    bool? isVideo = false,
    bool hidePlaceHolder = false,
    bool forceWhiteBackground = false,
    String kImageProxy = '',
  }) {
    if (height == null && width == null) {
      width = 200;
    }
    var ratioImage = 1.2;

    if (url?.isEmpty ?? true) {
      return FutureBuilder<bool>(
        future: Future.delayed(const Duration(seconds: 10), () => false),
        initialData: true,
        builder: (context, snapshot) {
          final showSkeleton = snapshot.data!;
          return AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: showSkeleton
                ? Skeleton(
                    width: width!,
                    height: height ?? width * ratioImage,
                  )
                : SizedBox(
                    width: width,
                    height: height ?? width! * ratioImage,
                    child: const Icon(Icons.error_outline),
                  ),
          );
        },
      );
    }

    if (isVideo!) {
      return SizedBox(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(color: Colors.black12.withOpacity(1)),
              child: ExtendedImage.network(
                isResize ? formatImage(url, size)! : url!,
                width: width,
                height: height ?? width! * ratioImage,
                fit: fit ?? BoxFit.cover,
                cache: true,
                enableLoadState: false,
                alignment: Alignment(
                    (offset >= -1 && offset <= 1)
                        ? offset
                        : (offset > 0)
                            ? 1.0
                            : -1.0,
                    0.0),
              ),
            ),
            Center(
              child: Icon(
                Icons.play_circle_outline,
                color: Colors.white70.withOpacity(0.5),
                size: width == null ? 30 : width / 4,
              ),
            ),
          ],
        ),
      );
    }


    final image = ExtendedImage.network(
      isResize ? formatImage(url, size)! : url!,
      width: width,
      height: height,
      fit: fit,
      cache: true,
      enableLoadState: false,
      alignment: Alignment(
        (offset >= -1 && offset <= 1)
            ? offset
            : (offset > 0)
                ? 1.0
                : -1.0,
        0.0,
      ),
      loadStateChanged: (ExtendedImageState state) {
        Widget? widget;
        switch (state.extendedImageLoadState) {
          case LoadState.loading:
            widget = hidePlaceHolder
                ? const SizedBox()
                : Skeleton(
                    width: width ?? 100,
                    height: width != null
                        ? width * ratioImage
                        : 100 * ratioImage as double,
                  );
            break;
          case LoadState.completed:
            widget = ExtendedRawImage(
              image: state.extendedImageInfo?.image,
              width: width,
              height: height,
              fit: fit,
            );
            break;
          case LoadState.failed:
            widget = Container(
              width: width,
              height: height ?? width! * ratioImage,
              color:  lightTextColor,
            );
            break;
        }
        return widget;
      },
    );

    if (forceWhiteBackground && url!.toLowerCase().endsWith('.png')) {
      return Container(
        color: Colors.white,
        child: image,
      );
    }

    return image;
  }

  /// cache avatar for the chat
  static CachedNetworkImage getCachedAvatar(String avatarUrl) {
    return CachedNetworkImage(
      imageUrl: avatarUrl,
      imageBuilder: (context, imageProvider) => CircleAvatar(
        backgroundImage: imageProvider,
      ),
      placeholder: (context, url) => const CircularProgressIndicator(),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }

  static BoxFit boxFit(String? fit) {
    switch (fit) {
      case 'contain':
        return BoxFit.contain;
      case 'fill':
        return BoxFit.fill;
      case 'fitHeight':
        return BoxFit.fitHeight;
      case 'fitWidth':
        return BoxFit.fitWidth;
      case 'scaleDown':
        return BoxFit.scaleDown;
      default:
        return BoxFit.cover;
    }
  }

  static Future<String> compressAndConvertImagesForUploading(
      List<dynamic> images) async {
    var base64 = StringBuffer();
    for (final image in images) {
      base64
        ..write(await compressImage(image))
        ..write(',');
    }
    return base64.toString();
  }

  static Future<file.File> _writeToFile(ByteData data) async {
    final buffer = data.buffer;
    final tempDir = await getTemporaryDirectory();
    final tempPath = tempDir.path;
    var filePath = tempPath + '/file_01.jpeg';
    var f = file.File(filePath);
    await f.writeAsBytes(buffer.asUint8List());
    return f;
    // return File(filePath).writeAsBytes(
    //     buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));
  }

  static Future<String> compressImage(dynamic image) async {
    var base64 = '';
    //const quality = 60;

    /// Disable cause the build issue on Flutter 2.2
    /// https://github.com/OpenFlutter/flutter_image_compress/issues/180

    if (image is Asset) {
      final byteData = await image.getByteData(quality: 100);
      final tmpFile = await _writeToFile(byteData);

      // final result = await FlutterImageCompress.compressWithList(
      //   bytes,
      //   minHeight: 800,
      //   minWidth: 800,
      //   quality: quality,
      //   format: CompressFormat.jpeg,
      // );
      // base64 += base64Encode(result);
      final compressedFile = await FlutterNativeImage.compressImage(
        tmpFile.path,
      );
      final bytes = compressedFile.readAsBytesSync();
      base64 += base64Encode(bytes);
    }
    if (image is XFile) {
      final compressedFile = await FlutterNativeImage.compressImage(
        image.path,
      );
      final bytes = compressedFile.readAsBytesSync();
      base64 += base64Encode(bytes);
      //   /// disable as not support File on web
      //   final result = await (FlutterImageCompress.compressWithFile(
      //     File(image.path).absolute.path,
      //     minWidth: 800,
      //     minHeight: 800,
      //     quality: quality,
      //     format: CompressFormat.jpeg,
      //   ) as Future<Uint8List>);
      //   base64 += base64Encode(result);
    }

    if (image is File) {
      final compressedFile = await FlutterNativeImage.compressImage(
        image.path,
      );
      final bytes = compressedFile.readAsBytesSync();
      base64 += base64Encode(bytes);
    }

    if (image is String) {
      if (image.contains('http')) {
        base64 += image;
      }
    }
    return base64;
  }
}
