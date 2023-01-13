import 'dart:developer';

import 'package:flutter/material.dart';

class InputDemo extends StatelessWidget {
  const InputDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录页面demo'),
      ),
      body: const LoginForm(),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<StatefulWidget> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _unameController = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          // 是否自动获取焦点
          autofocus: true,
          controller: _unameController,
          focusNode: focusNode1,
          decoration: const InputDecoration(
            labelText: '用户名',
            hintText: '用户名或邮箱',
            prefixIcon: Icon(Icons.person),
          ),
          // 监听文本变化1 设置onChange回调
          onChanged: (value) {
            log("username changed:$value");
          },
        ),
        TextField(
          focusNode: focusNode2,
          decoration: const InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              prefixIcon: Icon(Icons.lock)),
          // 是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。
          obscureText: true,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        log("输入的用户名是:${_unameController.text}");
                      },
                      child: const Text('登录')))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Row(children: [
            ElevatedButton(
                child: const Text('移动焦点'),
                onPressed: () {
                  /// 将焦点从第一个TextField移到第二个TextField
                  FocusScope.of(context).requestFocus(focusNode2);
                  /// 这是另一种写法，但是如果这样写，下面的隐藏键盘就不生效了。不知道为什么
                  // if (null == focusScopeNode) {
                  //   focusScopeNode = FocusScope.of(context);
                  // } else {
                  //   focusScopeNode?.requestFocus(focusNode2);
                  // }
                }),
            ElevatedButton(
              child: const Text("隐藏键盘"),
              onPressed: () {
                // 当所有编辑框都失去焦点时键盘就会收起
                focusNode1.unfocus();
                focusNode2.unfocus();
              },
            ),
          ]),
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    // 监听文本变化2 通过controller监听
    /// 两种方式相比，onChanged是专门用于监听文本变化，
    /// 而controller的功能却多一些，除了能监听文本变化外，它还可以设置默认值、选择文本
    _unameController.addListener(() {
      log("username_controller listen changed:${_unameController.text}");
    });

    _unameController.text = "admin";
    _unameController.selection = TextSelection(
        baseOffset: 2, extentOffset: _unameController.text.length);
    
    focusNode2.addListener(() {
      // 获得、失去焦点都会触发
      log("focusNode2监听焦点变化");
    });
    
  }
}
