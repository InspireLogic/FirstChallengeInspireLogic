import 'package:challenge_inspire_logic/views/widgets/buttons/AppleButton.dart';
import 'package:challenge_inspire_logic/views/widgets/buttons/GoogleButton.dart';
import 'package:challenge_inspire_logic/views/widgets/txtFormField.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginPageState();
}

class _LoginPageState extends State<Loginpage> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0D17),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0D17),
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Login or create an account",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              "With a single account on Artic Travels, Hotels.com, and Vrbo, your travels become even more amazing and seamless to enjoy to the fullest.",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 40),
            GoogleLoginButton(onPressed: () {}),
            const SizedBox(height: 30),
            const Text(
              "ou",
              style: TextStyle(fontSize: 18, color: Colors.white70),
            ),
            const SizedBox(height: 30),
            TxtFormField(
              controller: emailController,
              hintText: "example: MauricioLindo@outlook.com",
              inputType: TextInputType.emailAddress,
              txtColor: Colors.white,
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).pushNamed('/home'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFB3D4FC),
                  foregroundColor: const Color(0xFF0B0D17),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: const Text(
                  "Continue",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),

            const SizedBox(height: 40),
            AppleLoginButton(onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
