// ignore_for_file: avoid_print

import 'package:b_mint_page/Widgets/StateManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../util/util.dart';

class MinterButton extends StatefulWidget {
  const MinterButton({super.key});

  @override
  State<MinterButton> createState() => _MinterButtonState();
}

class _MinterButtonState extends State<MinterButton> {
  late final double screenWidth;
  late final double screenHeight;
  late final double widgetWidth;
  late final double widgetHeight;
  late StateManager stateManager;
  @override
  void initState() {
    screenHeight = 700;
    screenWidth = 1290;
    widgetWidth = screenWidth / 7;
    widgetHeight = screenHeight / 15;

    super.initState();
  }

  @override
  void didChangeDependencies() {
    stateManager = Provider.of<StateManager>(context, listen: false);
    super.didChangeDependencies();
  }

  void _onMintPress() async {
    if (!stateManager.isConnected) return;
    mint(stateManager);
    return;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widgetWidth,
      height: widgetHeight,
      child: DecoratedBox(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: const Border(
              top: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              bottom: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              left: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
              right: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            ),
            color: const Color.fromARGB(255, 245, 0, 233)),
        child: TextButton(
          onPressed: _onMintPress,
          child: const Text(
            'MINT',
            style: TextStyle(
                color: Colors.black,
                fontStyle: FontStyle.italic,
                letterSpacing: 2,
                fontSize: 25,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
