// widgets/Artist_widget.dart
import 'package:flutter/material.dart';
import 'package:spotify/models/songs.dart';

import '../models/Artist.dart';

class SongsListWidget extends StatelessWidget {
  final Songs songs;

  const SongsListWidget({Key? key, required this.songs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.symmetric(vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              songs.imageUrl,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                songs.title,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              Text(
                songs.artistName,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
          Spacer(),
          Icon(Icons.favorite_border, color: Colors.green),
        ],
      ),
    );
  }
}
