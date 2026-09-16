import 'package:flutter/material.dart';



enum NotificationPosition {
  top,
  bottom,
}


class AppNotificationSnackBar {
  static void show(
      BuildContext context, {
        required String message,
        IconData? icon,
        Color backgroundColor = Colors.blue,
        NotificationPosition position = NotificationPosition.top,
        Duration duration = const Duration(seconds: 2),
      }) {
    final overlay = Overlay.of(context);

    late OverlayEntry entry;
    late AnimationController controller;

    final isTop = position == NotificationPosition.top;

    controller = AnimationController(
      vsync: Navigator.of(context),
      duration: const Duration(milliseconds: 300),
    );

    final animation = Tween<Offset>(
      begin: Offset(0, isTop ? -1 : 1),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeOut,
      ),
    );

    entry = OverlayEntry(
      builder: (context) {
        return Positioned(
          top: isTop
              ? MediaQuery.of(context).padding.top + 10
              : null,
          bottom: !isTop
              ? MediaQuery.of(context).padding.bottom + 10
              : null,
          left: 10,
          right: 10,

          child: Material(
            color: Colors.transparent,

            child: SlideTransition(
              position: animation,

              child: Container(
                padding: const EdgeInsets.all(14),

                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),

                child: Row(
                  children: [
                    if (icon != null)
                      Icon(
                        icon,
                        color: Colors.white,
                      ),

                    const SizedBox(width: 10),

                    Expanded(
                      child: Text(
                        message,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );

    overlay.insert(entry);

    controller.forward();

    Future.delayed(duration, () async {
      await controller.reverse();

      if (entry.mounted) {
        entry.remove();
      }

      controller.dispose();
    });
  }
}