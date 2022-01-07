import 'package:flutter/material.dart';
import 'package:animated_background/animated_background.dart';


class AnimationBackground extends StatefulWidget {

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".


  @override
  _AnimationBackground createState() => _AnimationBackground();
}

class _AnimationBackground extends State<AnimationBackground>  with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff0c0c0c),
              Color(0xff2e2e2e),
            ],
          )
      ),
      child: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
            options: ParticleOptions(
              baseColor: Colors.white,
              spawnOpacity: 0.0,
              opacityChangeRate: 1,
              minOpacity: 0.1,
              maxOpacity: 0.2,
              spawnMinSpeed: 2.0,
              spawnMaxSpeed: 5.0,
              spawnMinRadius: 1.0,
              spawnMaxRadius: 2.0,
              particleCount: 1000,
            )),
        vsync: this,
        child: Text(""),
      ),
    );
  }
}