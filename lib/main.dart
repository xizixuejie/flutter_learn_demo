import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_learn_demo/routes.dart';

import './pages/new_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 命名路由表
      routes: MyRouter.routes,
      onGenerateRoute: MyRouter.generateRoute,
      onUnknownRoute: MyRouter.unknownRoute,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                // result 接受路由返回值，只有点击按钮会有结果
                var result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    // builder:构建路由页面的具体内容，返回值是一个widget。  实现此回调，返回新路由的实例。
                    builder: (context) {
                      return const NewPage1(title: '新页面1');
                    },
                    // maintainState: false,
                    // 是否是一个全屏的模态对话框
                    // fullscreenDialog: true
                  ),
                );
                log("路由返回值result=$result");
              },
              child: const Text('路由跳转并且传值'),
            ),
            ElevatedButton(
              // onPressed: () => Navigator.pushNamed(context, 'newPage2'),
              // 命名路由传递参数
              onPressed: () =>
                  Navigator.of(context).pushNamed("newPage2", arguments: "hi"),
              child: const Text('通过路由名称跳转页面'),
            ),
            ElevatedButton(
              // 命名路由传递参数
              onPressed: () => Navigator.pushNamed(context, 'user'),
              child: const Text('假的个人中心'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, 'component'),
              child: const Text('组件'),
            )
          ],
        ),
      ),
    );
  }
}
