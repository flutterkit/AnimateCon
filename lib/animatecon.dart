import 'dart:math';
import 'package:flutter/material.dart';
import 'package:tweener/tweener.dart';
import './AnimateProp.dart';

final EaseInstanceClass animateEase = EaseInstanceClass();

class AnimateCon extends StatefulWidget {
  final Widget child;
  final Map<String, double> initProp;
  const AnimateCon({required this.child, required this.initProp, Key? key})
      : super(key: key);

  @override
  AnimateConState createState() => AnimateConState();
}

class AnimateConState extends State<AnimateCon> {
  AnimateProp prop = AnimateProp();
  Tweener? _tween;
  bool _visible = true;

  @override
  void initState() {
    super.initState();
    setProp(widget.initProp);
  }

  @override
  void dispose() {
    super.dispose();
    stop();
  }

  void animate(Map<String, dynamic> from, Map<String, dynamic> to,
      {int time = 600, Function? ease, Function? onComplete, int delay = 0}) {
    ease = ease ?? Tweener.ease.cubic.easeOut;

    setState(() {
      _visible = true;
    });
    _tween = Tweener(from)
        .to(to, time)
        .delay(delay)
        .easing(ease)
        .onUpdate((Map<String, dynamic> obj) {
      setState(() {
        setProp(obj);
      });
    }).onComplete((obj) {
      if (onComplete != null) onComplete();
    }).start();
  }

  void stop() {
    if (_tween != null) _tween!.stop();
  }

  void setProp(Map obj) {
    if (obj.containsKey("alpha")) {
      double alpha = obj["alpha"];
      prop.alpha = min(1, max(alpha, 0));
      if (prop.alpha <= 0) _visible = false;
    }

    if (obj.containsKey("scale")) {
      prop.scale = obj["scale"];
    }

    if (obj.containsKey("x")) {
      prop.x = obj["x"];
    }

    if (obj.containsKey("y")) {
      prop.y = obj["y"];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
        offset: Offset(prop.x, prop.y),
        child: Transform.scale(
            scale: prop.scale,
            child: Visibility(
                visible: _visible,
                child: Opacity(opacity: prop.alpha, child: widget.child))));
  }
}
