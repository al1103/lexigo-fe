// import 'dart:io';

// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:lexigo/screen/scan_objects/models/detection_result.dart';
// import 'package:lexigo/screen/scan_objects/scan_object_controller.dart';

// @RoutePage()
// class ImagePreviewScreen extends ConsumerStatefulWidget {
//   const ImagePreviewScreen({required this.imagePath, super.key});
//   final String imagePath;

//   @override
//   ConsumerState<ImagePreviewScreen> createState() => _ImagePreviewScreenState();
// }

// class _ImagePreviewScreenState extends ConsumerState<ImagePreviewScreen> {
//   bool _hasShownDialog = false;

//   @override
//   void initState() {
//     super.initState();
//     // Reset the flag when screen loads
//     _hasShownDialog = false;
//   }

//   @override
//   Widget build(BuildContext context) {
//     final scanState = ref.watch(scanObjectControllerProvider);
//     final size = MediaQuery.of(context).size;
//     final imageSize = size.width;

//     // Listen to scan state changes

//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Stack(
//         children: [
//           // Centered square image
//           Center(
//             child: Hero(
//               tag: widget.imagePath,
//               child: Container(
//                 width: imageSize,
//                 height: imageSize,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(20),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withValues(alpha: 0.5),
//                       blurRadius: 20,
//                     ),
//                   ],
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(20),
//                   child: Image.file(
//                     File(widget.imagePath),
//                     fit: BoxFit.cover,
//                     width: imageSize,
//                     height: imageSize,
//                   ),
//                 ),
//               ),
//             ),
//           ),

//           // Loading overlay
//           if (scanState.isLoading)
//             ColoredBox(
//               color: Colors.black.withValues(alpha: 0.7),
//               child: const Center(
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     CircularProgressIndicator(color: Colors.white),
//                     SizedBox(height: 16),
//                     Text(
//                       'Analyzing image...',
//                       style: TextStyle(color: Colors.white, fontSize: 16),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//           // Top controls
//           SafeArea(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       color: Colors.black.withValues(alpha: 0.7),
//                       borderRadius: BorderRadius.circular(25),
//                     ),
//                     child: IconButton(
//                       icon: const Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),

//           // Bottom actions
//           Positioned(
//             bottom: 0,
//             left: 0,
//             right: 0,
//             child: Container(
//               padding: const EdgeInsets.all(20),
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   begin: Alignment.topCenter,
//                   end: Alignment.bottomCenter,
//                   colors: [Colors.transparent, Colors.black.withValues(alpha: 0.8)],
//                 ),
//               ),
//               child: SafeArea(
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     // Retake button
//                     ElevatedButton.icon(
//                       onPressed: scanState.isLoading
//                           ? null
//                           : () {
//                               Navigator.pop(context);
//                               try {
//                                 File(widget.imagePath).deleteSync();
//                               } catch (e) {
//                                 print('Error deleting file: $e');
//                               }
//                             },
//                       icon: const Icon(Icons.camera_alt, color: Colors.white),
//                       label: const Text(
//                         'Retake',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.orange,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20,
//                           vertical: 12,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                       ),
//                     ),

//                     // Analyze button
//                     ElevatedButton.icon(
//                       onPressed: scanState.isLoading
//                           ? null
//                           : () async {
//                               _hasShownDialog =
//                                   false; // Reset flag before analyzing
//                               await ref
//                                   .read(scanObjectControllerProvider.notifier)
//                                   .analyzeImage(
//                                     File(widget.imagePath),
//                                   );
//                             },
//                       icon: scanState.isLoading
//                           ? const SizedBox(
//                               width: 16,
//                               height: 16,
//                               child: CircularProgressIndicator(
//                                 color: Colors.white,
//                                 strokeWidth: 2,
//                               ),
//                             )
//                           : const Icon(Icons.auto_awesome, color: Colors.white),
//                       label: Text(
//                         scanState.isLoading ? 'Analyzing...' : 'Analyze',
//                         style: const TextStyle(color: Colors.white),
//                       ),
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Colors.blue,
//                         padding: const EdgeInsets.symmetric(
//                           horizontal: 20,
//                           vertical: 12,
//                         ),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(25),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _showResultDialog(BuildContext context, List<DetectionResult> results) {
//     if (results.isEmpty) return;

//     final result = results.first; // Take first result

//     // showDialog<void>(
//     //   context: context,
//     //   barrierDismissible: false,
//     //   builder: (context) => AlertDialog(
//     //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//     //     title: Row(
//     //       children: [
//     //         const Icon(Icons.auto_awesome, color: Colors.blue),
//     //         const SizedBox(width: 12),
//     //         Expanded(
//     //           child: Text(
//     //             result.objectName ?? 'Unknown Object',
//     //             style: const TextStyle(fontWeight: FontWeight.bold),
//     //           ),
//     //         ),
//     //       ],
//     //     ),
//     //     content: SingleChildScrollView(
//     //       child: Column(
//     //         mainAxisSize: MainAxisSize.min,
//     //         crossAxisAlignment: CrossAxisAlignment.start,
//     //         children: [
//     //           if (result.description.isNotEmpty ?? false) ...[
//     //             Text(
//     //               result.description,
//     //               style: const TextStyle(fontSize: 16),
//     //             ),
//     //             const SizedBox(height: 16),
//     //           ],
//     //           if (results.length > 1) ...[
//     //             const Text(
//     //               'Other detected objects:',
//     //               style: TextStyle(fontWeight: FontWeight.bold),
//     //             ),
//     //             const SizedBox(height: 8),
//     //             ...results.skip(1).take(3).map(
//     //                   (r) => Padding(
//     //                     padding: const EdgeInsets.symmetric(vertical: 2),
//     //                     child: Row(
//     //                       children: [
//     //                         const Icon(
//     //                           Icons.label,
//     //                           size: 16,
//     //                           color: Colors.grey,
//     //                         ),
//     //                         const SizedBox(width: 8),
//     //                         Expanded(child: Text(r.objectName ?? 'Unknown')),
//     //                       ],
//     //                     ),
//     //                   ),
//     //                 ),
//     //             if (results.length > 4)
//     //               Text(
//     //                 '... and ${results.length - 4} more',
//     //                 style: TextStyle(color: Colors.grey.shade600),
//     //               ),
//     //           ],
//     //         ],
//     //       ),
//     //     ),
//     //     actions: [
//     //       TextButton(
//     //         onPressed: () {
//     //           Navigator.pop(context); // Close dialog
//     //         },
//     //         child: const Text('View Later'),
//     //       ),
//     //       ElevatedButton(
//     //         onPressed: () {
//     //           Navigator.pop(context); // Close dialog
//     //           Navigator.pop(context); // Go back to camera
//     //         },
//     //         style: ElevatedButton.styleFrom(
//     //           backgroundColor: Colors.blue,
//     //           shape: RoundedRectangleBorder(
//     //             borderRadius: BorderRadius.circular(20),
//     //           ),
//     //         ),
//     //         child: const Text(
//     //           'Continue Scanning',
//     //           style: TextStyle(color: Colors.white),
//     //         ),
//     //       ),
//     //     ],
//     //   ),
//     // )
//   }
// }
