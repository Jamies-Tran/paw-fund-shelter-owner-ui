import 'package:flutter/cupertino.dart';

class PAnimation extends StatefulWidget {
  const PAnimation({
    super.key,

    required this.child,

    required this.beginAnimate,
    required this.endAnimate
  });

  final Widget child;

  final double beginAnimate;
  final double endAnimate;

  @override
  State<PAnimation> createState() => _PAnimationState();
}

class _PAnimationState extends State<PAnimation> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(seconds: 1),
        reverseDuration: Duration(seconds: 1)
    );

    _animation = Tween<double>(begin: widget.beginAnimate, end: widget.endAnimate)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn  ));
    _controller.repeat(count: 1, reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
        scale: _animation,
        child: widget.child,
    );
  }
}
