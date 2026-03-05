import 'package:flutter/widgets.dart';
import 'package:homework/week7/ui/states/player_state.dart';
import 'package:homework/week7/data/repositories/history/user_history_repository.dart';
import 'package:homework/week7/data/repositories/songs/song_repository.dart';
import 'package:homework/week7/model/songs/song.dart';

class HomeViewModel extends ChangeNotifier {
  SongRepository songRepository;
  UserHistoryRepository userHistoryRepository;
  PlayerState playerState;

  HomeViewModel({
    required this.songRepository,
    required this.userHistoryRepository,
    required this.playerState,
  });

  List<Song> _recentSongs = [];
  List<Song> get recentSongs => _recentSongs;

  List<Song> _recommendedSongs = [];
  List<Song> get recommendedSongs => _recommendedSongs;

  Song? get currentSong => playerState.currentSong;

  void init() {
    final recentSongIds = userHistoryRepository.fetchRecentSongIds();
    _recentSongs = recentSongIds
        .map((id) => songRepository.fetchSongById(id)!)
        .toList();

    final recommendedSongIds = userHistoryRepository.fetchRecommendedSongIds();
    _recommendedSongs = recommendedSongIds
        .map((id) => songRepository.fetchSongById(id)!)
        .toList();

    playerState.addListener(() => notifyListeners());
    notifyListeners();
  }

  void play(Song song) {
    playerState.start(song);
    userHistoryRepository.addSongToHistory(song.id);
    notifyListeners();
  }
}
