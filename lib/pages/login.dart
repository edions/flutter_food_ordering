import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _RectanglePageState();
}

class _RectanglePageState extends State<LoginPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  double? result;

  void calculateArea() {
    // double length = double.tryParse(controller1.text) ?? 0;
    // double width = double.tryParse(controller2.text) ?? 0;
    //
    // double area = length * width;
    //
    // setState(() {
    //   result = area;
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Login",
              style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
              controller: controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                calculateArea();
                controller1.clear();
                controller2.clear();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}