import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/blocs/artists_bloc.dart';
import 'package:spotify/blocs/music.dart';
import 'package:spotify/widgets/artists_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spotify/widgets/songs_list_widget.dart';

class HomeScreen extends StatelessWidget {
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => MusicCubit()),
          BlocProvider(create: (_) => ArtistsCubit()),
        ],
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Container(
                    height: 110,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 19, 164, 29),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  'Artistry',
                                  style: GoogleFonts.revalia(
                                    textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 17,
                                    ),
                                  ),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(15),
                                      bottomRight: Radius.circular(15),
                                    ),
                                    color: Color.fromARGB(255, 0, 0, 0),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 25),
                                  child: Image.asset(
                                    'lib/assets/menu.png',
                                    width: 28,
                                    height: 25,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Container(
                                width: MediaQuery.of(context).size.width * 0.84,
                                height: 44,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(0, 0, 0, 0.25),
                                      blurStyle: BlurStyle.inner,
                                    ),
                                    BoxShadow(
                                      color: Color(0xffD9D9D9),
                                      spreadRadius: 0,
                                      blurStyle: BlurStyle.inner,
                                      blurRadius: 6,
                                    ),
                                  ],
                                ),
                                child: TextField(
                                  autofocus: false,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "Search music",
                                    hintStyle: GoogleFonts.oldenburg(
                                      color: Color(0xff9BAB9C),
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Top 10",
                      style: GoogleFonts.oldenburg(
                        textStyle: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                BlocBuilder<ArtistsCubit, ArtistsState>(
                  builder: (context, state) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (var artist in state.artists.take(2))
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 200,
                              child: ArtistWidget(artists: artist),
                            ),
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 20),
                BlocBuilder<MusicCubit, MusicState>(
                  builder: (context, state) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Recommendations",
                              style: GoogleFonts.oldenburg(
                                textStyle: TextStyle(
                                    color: Colors.white, fontSize: 24),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        for (var songs in state.recommendations)
                          SongsListWidget(songs: songs)
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Color(0xff02BD0E)),
            label: "Heaven",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.white),
            label: "Lovely",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.white),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
