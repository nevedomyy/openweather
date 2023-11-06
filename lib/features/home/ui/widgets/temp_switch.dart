import 'package:flutter/material.dart';
import 'package:openweather/core/utils/utils.dart';

class TempSwitch extends StatefulWidget {
  final Function(bool value) onCange;
  final bool initial;

  const TempSwitch({
    super.key,
    required this.onCange,
    this.initial = true,
  });

  @override
  State<TempSwitch> createState() => _TempSwitchState();
}

class _TempSwitchState extends State<TempSwitch> {
  late bool _value;

  @override
  void initState() {
    super.initState();
    _value = widget.initial;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _value = !_value;
        widget.onCange(_value);
        setState(() {});
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          children: [
            _Btn(text: 'F', isActive: !_value),
            _Btn(text: 'C', isActive: _value),
          ],
        ),
      ),
    );
  }
}

class _Btn extends StatelessWidget {
  final bool isActive;
  final String text;

  const _Btn({required this.text, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isActive ? Colors.grey : Colors.transparent,
      ),
      child: Center(
        child: Text(
          '\u{00B0}$text',
          style: AppTextStyle.black18,
        ),
      ),
    );
  }
}
