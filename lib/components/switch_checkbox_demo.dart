import 'package:flutter/material.dart';

/// 单选开关和复选框demo

class SwitchCheckboxDemo extends StatelessWidget {
  const SwitchCheckboxDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('单选开关和复选框')),
      body: Center(
        child: Column(
          children: const [SwitchCheckbox()],
        ),
      ),
    );
  }
}

class SwitchCheckbox extends StatefulWidget {
  const SwitchCheckbox({super.key});

  @override
  State<StatefulWidget> createState() => _SwitchCheckboxState();
}

class _SwitchCheckboxState extends State<SwitchCheckbox> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Switch(
              value: _switchSelected, //当前状态
              onChanged: (value) {
                // 重新构建页面
                setState(() => _switchSelected = value);
              },
            ),
            Text(_switchSelected ? '开' : '关')
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: _checkboxSelected,
              activeColor: Colors.red, //选中时的颜色
              onChanged: (value) {
                setState(() => _checkboxSelected = value!);
              },
            ),
            Text(_checkboxSelected ? '选中' : '未选中')
          ],
        ),
      ],
    );
  }
}
