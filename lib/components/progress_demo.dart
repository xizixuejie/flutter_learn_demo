import 'package:flutter/material.dart';

class ProgressDemo extends StatefulWidget {
  const ProgressDemo({super.key});

  @override
  State<StatefulWidget> createState() => _ProgressDemoState();
}

class _ProgressDemoState extends State<ProgressDemo>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final double _progress = .5;

  @override
  void initState() {
    //动画执行时间3秒
    _animationController = AnimationController(
      vsync: this, //注意State类需要混入SingleTickerProviderStateMixin（提供动画帧计时/触发器）
      duration: const Duration(seconds: 3),
    );
    _animationController.forward();
    _animationController.addListener(() => setState(() => {}));
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('进度条demo'),
      ),
      body: Center(
        child: Column(
          children: [
            /// 模糊进度条(会执行一个动画)
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
            ),

            /// 进度条显示50%
            LinearProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              value: _progress,
            ),

            /// 模糊进度条(会执行一个旋转动画)
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
            ),

            /// 进度条显示50%，会显示一个半圆
            CircularProgressIndicator(
              backgroundColor: Colors.grey[200],
              valueColor: const AlwaysStoppedAnimation(Colors.blue),
              value: _progress,
            ),

            /// 进度色动画
            Padding(
                padding: const EdgeInsets.all(16),
                child: LinearProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                      .animate(_animationController), // 从灰色变成蓝色
                  value: _animationController.value,
                )),
          ],
        ),
      ),
    );
  }
}
