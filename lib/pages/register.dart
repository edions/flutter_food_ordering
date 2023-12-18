import 'package:flutter/material.dart';
import 'package:flutter_food_ordering/widgets/navigation.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void processRegistration() {
    String enteredName = nameController.text;
    String enteredEmail = emailController.text;
    String enteredPassword = passwordController.text;
    String enteredConfirmPassword = confirmPasswordController.text;

    if (enteredPassword == enteredConfirmPassword) {
      // Registration successful, implement your logic to handle registration
      print("Registration successful");
      // You can navigate to another screen or perform other actions here
    } else {
      // Unsuccessful registration
      print("Registration failed. Passwords do not match.");
      // Show error message or handle accordingly
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Registration",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
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
              controller: passwordController,
              obscureText: true, // Hide password
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: confirmPasswordController,
              obscureText: true, // Hide password
              decoration: InputDecoration(
                labelText: "Confirm Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                processRegistration();
                nameController.clear();
                emailController.clear();
                passwordController.clear();
                confirmPasswordController.clear();
              },
              child: Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
