import 'package:flutter/material.dart';

class AnimatedBar extends StatelessWidget {
  final AnimationController animationController;
  final int position;
  final int currentIndex;
  const AnimatedBar({
    Key key,
    this.animationController,
    this.position,
    this.currentIndex,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              _buildContainer(
                width: double.infinity,
                color: position < currentIndex
                    ? Colors.white
                    : Colors.white.withOpacity(0.5),
              ),
              position == currentIndex
                  ? AnimatedBuilder(
                      animation: animationController,
                      builder: (context, child) {
                        return _buildContainer(
                            color: Colors.white,
                            width: constraints.maxWidth *
                                animationController.value);
                      },
                    )
                  : SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}

Widget _buildContainer({double width, Color color}) {
  return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.black26, width: 0.8),
          borderRadius: BorderRadius.circular(3.0)));
}
