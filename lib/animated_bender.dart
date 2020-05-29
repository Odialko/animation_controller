import 'package:flutter/material.dart';

class AnimatedBenderWidget extends StatefulWidget {
  @override
  _AnimatedBenderWidgetState createState() => _AnimatedBenderWidgetState();
}

class _AnimatedBenderWidgetState extends State<AnimatedBenderWidget>
    with TickerProviderStateMixin {
  AnimationController _controllerFloatUp;
  AnimationController _controllerGrowSize;
  Animation<double> _animationFloatUp;
  Animation<double> _animationGrowSize;

  @override
  void initState() {
    super.initState();
    _controllerFloatUp =
        AnimationController(duration: Duration(seconds: 4), vsync: this);
    _controllerGrowSize =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
  }

  @override
  void dispose() {
    _controllerFloatUp.dispose();
    _controllerGrowSize.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _benderHeight = MediaQuery.of(context).size.height / 2;
    double _benderWidth = MediaQuery.of(context).size.height / 3;
    double _balloonBottomLocation =
        MediaQuery.of(context).size.height - _benderHeight;
    _animationFloatUp = Tween(begin: _balloonBottomLocation, end: 0.0).
    animate(CurvedAnimation(parent: _controllerFloatUp, curve: Curves.fastOutSlowIn));
    _animationGrowSize = Tween(begin: 50.0, end: _benderWidth).
    animate(CurvedAnimation(parent: _controllerGrowSize, curve: Curves.elasticInOut));
//    _controllerFloatUp.forward();
//    _controllerGrowSize.forward();

    return AnimatedBuilder(
      animation: _animationFloatUp,
      builder: (context, child) {
        return Container(
          child: child,
          margin: EdgeInsets.only(
            top: _animationFloatUp.value,
          ),
          width: _animationGrowSize.value,
        );
      },
      child: GestureDetector(
        onTap: () {
          if (_controllerFloatUp.isCompleted) {
            _controllerFloatUp.reverse();
            _controllerGrowSize.reverse();
          } else {
            _controllerFloatUp.forward();
            _controllerGrowSize.forward();
          }
        },
        child: Image.asset('assets/images/bender.png',
            height: _benderHeight, width: _benderWidth),
      ),
    );
  }
}
