import 'package:flutter/material.dart';

/// 图片和icon

class ImageIconDemo extends StatelessWidget {
  const ImageIconDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('图片和icon')),
        body: Center(
          child: Column(
            children: [
              /// 参数设置：https://book.flutterchina.club/chapter3/img_and_icon.html#_3-%E5%8F%82%E6%95%B0
              // 从asset中加载图片
              const Image(image: AssetImage("assets/layer.png"), width: 100.0),
              // 从asset中加载图片第二种写法
              // Image.asset(
              //   "assets/layer.png",
              //   width: 100.0,
              // )
              const Image(
                image: NetworkImage(
                    "https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100.0,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const <Widget>[
                  Icon(Icons.accessible, color: Colors.green),
                  Icon(Icons.error, color: Colors.green),
                  Icon(Icons.fingerprint, color: Colors.green),
                  // 使用自定义字体图标，详细教程： https://blog.csdn.net/ding139725/article/details/104843005
                  Icon(MyIcons.tower),
                ],
              )
            ],
          ),
        ));
  }
}

class MyIcons {
  // tower 图标
  static const IconData tower =
      IconData(0xebc8, fontFamily: 'myIcon', matchTextDirection: true);
}
