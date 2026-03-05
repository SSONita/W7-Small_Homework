import 'package:homework/week7/data/repositories/history/user_history_repository.dart';

class UserHistoryRepositoryMock implements UserHistoryRepository {
  final List<String> _recentSongIds = ['101', '102'];
  final List<String> _recommendedSongIds = ['101', '103'];

  @override
  List<String> fetchRecentSongIds() {
    return _recentSongIds;
  }

  @override
  List<String> fetchRecommendedSongIds() {
    return _recommendedSongIds;
  }

  @override
  void addSongToHistory(String songId) {
    if(!_recentSongIds.contains(songId)){
      _recentSongIds.insert(0, songId);
      if (_recentSongIds.length > 31) {
        _recentSongIds.removeLast();
      }
    }
  }
}
