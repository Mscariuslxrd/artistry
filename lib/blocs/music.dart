import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify/models/songs.dart';

class MusicState {
  final List<Songs> recommendations;

  MusicState(this.recommendations);
}

class MusicCubit extends Cubit<MusicState> {
  MusicCubit()
      : super(MusicState([
          Songs(
            title: "Circles",
            artistName: "Megan Thee Stallion",
            imageUrl:
                "https://media.pitchfork.com/photos/667b0bd3f0beb267ea0e64a4/16:9/w_1280,c_limit/Megan-Thee-Stallion.jpg",
          ),
          Songs(
              title: "Need to Know",
              artistName: "Doja Cat",
              imageUrl:
                  "https://i.scdn.co/image/ab67616d0000b273f14aa81116510d3a6df8432b")
        ]));
}
