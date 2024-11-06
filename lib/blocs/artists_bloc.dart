import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/models/Artist.dart';
import 'package:spotify/models/songs.dart';

class ArtistsState {
  final List<Artist> artists;

  ArtistsState(this.artists);
}

class ArtistsCubit extends Cubit<ArtistsState> {
  ArtistsCubit()
      : super(ArtistsState([
          Artist(
            name: "Megan Thee Stallion",
            imageUrl:
                "https://media.pitchfork.com/photos/667b0bd3f0beb267ea0e64a4/16:9/w_1280,c_limit/Megan-Thee-Stallion.jpg",
          ),
          Artist(
              name: "Doja Cat",
              imageUrl:
                  "https://i.scdn.co/image/ab67616d0000b273f14aa81116510d3a6df8432b")
        ]));
}
