import 'package:flutter/material.dart';
import 'package:homework/week7/data/repositories/history/user_history_repository.dart';
import 'package:homework/week7/ui/screens/home/view_model/home_view_model.dart';
import 'package:homework/week7/ui/screens/home/widget/home_content.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final viewModel = HomeViewModel(
          songRepository: context.read<SongRepository>(),
          userHistoryRepository: context.read<UserHistoryRepository>(),
          playerState: context.read<PlayerState>(),
        );
        viewModel.init();
        return viewModel;
      },
      builder: (context, child) => HomeContent(),
    );
  }
}
