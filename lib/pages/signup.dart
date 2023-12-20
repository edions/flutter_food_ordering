import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/widgets/navigation.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// import 'package:fluttertoast/fluttertoast.dart';

final supabase = Supabase.instance.client;

class SignPage extends StatefulWidget {
  const SignPage({Key? key}) : super(key: key);

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  // Hardcoded credentials for simplicity (replace with actual authentication logic)
  final String validEmail = "user";
  final String validPassword = "123";

  void processLogin() async {
    final authResponse =  await supabase.auth.signUp(
        password: passController.text, email: emailController.text);
    // String enteredEmail = emailController.text;
    // String enteredPassword = passController.text;
    //
    // if (enteredEmail == validEmail && enteredPassword == validPassword) {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => const NavigationWidget()),
    //   );
    // } else {
    //   // Unsuccessful login
    //   print("Login failed. Invalid credentials.");
    //   // showToast("Invalid credentials");
    // }
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
