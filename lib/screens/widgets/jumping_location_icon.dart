import 'package:flutter/material.dart';

class JumpingLocationIcon extends StatefulWidget {
  @override
  _JumpingLocationIconState createState() => _JumpingLocationIconState();
}

class _JumpingLocationIconState extends State<JumpingLocationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, -_animation.value),
          child: Icon(
            Icons.location_on_sharp,
            size: 28,
            color: Color(0xff00008b),
          ),
        );
      },
    );
  }
}
