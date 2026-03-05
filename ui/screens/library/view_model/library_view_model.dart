import 'package:flutter/widgets.dart';
import '../../../../data/repositories/songs/song_repository.dart';
import '../../../states/player_state.dart';
import '../../../../model/songs/song.dart';

class LibraryViewModel extends ChangeNotifier {
  final SongRepository songRepository;
  final PlayerState playerState;

  LibraryViewModel({required this.songRepository, required this.playerState});

  List<Song> _songs = [];
  List<Song> get songs => _songs;

  Song? get currentSong => playerState.currentSong;
  void init() {
    _songs = songRepository.fetchSongs();
    playerState.addListener(() => notifyListeners());
    notifyListeners();
  }

  void play(Song song) {
    playerState.start(song);
    notifyListeners();
  }

  void stop() {
    playerState.stop();
    notifyListeners();
  }
}
