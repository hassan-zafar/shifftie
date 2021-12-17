// //@dart=2.9
// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:shifftie/Models/file.dart';
// import 'package:storage_path/storage_path.dart';

// class GalleryPage extends StatefulWidget {
//   GalleryPage({Key key, this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<GalleryPage> {
//   List<FileModel> files;
//   FileModel selectedModel;
//   String image;
//   @override
//   void initState() {
//     super.initState();
//     getImagesPath();
//   }

//   getImagesPath() async {
//     var imagePath = await StoragePath.imagesPath;
//     var images = jsonDecode(imagePath) as List;
//     files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
//     if (files != null && files.length > 0) {
//       setState(() {
//         selectedModel = files[0];
//         image = files[0].files[0];
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     const Icon(Icons.clear),
//                     const SizedBox(width: 10),
//                     DropdownButtonHideUnderline(
//                         child: DropdownButton<FileModel>(
//                       items: getItems(),
//                       onChanged: (FileModel d) {
//                         assert(d.files.isEmpty);
//                         image = d.files[0];
//                         setState(() {
//                           selectedModel = d;
//                         });
//                       },
//                       value: selectedModel,
//                     ))
//                   ],
//                 ),
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'Next',
//                     style: TextStyle(color: Colors.blue),
//                   ),
//                 )
//               ],
//             ),
//             const Divider(),
//             SizedBox(
//                 height: MediaQuery.of(context).size.height * 0.45,
//                 child: image != null
//                     ? Image.file(File(image),
//                         height: MediaQuery.of(context).size.height * 0.45,
//                         width: MediaQuery.of(context).size.width)
//                     : Container()),
//             const Divider(),
//             selectedModel == null && selectedModel.files.isEmpty
//                 ? Container()
//                 : Container(
//                     height: MediaQuery.of(context).size.height * 0.38,
//                     child: GridView.builder(
//                         gridDelegate:
//                             const SliverGridDelegateWithFixedCrossAxisCount(
//                                 crossAxisCount: 4,
//                                 crossAxisSpacing: 4,
//                                 mainAxisSpacing: 4),
//                         itemBuilder: (_, i) {
//                           var file = selectedModel.files[i];
//                           return GestureDetector(
//                             child: Image.file(
//                               File(file),
//                               fit: BoxFit.cover,
//                             ),
//                             onTap: () {
//                               setState(() {
//                                 image = file;
//                               });
//                             },
//                           );
//                         },
//                         itemCount: selectedModel.files.length),
//                   )
//           ],
//         ),
//       ),
//     );
//   }

//   List<DropdownMenuItem<FileModel>> getItems() {
//     return files
//             .map((e) => DropdownMenuItem(
//                   child: Text(
//                     e.folder,
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                   value: e,
//                 ))
//             .toList() ??
//         <DropdownMenuItem<FileModel>>[];
//   }
// }

// // class GalleryPage extends StatefulWidget {
// //   GalleryPage({Key? key, this.title}) : super(key: key);

// //   final String? title;

// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }

// // class _MyHomePageState extends State<GalleryPage> {
// //   List<FileModel>? files;
// //   FileModel? selectedModel;
// //   String? image;
// //   @override
// //   void initState() {
// //     super.initState();
// //     getImagesPath();
// //   }

// //   getImagesPath() async {
// //     var imagePath = await StoragePath.imagesPath;
// //     var images = jsonDecode(imagePath) as List;
// //     files = images.map<FileModel>((e) => FileModel.fromJson(e)).toList();
// //     if (files != null && files!.length > 0) {
// //       setState(() {
// //         selectedModel = files![0];
// //         image = files![0].files![0];
// //       });
// //     }
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Column(
// //           children: <Widget>[
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: <Widget>[
// //                 Row(
// //                   children: <Widget>[
// //                     const Icon(Icons.clear),
// //                     const SizedBox(width: 10),
// //                     DropdownButtonHideUnderline(
// //                         child: DropdownButton<FileModel>(
// //                       items: getItems(),
// //                       onChanged: (FileModel? d) {
// //                         assert(d!.files!.isEmpty);
// //                         image = d!.files![0];
// //                         setState(() {
// //                           selectedModel = d;
// //                         });
// //                       },
// //                       value: selectedModel,
// //                     ))
// //                   ],
// //                 ),
// //                 const Padding(
// //                   padding: EdgeInsets.all(8.0),
// //                   child: Text(
// //                     'Next',
// //                     style: TextStyle(color: Colors.blue),
// //                   ),
// //                 )
// //               ],
// //             ),
// //             const Divider(),
// //             SizedBox(
// //                 height: MediaQuery.of(context).size.height * 0.45,
// //                 child: image != null
// //                     ? Image.file(File(image!),
// //                         height: MediaQuery.of(context).size.height * 0.45,
// //                         width: MediaQuery.of(context).size.width)
// //                     : Container()),
// //             const Divider(),
// //             selectedModel == null && selectedModel!.files!.isEmpty
// //                 ? Container()
// //                 : Container(
// //                     height: MediaQuery.of(context).size.height * 0.38,
// //                     child: GridView.builder(
// //                         gridDelegate:
// //                             const SliverGridDelegateWithFixedCrossAxisCount(
// //                                 crossAxisCount: 4,
// //                                 crossAxisSpacing: 4,
// //                                 mainAxisSpacing: 4),
// //                         itemBuilder: (_, i) {
// //                           var file = selectedModel!.files![i];
// //                           return GestureDetector(
// //                             child: Image.file(
// //                               File(file),
// //                               fit: BoxFit.cover,
// //                             ),
// //                             onTap: () {
// //                               setState(() {
// //                                 image = file;
// //                               });
// //                             },
// //                           );
// //                         },
// //                         itemCount: selectedModel!.files!.length),
// //                   )
// //           ],
// //         ),
// //       ),
// //     );
// //   }

// //   List<DropdownMenuItem<FileModel>> getItems() {
// //     return files!
// //             .map((e) => DropdownMenuItem(
// //                   child: Text(
// //                     e.folder!,
// //                     style: const TextStyle(color: Colors.black),
// //                   ),
// //                   value: e,
// //                 ))
// //             .toList() ??
// //         <DropdownMenuItem<FileModel>>[];
// //   }
// // }
