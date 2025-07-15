import 'package:flutter/cupertino.dart';
import 'package:paw_fund_shelter_owner/share/bootstrap/utils/paw_utils.dart';

class PAnimation extends StatefulWidget {
  const PAnimation({
    super.key,

    required this.child,

    required this.beginAnimate,
    required this.endAnimate,

    this.duration,
    this.reverseDuration
  });

  final Widget child;

  final double beginAnimate;
  final double endAnimate;

  final Duration? duration;
  final Duration? reverseDuration;

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
        duration: PObjectUtils.requiredNonNullOrElse(
            Duration(seconds: 1), widget.duration),
        reverseDuration: PObjectUtils.requiredNonNullOrElse(
            Duration(seconds: 1), widget.reverseDuration)
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
