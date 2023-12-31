import 'package:flutter/material.dart';
import 'package:ui_test/extensions/build_context.dart';

class ActionsFlagIcon extends StatelessWidget {
  const ActionsFlagIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight;
    final isPortrait = screenHeight > screenWidth;
    final isLandscape = screenWidth > screenHeight;
    return Padding(
      padding: const EdgeInsets.only(right: 2),
      child: Container(
        height: isPortrait ? screenWidth / 15 : screenWidth / 30,
        width: isLandscape ? screenWidth / 60 : screenHeight / 55,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage('assets/images/bg/unitedflag.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: PopupMenuButton(
          iconSize: 0,
          offset: Offset(0, isLandscape ? screenWidth / 45 : screenWidth / 20),
          itemBuilder: (BuildContext context) {
            return const [
              PopupMenuItem(value: 1, child: Text('English')),
              PopupMenuItem(value: 2, child: Text('Setting')),
              PopupMenuItem(value: 3, child: Text('Store Manager')),
              PopupMenuItem(
                value: 4,
                child: Row(
                  children: [Icon(Icons.exit_to_app), Text('Exit')],
                ),
              ),
            ];
          },
        ),
      ),
    );
  }
}
