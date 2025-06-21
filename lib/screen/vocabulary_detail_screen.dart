// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:lexigo/common/constants/colors.dart';
// import 'package:lexigo/core/presentation/widgets/brutalist_button.dart';
// import 'package:lexigo/core/presentation/widgets/brutalist_card.dart';
// import 'package:lexigo/product/domain/vocabulary_model.dart';

// @RoutePage()
// class VocabularyDetailScreen extends StatefulWidget {
//   const VocabularyDetailScreen({
//     required this.vocabularyId,
//     super.key,
//   });
//   final int vocabularyId;

//   @override
//   State<VocabularyDetailScreen> createState() => _VocabularyDetailScreenState();
// }

// class _VocabularyDetailScreenState extends State<VocabularyDetailScreen>
//     with SingleTickerProviderStateMixin {
//   bool _isLoading = true;
//   String? _errorMessage;
//   Vocabulary? _vocabulary;
//   bool _isPlaying = false;
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//     _fetchVocabularyDetail();
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }

//   Future<void> _fetchVocabularyDetail() async {
//     setState(() {
//       _isLoading = true;
//       _errorMessage = null;
//     });

//     try {
//       // In a real app, this would be an API call
//       // For now, let's create mock data
//       await Future<void>.delayed(const Duration(seconds: 1));

//       // setState(() {
//       //   _vocabulary = Vocabulary(
//       //     id: widget.vocabularyId,
//       //     word: 'Hello',
//       //     translation: 'Xin chào',
//       //     definition: 'Used as a greeting or to begin a conversation.',
//       //     example: 'Hello, how are you today?',
//       //     pronunciation: '/həˈləʊ/',
//       //     audioUrl: 'https://example.com/audio/hello.mp3',
//       //     imageUrl: 'https://via.placeholder.com/300',
//       //     synonyms: ['Hi', 'Greetings', 'Hey'],
//       //     antonyms: ['Goodbye', 'Farewell'],
//       //     categories: ['Greetings', 'Basic'],
//       //   );
//       //   _isLoading = false;
//       // });
//     } catch (e) {
//       setState(() {
//         _errorMessage = e.toString();
//         _isLoading = false;
//       });
//     }
//   }

//   void _toggleAudio() {
//     // In a real app, this would play/pause the audio
//     setState(() {
//       _isPlaying = !_isPlaying;
//     });

//     // Simulate audio playing for demo
//     if (_isPlaying) {
//       Future.delayed(const Duration(seconds: 2), () {
//         if (mounted) {
//           setState(() {
//             _isPlaying = false;
//           });
//         }
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.background,
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(
//           _vocabulary?.word.toUpperCase() ?? 'VOCABULARY',
//           style: const TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         elevation: 0,
//         iconTheme: const IconThemeData(color: Colors.white),
//         bottom: TabBar(
//           controller: _tabController,
//           labelColor: Colors.white,
//           unselectedLabelColor: Colors.white70,
//           indicatorColor: AppColors.brutalistYellow,
//           indicatorWeight: 4,
//           labelStyle: const TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 16,
//           ),
//           tabs: const [
//             Tab(text: 'DETAILS'),
//             Tab(text: 'EXAMPLES'),
//             Tab(text: 'PRACTICE'),
//           ],
//         ),
//       ),
//       body: _isLoading
//           ? const Center(child: CircularProgressIndicator())
//           : _errorMessage != null
//               ? Center(
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         'Error: $_errorMessage',
//                         style: const TextStyle(color: AppColors.error),
//                       ),
//                       const SizedBox(height: 16),
//                       BrutalistButton(
//                         text: 'Try Again',
//                         onPressed: _fetchVocabularyDetail,
//                       ),
//                     ],
//                   ),
//                 )
//               : TabBarView(
//                   controller: _tabController,
//                   children: [
//                     // DETAILS TAB
//                     _buildDetailsTab(),

//                     // EXAMPLES TAB
//                     _buildExamplesTab(),

//                     // PRACTICE TAB
//                     _buildPracticeTab(),
//                   ],
//                 ),
//     );
//   }

//   Widget _buildDetailsTab() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Word and Pronunciation
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: AppColors.brutalistBlue,
//               border: Border.all(
//                 width: 3,
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             _vocabulary!.word,
//                             style: const TextStyle(
//                               fontSize: 32,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.white,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             _vocabulary!.pronunciation ?? '',
//                             style: const TextStyle(
//                               fontSize: 18,
//                               color: Colors.white,
//                               fontStyle: FontStyle.italic,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     GestureDetector(
//                       onTap: _toggleAudio,
//                       child: Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           color: Colors.white,
//                           border: Border.all(
//                             width: 2,
//                           ),
//                         ),
//                         child: Icon(
//                           _isPlaying ? Icons.pause : Icons.volume_up,
//                           color: Colors.black,
//                           size: 32,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   color: Colors.white,
//                   child: Text(
//                     _vocabulary!.translation,
//                     style: const TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),

//           // Definition
//           const Text(
//             'DEFINITION',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(
//                 width: 2,
//               ),
//             ),
//             child: Text(
//               _vocabulary!.definition,
//               style: const TextStyle(
//                 fontSize: 16,
//               ),
//             ),
//           ),
//           const SizedBox(height: 24),

//           // Categories
//           if (_vocabulary!.categories != null &&
//               _vocabulary!.categories!.isNotEmpty) ...[
//             const Text(
//               'CATEGORIES',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Wrap(
//               spacing: 8,
//               runSpacing: 8,
//               children: _vocabulary!.categories!.map((category) {
//                 return Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                   decoration: BoxDecoration(
//                     color: AppColors.brutalistYellow,
//                     border: Border.all(
//                       width: 2,
//                     ),
//                   ),
//                   child: Text(
//                     category,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 );
//               }).toList(),
//             ),
//             const SizedBox(height: 24),
//           ],

//           // Synonyms and Antonyms in a grid
//           Row(
//             children: [
//               if (_vocabulary!.synonyms != null &&
//                   _vocabulary!.synonyms!.isNotEmpty)
//                 Expanded(
//                   child: _buildWordList(
//                     'SYNONYMS',
//                     _vocabulary!.synonyms!,
//                     AppColors.brutalistYellow,
//                   ),
//                 ),
//               const SizedBox(width: 16),
//               if (_vocabulary!.antonyms != null &&
//                   _vocabulary!.antonyms!.isNotEmpty)
//                 Expanded(
//                   child: _buildWordList(
//                     'ANTONYMS',
//                     _vocabulary!.antonyms!,
//                     AppColors.brutalistRed,
//                   ),
//                 ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildWordList(String title, List<String> words, Color color) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           title,
//           style: const TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: color.withOpacity(0.2),
//             border: Border.all(
//               width: 2,
//             ),
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: words.map((word) {
//               return Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 4),
//                 child: Text(
//                   '• $word',
//                   style: const TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildExamplesTab() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Example Usage
//           const Text(
//             'EXAMPLE USAGE',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(16),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               border: Border.all(
//                 width: 2,
//               ),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   _vocabulary!.example ?? 'No example available.',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontStyle: FontStyle.italic,
//                   ),
//                 ),
//                 if (_vocabulary!.example != null) ...[
//                   const SizedBox(height: 16),
//                   const Divider(color: Colors.black),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'MORE EXAMPLES:',
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   // Mock additional examples
//                   const Text("• Hello, it's nice to meet you."),
//                   const SizedBox(height: 8),
//                   const Text('• She said hello to everyone at the party.'),
//                   const SizedBox(height: 8),
//                   const Text('• Can you say hello in different languages?'),
//                 ],
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),

//           // Visual Context (Image)
//           if (_vocabulary!.imageUrl != null) ...[
//             const Text(
//               'VISUAL CONTEXT',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             const SizedBox(height: 8),
//             Container(
//               width: double.infinity,
//               height: 200,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 border: Border.all(
//                   width: 2,
//                 ),
//                 image: DecorationImage(
//                   image: NetworkImage(_vocabulary!.imageUrl!),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 24),
//           ],

//           // Context Examples
//           const Text(
//             'CONTEXT USAGE',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 8),
//           BrutalistCard(
//             backgroundColor: AppColors.brutalistBlue.withOpacity(0.1),
//             child: const Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'FORMAL:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   "• Hello, Mr. Johnson. It's a pleasure to meet you.",
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//                 SizedBox(height: 16),
//                 Text(
//                   'INFORMAL:',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   "• Hey there! How's it going?",
//                   style: TextStyle(
//                     fontSize: 16,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildPracticeTab() {
//     return SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Flashcard Practice
//           Container(
//             width: double.infinity,
//             padding: const EdgeInsets.all(24),
//             decoration: BoxDecoration(
//               color: AppColors.brutalistYellow,
//               border: Border.all(
//                 width: 3,
//               ),
//             ),
//             child: Column(
//               children: [
//                 const Text(
//                   'FLASHCARD PRACTICE',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 Container(
//                   width: double.infinity,
//                   height: 200,
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     border: Border.all(
//                       width: 2,
//                     ),
//                   ),
//                   child: Center(
//                     child: Text(
//                       _vocabulary!.word,
//                       style: const TextStyle(
//                         fontSize: 32,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),
//                 BrutalistButton(
//                   text: 'Reveal Translation',
//                   onPressed: () {
//                     // Show translation logic
//                     showDialog(
//                       context: context,
//                       builder: (context) => AlertDialog(
//                         backgroundColor: AppColors.background,
//                         shape: const RoundedRectangleBorder(
//                           side: BorderSide(
//                             width: 3,
//                           ),
//                         ),
//                         title: const Text('TRANSLATION'),
//                         content: Text(
//                           _vocabulary!.translation,
//                           style: const TextStyle(
//                             fontSize: 24,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                         actions: [
//                           BrutalistButton(
//                             text: 'Close',
//                             onPressed: () => Navigator.pop(context),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 24),

//           // Practice Activities
//           const Text(
//             'PRACTICE ACTIVITIES',
//             style: TextStyle(
//               fontSize: 18,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           const SizedBox(height: 16),
//           // Fill in the blank
//           BrutalistTile(
//             title: 'Fill in the Blank',
//             subtitle: 'Complete sentences using this word',
//             icon: Icons.edit,
//             onTap: () {
//               // Navigate to fill in the blank activity
//             },
//           ),
//           const SizedBox(height: 12),
//           // Multiple choice
//           BrutalistTile(
//             title: 'Multiple Choice',
//             subtitle: 'Choose the correct meaning or usage',
//             icon: Icons.check_circle,
//             onTap: () {
//               // Navigate to multiple choice activity
//             },
//           ),
//           const SizedBox(height: 12),
//           // Pronunciation practice
//           BrutalistTile(
//             title: 'Pronunciation Practice',
//             subtitle: 'Listen and repeat the word',
//             icon: Icons.mic,
//             onTap: () {
//               // Navigate to pronunciation practice
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
