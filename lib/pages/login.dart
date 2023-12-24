import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/widgets/navigation.dart';
// import 'package:fluttertoast/fluttertoast.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  // Hardcoded credentials for simplicity (replace with actual authentication logic)
  final String validEmail = "user";
  final String validPassword = "123";

  void processLogin() async {
  }

  // void showToast(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
  // }

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
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 50),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passController,
              obscureText: true, // Hide password
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                processLogin();
                emailController.clear();
                passController.clear();
              },
              child: Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}
