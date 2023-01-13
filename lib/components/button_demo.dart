import 'package:flutter/material.dart';

/// 按钮
/// onPressed 点击按钮后触发的回调函数
class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  void _onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('按钮')),
      body: Column(
        children: [
          /// "漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大
          ElevatedButton(
            onPressed: _onPressed,
            child: const Text("normal"),
          ),

          /// 文本按钮，默认背景透明并不带阴影。按下后，会有背景色
          TextButton(
            onPressed: _onPressed,
            child: const Text("normal"),
          ),

          /// 默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影
          OutlinedButton(
            onPressed: _onPressed,
            child: const Text("normal"),
          ),

          /// 可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
          IconButton(
            icon: const Icon(Icons.thumb_up),
            onPressed: () {},
          ),

          /// 带图标的按钮
          ElevatedButton.icon(
            icon: const Icon(Icons.send),
            label: const Text("发送"),
            onPressed: _onPressed,
          ),
          OutlinedButton.icon(
            icon: const Icon(Icons.add),
            label: const Text("添加"),
            onPressed: _onPressed,
          ),
          TextButton.icon(
            icon: const Icon(Icons.info),
            label: const Text("详情"),
            onPressed: _onPressed,
          ),
        ],
      ),
    );
  }
}
