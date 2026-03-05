import 'package:flutter/material.dart';
import 'package:homework/week7/model/songs/song.dart';
import 'package:homework/week7/ui/screens/home/view_model/home_view_model.dart';
import 'package:homework/week7/ui/states/settings_state.dart';
import 'package:homework/week7/ui/theme/theme.dart';
import 'package:provider/provider.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsState = context.watch<AppSettingsState>();
    final viewModel = context.watch<HomeViewModel>();
    return Container(
      color: settingsState.theme.backgroundColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 16),
          Text("Home", style: AppTextStyles.heading),

          SizedBox(height: 50),
          Text(
            "Your recent songs", 
            style: AppTextStyles.label.copyWith(color: AppColors.textLight)
          ),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.recentSongs.length,
              itemBuilder: (context, index) => SongTile(
                song: viewModel.recentSongs[index],
                isPlaying: viewModel.currentSong == viewModel.recentSongs[index],
                onTap: () {
                  viewModel.play(viewModel.recentSongs[index]);
                },
              ),
            ),
          ),
          SizedBox(height: 30),
          Text(
            "You might also like", 
            style: AppTextStyles.label.copyWith(color: AppColors.textLight)
          ),
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.recommendedSongs.length,
              itemBuilder: (context, index) => SongTile(
                song: viewModel.recommendedSongs[index],
                isPlaying:
                    viewModel.currentSong == viewModel.recommendedSongs[index],
                onTap: () {
                  viewModel.play(viewModel.recommendedSongs[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SongTile extends StatelessWidget {
  const SongTile({
    super.key,
    required this.song,
    required this.isPlaying,
    required this.onTap,
  });

  final Song song;
  final bool isPlaying;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(song.title),
      trailing: Text(
        isPlaying ? "Playing" : "",
        style: TextStyle(color: Colors.amber),
      ),
    );
  }
}

