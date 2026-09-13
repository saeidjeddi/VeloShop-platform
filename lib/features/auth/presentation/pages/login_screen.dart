import 'package:flutter/material.dart';
import 'package:veloshop/core/constants/assets_path/image_path.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
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
            child: Image.asset(ImagePath.light1, width: size.width * 0.24),
          ),
          Positioned(
            top: 0,
            right: size.width * 0.4,
            child: Image.asset(ImagePath.light2, width: size.width * 0.16),
          ),

          Positioned(
            top: size.height * 0.01,
            left: size.width * 0.60,
            child: Image.asset(ImagePath.clock, width: size.width * 0.3),
          ),

          Positioned(
            top: size.height * 0.4,
            left: size.width * 0.1,
            right: size.width * 0.1,
            child: const Text(
              ' ورود',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.5,
            left: size.width * 0.1,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10),
              ),
              child: const TextField(
                
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  border: InputBorder.none,
                  labelText: 'ایمیل',
                ),
              ),
            ),
          ),

          Positioned(
            top: size.height * 0.6,
            left: size.width * 0.1,
            child: Container(
              width: size.width * 0.8,
              height: size.height * 0.06,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                obscureText: true,
                
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.white),

                  suffixIcon: IconButton(icon: Icon(Icons.visibility_off), onPressed: () {},),

                  border: InputBorder.none,
                  labelText: 'رمز عبور',
                  labelStyle: const TextStyle(color: Colors.white70),
                ),
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.7,
            left: size.width * 0.1,
            child: ElevatedButton(
              onPressed: () {
                // Handle login logic here
              },
              child: Text('تایید'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(size.width * 0.8, size.height * 0.06),
                backgroundColor: Colors.blue.shade900,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
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
                  'حساب کاربری ندارید؟',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),

                const SizedBox(width: 5),
                GestureDetector(
                  onTap: () {
                    // Navigate to the registration screen
                  },
                  child: const Text(
                    'ثبت نام',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
