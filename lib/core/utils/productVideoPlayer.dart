import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veloshop/features/main/presentation/route/names.dart';
import 'package:video_player/video_player.dart';

class ProductVideoPlayer extends StatefulWidget {
  const ProductVideoPlayer({
    super.key,
    required this.controller,
  });

  final VideoPlayerController controller;

  @override
  State<ProductVideoPlayer> createState() => _ProductVideoPlayerState();
}

class _ProductVideoPlayerState extends State<ProductVideoPlayer> {
  bool _showControls = true;

  Timer? _hideControlsTimer;

  VideoPlayerController get controller => widget.controller;

  @override
  void initState() {
    super.initState();

      controller.addListener(_videoListener);


    _startHideTimer();
  }


  @override
void dispose() {
  controller.removeListener(_videoListener);
  _hideControlsTimer?.cancel();
  super.dispose();
}

  void _videoListener() {
  if (mounted) {
    setState(() {});
  }
}

  void _startHideTimer() {
    _hideControlsTimer?.cancel();

    _hideControlsTimer = Timer(
      const Duration(seconds: 2),
      () {
        if (mounted) {
          setState(() {
            _showControls = false;
          });
        }
      },
    );
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });

    if (_showControls) {
      _startHideTimer();
    } else {
      _hideControlsTimer?.cancel();
    }
  }

  void _togglePlayPause() {
    setState(() {
      if (controller.value.isPlaying) {
        controller.pause();
      } else {
        controller.play();
      }
    });

    if (_showControls) {
      _startHideTimer();
    }
  }

  // Future<void> _openFullscreen() async {
  //   _hideControlsTimer?.cancel();

  //   // await Navigator.of(context).push(
  //   //   MaterialPageRoute(
  //   //     builder: (_) => FullscreenVideoPlayer(
  //   //       controller: controller,
  //   //     ),
  //   //   ),
  //   // );

  //    Navigator.pushNamed(context, ScreenNames.fullscreenVideoPlayer, arguments: controller );



  //   if (mounted) {
  //     SystemChrome.setEnabledSystemUIMode(
  //       SystemUiMode.edgeToEdge,
  //     );

  //     setState(() {
  //       _showControls = true;
  //     });

  //     _startHideTimer();
  //   }
  // }








  Future<void> _openFullscreen() async {
  _hideControlsTimer?.cancel();

  await Navigator.of(context, rootNavigator: true).push(
    MaterialPageRoute(
      builder: (_) => FullscreenVideoPlayer(
        controller: controller,
      ),
    ),
  );

  if (!mounted) return;

    await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);


  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  setState(() {
    _showControls = true;
  });

  _startHideTimer();
}

 
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleControls,
      child: Stack(
        alignment: Alignment.center,
        
        children: [
          AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: VideoPlayer(controller),
          ),

          if (_showControls)
            Positioned.fill(
              child: Container(
                color: Colors.black26,
                child: Stack(
                  children: [
                    Center(
                      child: IconButton(
                        iconSize: 64,
                        onPressed: _togglePlayPause,
                        icon: Icon(
                          controller.value.isPlaying
                              ? Icons.pause_circle_filled
                              : Icons.play_circle_fill,
                          color: Colors.white,
                        ),
                      ),
                    ),

               Positioned(
  left: 12,
  right: 12,
  bottom: 8,
  child: Directionality(
    textDirection: TextDirection.ltr,
    child: Column(
      children: [
        VideoProgressIndicator(
          controller,
          allowScrubbing: true,
          padding: EdgeInsets.zero,
          colors: const VideoProgressColors(
            playedColor: Colors.red,
            bufferedColor: Colors.white54,
            backgroundColor: Colors.white24,
          ),
        ),

        const SizedBox(height: 6),

        Row(
          children: [
            Text(
              formatDuration(controller.value.position),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),

            const Spacer(),

            Text(
              formatDuration(controller.value.duration),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),

            const SizedBox(width: 4),

            IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: _openFullscreen,
              icon: const Icon(
                Icons.fullscreen,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ],
    ),
  ),
),
                  ],
                ),
              ),
            ),
        ],
      ),
    
    
    
    );
  }
}



















class FullscreenVideoPlayer extends StatefulWidget {
    const FullscreenVideoPlayer({super.key, required this.controller});

  final VideoPlayerController controller;



  @override
  State<FullscreenVideoPlayer> createState() =>
      FullscreenVideoPlayerState();
}



class FullscreenVideoPlayerState
    extends State<FullscreenVideoPlayer> {
  Timer? _hideTimer;
  bool _showControls = true;

  VideoPlayerController get controller => widget.controller;

  @override
  void initState() {
    controller.addListener(_videoListener);
    super.initState();

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    _startHideTimer();
  }


  void _videoListener() {
  if (mounted) {
    setState(() {});
  }
}


  void _startHideTimer() {
    _hideTimer?.cancel();

    _hideTimer = Timer(
      const Duration(seconds: 5),
      () {
        if (mounted) {
          setState(() {
            _showControls = false;
          });
        }
      },
    );
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });

    if (_showControls) {
      _startHideTimer();
    } else {
      _hideTimer?.cancel();
    }
  }

 Future<void> _closeFullscreen() async {
  _hideTimer?.cancel();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
  );

  if (!mounted) return;

  Navigator.of(context).pop();
}

@override
void dispose() {
  _hideTimer?.cancel();
   controller.removeListener(_videoListener);
  super.dispose();
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onTap: _toggleControls,
        child: Center(
          child: Stack(
  fit: StackFit.expand,
  children: [
    FittedBox(
      fit: BoxFit.cover,
      child: SizedBox(
        width: controller.value.size.width,
        height: controller.value.size.height,
        child: VideoPlayer(controller),
      ),
    ),

    if (_showControls)
      Positioned.fill(
        child: Container(
          color: Colors.black26,
          child: Stack(
            children: [
              Center(
                child: IconButton(
                  iconSize: 72,
                  onPressed: () {
                    setState(() {
                      if (controller.value.isPlaying) {
                        controller.pause();
                      } else {
                        controller.play();
                      }
                    });

                    _startHideTimer();
                  },
                  icon: Icon(
                    controller.value.isPlaying
                        ? Icons.pause_circle_filled
                        : Icons.play_circle_fill,
                    color: Colors.white,
                  ),
                ),
              ),

              Positioned(
                top: 16,
                left: 16,
                child: IconButton(
                  onPressed: _closeFullscreen,
                  icon: const Icon(
                    Icons.fullscreen_exit,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),

              Positioned(
                left: 12,
                right: 12,
                bottom: 8,
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: Column(
                    children: [
                      VideoProgressIndicator(
                        controller,
                        allowScrubbing: true,
                        padding: EdgeInsets.zero,
                        colors: const VideoProgressColors(
                          playedColor: Colors.red,
                          bufferedColor: Colors.white54,
                          backgroundColor: Colors.white24,
                        ),
                      ),

                      const SizedBox(height: 6),

                      Row(
                        children: [
                          Text(
                            formatDuration(
                              controller.value.position,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),

                          const Spacer(),

                          Text(
                            formatDuration(
                              controller.value.duration,
                            ),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
  ],
),

        ),
      ),
    );
  }
}






String formatDuration(Duration duration) {
  final hours = duration.inHours;

  final minutes = duration.inMinutes
      .remainder(60)
      .toString()
      .padLeft(2, '0');

  final seconds = duration.inSeconds
      .remainder(60)
      .toString()
      .padLeft(2, '0');

  if (hours > 0) {
    return '$hours:$minutes:$seconds';
  }

  return '$minutes:$seconds';
}