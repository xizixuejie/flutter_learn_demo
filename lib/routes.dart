import 'package:flutter/material.dart';

import './pages/new_page.dart';
import './pages/user.dart';
import './components/index.dart';
import './components/text_demo.dart';
import './components/button_demo.dart';
import './components/image_icon.dart';
import './components/switch_checkbox_demo.dart';
import './components/input_form_demo.dart';
import 'main.dart';

class MyRouter {
  static final Map<String, WidgetBuilder> routes = {
    '/': (context) => const HomePage(title: 'flutter learn demo'),
    'newPage2': (context) => const NewPage2(),
    'component': (context) => const Component(),
    'component/text': (context) => const TextDemo(),
    'component/button': (context) => const ButtonDemo(),
    'component/image': (context) => const ImageIconDemo(),
    'component/switch_checkbox': (context) => const SwitchCheckboxDemo(),
    'component/input_form': (context) => const InputFormDemo(),
    // 'user': (context) => const UserPage(),
  };

  /// onGenerateRoute只会对命名路由生效
  /// onGenerateRoute属性，它在打开命名路由时可能会被调用
  /// 如果指定的路由名在路由表中已注册，则会调用路由表中的builder函数来生成路由组件
  /// 如果路由表中没有注册，才会调用onGenerateRoute来生成路由
  static RouteFactory generateRoute = (settings) {
    String? routeName = routeBeforeHook(settings);
    return MaterialPageRoute(builder: (ctx) {
      switch (routeName) {
        case 'login':
          return const LoginPage();
        case 'user':
          return const UserPage();
        default:
          return const Scaffold(
            body: Center(
              child: Text("页面不存在"),
            ),
          );
      }
    });
  };
  static RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) => const UnknownPage());
  };

  // 实现拦截功能
  static String? routeBeforeHook(RouteSettings settings) {
    if (settings.name == 'user') {
      return 'login';
    }
    return settings.name;
  }
}
