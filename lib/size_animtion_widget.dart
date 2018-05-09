import 'package:flutter/material.dart';
class SizeAnimation extends StatefulWidget{
Widget child;
SizeAnimation(this.child);
@override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new SizeAnimationState();
  }
}

class SizeAnimationState extends State<SizeAnimation> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _widthAnimation;
  Animation<double> _heightAnimation;

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = new AnimationController(duration: new Duration(
      milliseconds: 1000
    ), vsync: this);

    _widthAnimation = new Tween<double>(begin: 0.4,end: 1.0)
    .animate(new CurvedAnimation(
       curve: Curves.easeInOut, parent: _controller
    ));

      _heightAnimation = new Tween<double>(begin: 50.0,end: 250.0)
    .animate(new CurvedAnimation(
       curve: Curves.easeInOut, parent: _controller
    ));

    _controller.addListener((){
      this.setState((){

      });
    });

    _controller.forward();
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Container( 
       
        width: MediaQuery.of(context).size.width * _widthAnimation.value,
        height: _heightAnimation.value,

        child: widget.child,
      );
    }
  

}