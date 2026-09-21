import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';



class ProductAudioPlayer extends StatefulWidget {
  const ProductAudioPlayer({
    super.key,
    required this.audioUrl,
  });

  final String audioUrl;

  @override
  State<ProductAudioPlayer> createState() => _ProductAudioPlayerState();
}

class _ProductAudioPlayerState extends State<ProductAudioPlayer> {
  late final AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();

    _audioPlayer = AudioPlayer();

    _initializeAudio();
  }

  Future<void> _initializeAudio() async {
    await _audioPlayer.setUrl(widget.audioUrl);
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    final seconds = duration.inSeconds
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    if (duration.inHours > 0) {
      return '${duration.inHours}:$minutes:$seconds';
    }

    return '$minutes:$seconds';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff292929),
        borderRadius: BorderRadius.circular(16),
      ),
      child: StreamBuilder<PlayerState>(
        stream: _audioPlayer.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;

          final processingState = playerState?.processingState;
          final isPlaying = playerState?.playing ?? false;

          if (processingState == ProcessingState.loading ||
              processingState == ProcessingState.buffering) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return Column(
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 48,
                    onPressed: () {
                      if (isPlaying) {
                        _audioPlayer.pause();
                      } else {
                        _audioPlayer.play();
                      }
                    },
                    icon: Icon(
                      isPlaying
                          ? Icons.pause_circle_filled
                          : Icons.play_circle_fill,
                      color: Colors.white,
                    ),
                  ),

                  Expanded(
                    child: StreamBuilder<Duration>(
                      stream: _audioPlayer.positionStream,
                      builder: (context, snapshot) {
                        final position =
                            snapshot.data ?? Duration.zero;

                        return Text(
                          _formatDuration(position),
                          textDirection: TextDirection.ltr,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              Directionality(
                textDirection: TextDirection.ltr,
                child: StreamBuilder<Duration?>(
                  stream: _audioPlayer.durationStream,
                  builder: (context, durationSnapshot) {
                    final duration =
                        durationSnapshot.data ?? Duration.zero;

                    return StreamBuilder<Duration>(
                      stream: _audioPlayer.positionStream,
                      builder: (context, positionSnapshot) {
                        final position =
                            positionSnapshot.data ?? Duration.zero;

                        final max =
                            duration.inMilliseconds > 0
                                ? duration.inMilliseconds.toDouble()
                                : 1.0;

                        final value =
                            position.inMilliseconds
                                .clamp(
                                  0,
                                  duration.inMilliseconds,
                                )
                                .toDouble();

                        return Slider(
                          value: value,
                          max: max,
                          onChanged: (value) {
                            _audioPlayer.seek(
                              Duration(
                                milliseconds: value.toInt(),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}