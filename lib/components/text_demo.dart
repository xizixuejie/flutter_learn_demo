import 'package:flutter/material.dart';

/// 文本及样式
class TextDemo extends StatelessWidget {
  const TextDemo({super.key});

  @override
  Widget build(BuildContext context) {
    Paint paint = Paint();
    paint.color = Colors.yellow;
    return Scaffold(
      appBar: AppBar(title: const Text('文本及样式')),
      body: Column(
        /// 对Text组件设置 textAlign: TextAlign.left 无效。
        /// 由于TEXT组件的大小是自动包裹内容的，所以怎么设置都不会看到效果，因为没有多余的空间去左对齐或右对齐等。
        /// 但是这里Text组件放在Colum组件中，所以只需要对Colum设置 crossAxisAlignment: CrossAxisAlignment.start 即可生效
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'HelloWorld',
            textAlign: TextAlign.center,
          ),
          const Divider(),

          /// 注意，对齐的参考系是Text widget 本身。
          /// 上一个Text中虽然是指定了居中对齐，但因为 Text 文本内容宽度不足一行，Text 的宽度和文本内容长度相等，
          /// 那么这时指定对齐方式是没有意义的，只有 Text 宽度大于文本内容长度时指定此属性才有意义。
          Text(
            'HelloWorld' * 10,
            textAlign: TextAlign.center,
          ),
          const Divider(),
          Text(
            'HelloWorld' * 10,
            // 指定文本显示的最大行数 = 1
            maxLines: 1,
            // 截断方式
            overflow: TextOverflow.ellipsis,
          ),
          const Divider(),
          const Text(
            'HelloWorld',
            // 字体缩放比例
            textScaleFactor: 1.5,
          ),
          const Divider(),
          // TextStyle指定文本样式
          Text(
            'TextStyle',
            style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 18.0,
                height: 1.2,
                fontFamily: "Courier",
                background: paint,
                decoration: TextDecoration.underline,
                decorationStyle: TextDecorationStyle.dashed),
          ),
          const Divider(),

          /// 对一个 Text 内容的不同部分按照不同的样式显示 用 Text.rich() 和 TextSpan 完成
          const Text.rich(TextSpan(children: [
            TextSpan(text: 'Home: '),
            TextSpan(
              text: "https://flutterchina.club",
              style: TextStyle(color: Colors.blue),
              // recognizer: _tapRecognizer
            ),
          ])),

          /// 文本的样式默认是可以被继承的
          DefaultTextStyle(
            //1.设置文本默认样式
            style: const TextStyle(
              color: Colors.red,
              fontSize: 20.0,
            ),
            textAlign: TextAlign.start,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text("hello world"),
                Text("I am Jack"),
                Text(
                  "I am Jack",
                  style: TextStyle(
                      inherit: false, //2.不继承默认样式
                      color: Colors.grey),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
