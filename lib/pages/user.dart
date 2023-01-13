
import 'package:flutter/material.dart';

/// 假装是个用户页面
class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('用户页面'),
      ),
      body: const Center(child: Text('用户页面')),
    );
  }
}


/// 假装是个登录界面
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('登录界面'),
      ),
      body:   Center(child: Column(
        children: [
          Text('登录界面'),
        ],
      )),
    );
  }
}


/// 假装是个未知界面
class UnknownPage extends StatelessWidget {
  const UnknownPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('未知界面'),
      ),
      body: const Center(child: Text('未知界面')),
    );
  }
}