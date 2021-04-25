import 'package:devquiz/core/app_colors.dart';
import 'package:devquiz/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatefulWidget {
  final int score;
  const ChartWidget({required this.score});

  @override
  _ChartWidgetState createState() => _ChartWidgetState();
}

class _ChartWidgetState extends State<ChartWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  void _initAnimation() {
    double percentage = widget.score / 100;

    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: percentage).animate(_controller);
    _controller.forward();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initAnimation();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
          height: 70,
          width: 70,
          child: AnimatedBuilder(
            animation: _animation,
            builder: (context, _) => Stack(
              children: [
                Container(
                  height: 70,
                  width: 70,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    value: _animation.value,
                    backgroundColor: AppColors.chartSecondary,
                    valueColor:
                        AlwaysStoppedAnimation<Color>(AppColors.chartPrimary),
                  ),
                ),
                Center(
                  child: Text(
                    '${(_animation.value * 100).toInt()}%',
                    style: AppTextStyles.heading,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
