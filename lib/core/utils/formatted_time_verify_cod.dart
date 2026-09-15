String formatTime(int sec) {
  final duration = Duration(seconds: sec);

  final h = duration.inHours;
  final m = duration.inMinutes.remainder(60);
  final s = duration.inSeconds.remainder(60);

  if (h > 0) {
    return '$h:${m.toString().padLeft(2, '0')}:${s.toString().padLeft(2, '0')}';
  }

  return '$m:${s.toString().padLeft(2, '0')}';
}