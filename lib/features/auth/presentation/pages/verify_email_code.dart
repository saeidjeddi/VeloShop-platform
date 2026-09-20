import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:veloshop/core/constants/assets_path/image_path.dart';
import 'package:veloshop/core/utils/formatted_time_verify_cod.dart';

class VerifyEmailCode extends StatefulWidget {
  const VerifyEmailCode({super.key});

  @override
  State<VerifyEmailCode> createState() => _VerifyEmailCodeState();
}

class _VerifyEmailCodeState extends State<VerifyEmailCode> {

  final List<TextEditingController> _controllers = List.generate(4,(context) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(4,(context) => FocusNode());



  @override
  void initState() {

    super.initState();
    startTimer();
  }

  late Timer _timer;
  int _start = 120;


  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _timer.cancel();
          _start = 120;
          Navigator.of(context).pop();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    for (final focusNode in _focusNodes) {
      focusNode.dispose();
    }
    _timer.cancel();
    super.dispose();
  }


  void _onChanged(String value, int index) {
    if (value.isNotEmpty && index < 3) {
      _focusNodes[index + 1].requestFocus();
    }

    if (value.isEmpty && index > 0) {
      _focusNodes[index - 1].requestFocus();
    }
  }

  String get _code {
    return _controllers.map((controller) => controller.text).join();
  }


  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    final double keyboardOffset = keyboardHeight > 0 ? -(keyboardHeight * 0.45) : 0;

    final light1Left = (size.width * 0.1).clamp(20.0, 80.0);
    final light2Right = (size.width * 0.4).clamp(80.0, 300.0);

    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: Stack(
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
                child: Image.asset(
                  ImagePath.background,
                  width: size.width,
                  height: size.height * 0.4,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),

          Positioned(
            top: 0,
            left: size.width * 0.1,
            child: Image.asset(
              ImagePath.light1,
              width: (size.width * 0.24).clamp(0, 90),
            ),
          ),

          Positioned(
            top: 0,
            right: size.width * 0.4,
            child: Image.asset(
              ImagePath.light2,
              width: (size.width * 0.16).clamp(0, 70),
            ),
          ),
          Positioned(
            top: size.height * 0.01,
            left: size.width * 0.60,
            child: Image.asset(ImagePath.clock, width: size.width * 0.3),
          ),

          Visibility(
            visible: !(keyboardHeight > 0),
            child: Positioned(
              top: size.height * 0.4,
              left: size.width * 0.1,
              right: size.width * 0.1,
              child: const Text(
                'تایید ورود',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          Visibility(
            visible: !(keyboardHeight > 0),
            child: Positioned(
              top: size.height * 0.5 ,
              left: size.width * 0.1,
              right: size.width * 0.1,
              child: const Text(
                'تایید ورود به Seedjeddimail@gmail.com',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.5 / 0.9 + keyboardOffset,
            left: size.width * 0.1,
            child:  Text(
              formatTime(_start),
              style: TextStyle(fontSize: 15, color: Colors.white),
            ),
          ),

          Positioned(
            top: keyboardHeight > 0 ? size.height * 0.42 : size.height * 0.6,
            left: size.width * 0.1,
            right: size.width * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: List.generate(4,(index) => SizedBox(
                  width: size.width * 0.17,
                  height: size.height * 0.07,
                  child: TextField(
                    controller: _controllers[index],
                    focusNode: _focusNodes[index],
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      counterText: '',
                      filled: true,
                      fillColor: Colors.white30,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    onChanged: (value) {
                      _onChanged(value, index);
                    },
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.7 + keyboardOffset,
            left: size.width * 0.1,
            child: ElevatedButton(
              onPressed: () {
                if (_code.length == 4) {
                  debugPrint(_code);
                  // ارسال کد به API

                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: Size(size.width * 0.8, size.height * 0.06),
                backgroundColor: Colors.blue.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('ورود'),
            ),
          ),

          Positioned(
            top: size.height * 0.8,
            left: size.width * 0.1,
            right: size.width * 0.1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'ایمیل خود را چک کنید',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
