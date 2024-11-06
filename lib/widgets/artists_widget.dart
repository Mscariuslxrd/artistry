import 'package:flutter/material.dart';
import 'package:spotify/models/Artist.dart';
import 'package:google_fonts/google_fonts.dart';

class ArtistWidget extends StatelessWidget {
  final Artist artists;

  const ArtistWidget({Key? key, required this.artists}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          horizontal: 10), // Add horizontal margin for space between items
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
          image: NetworkImage(artists.imageUrl),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.5), BlendMode.darken),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 60),
            child: Text(
              textAlign: TextAlign.center,
              artists.name,
              style: GoogleFonts.oldenburg(
                textStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 40, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 50,
                  height: 34,
                  decoration: BoxDecoration(
                    color: Color(0xff02BD0E),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Image.asset('lib/assets/arrow_right.png'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
