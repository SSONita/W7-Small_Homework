import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../library/view_model/library_view_model.dart';
import '../library/widgets/library_content.dart';
import '../../../data/repositories/songs/song_repository.dart';
import '../../states/player_state.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        final viewModel = LibraryViewModel(
          songRepository: context.read<SongRepository>(),
          playerState: context.read<PlayerState>(),
        );
        viewModel.init();
        return viewModel;
      },
      child: LibraryContent(),
    );
  }
}
