abstract class UserHistoryRepository {
  List<String> fetchRecentSongIds();
  List<String> fetchRecommendedSongIds();

  void addSongToHistory(String songId);
}
