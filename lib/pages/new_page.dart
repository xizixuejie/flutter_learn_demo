import 'dart:developer';

import 'package:flutter/material.dart';

class NewPage1 extends StatelessWidget {
  const NewPage1({super.key, required this.title});

  // title接受父页面传值
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
          child: Column(
        children: [
          Text('我是新页面接收到的参数:$title'),
          ElevatedButton(
              // 点击后在返回上一个路由的同时会带上一个返回参数
              onPressed: () => Navigator.pop(context, '我是返回值'),
              child: const Text('返回'))
        ],
      )),
    );
  }
}

class NewPage2 extends StatelessWidget {
  const NewPage2({super.key});

  @override
  Widget build(BuildContext context) {
    // 获取路由参数
    var args = ModalRoute.of(context)?.settings.arguments;
    log("通过命名路由获取的参数$args");
    return Scaffold(
      appBar: AppBar(
        title: const Text('新页面'),
      ),
      body: const Center(child: Text('通过命名路由跳转的新页面')),
    );
  }
}
