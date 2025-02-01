// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import '/custom_code/widgets/index.dart';
import '/custom_code/actions/index.dart';
import '/flutter_flow/custom_functions.dart';

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({
    Key? key,
    this.width,
    this.height,
  }) : super(key: key);

  final double? width;
  final double? height;

  @override
  State<DiscoveryPage> createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  String _selectedCategory = 'Explore';
  List<dynamic> _videos = [];

  @override
  void initState() {
    super.initState();
    _fetchVideos();
  }

  Future<void> _fetchVideos() async {
    try {
      final videosRef = FirebaseFirestore.instance.collection('videos');
      var query = videosRef.orderBy('dateUploaded', descending: true);

      if (_selectedCategory != 'Explore') {
        query = query.where('Revenue', isEqualTo: _selectedCategory);
      }

      final snapshot = await query.limit(20).get();

      if (mounted) {
        setState(() {
          _videos = snapshot.docs;
        });
      }
    } catch (e) {
      print('Error fetching videos: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 50,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _categoryButton('Explore', '🔍'),
                _categoryButton('Revenue', '💰'),
                _categoryButton('Sales', '📊'),
                _categoryButton('Monthly', '📅'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search businesses...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              padding: EdgeInsets.all(10),
              itemCount: _videos.length,
              itemBuilder: (context, index) {
                final videoData = _videos[index].data() as Map<String, dynamic>;
                return _buildVideoCard(videoData);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _categoryButton(String category, String emoji) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: () {
          setState(() {
            _selectedCategory = category;
          });
          _fetchVideos();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            _selectedCategory == category ? Colors.blue.withOpacity(0.1) : null,
          ),
        ),
        child: Text('$emoji $category'),
      ),
    );
  }

  Widget _buildVideoCard(Map<String, dynamic> video) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.network(
              video['thumbnailURL'] ?? 'https://picsum.photos/200',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: Colors.grey[200],
                  child: Center(
                    child: Icon(Icons.image_not_supported, color: Colors.grey),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    video['content'] ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    video['creatorName'] ?? '',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
