import 'package:flutter/material.dart';

/// 基础组件学习

class Component extends StatelessWidget {
  const Component({super.key});

  @override
  Widget build(BuildContext context) {
    Paint paint = Paint();
    paint.color = Colors.yellow;
    return Scaffold(
      appBar: AppBar(title: const Text('基础组件')),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'component/text'),
              child: const Text('文本及样式')),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'component/button'),
              child: const Text('按钮')),
          ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'component/image'),
              child: const Text('图片和icon')),
          ElevatedButton(
              onPressed: () =>
                  Navigator.pushNamed(context, 'component/switch_checkbox'),
              child: const Text('单选开关和复选框')),
        ],
      )),
    );
  }
}
