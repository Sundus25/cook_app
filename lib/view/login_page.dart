import 'package:cook_project/model/user_model.dart';
import 'package:cook_project/service/auth_api.dart';
import 'package:cook_project/widget/nav_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LogInPage extends StatelessWidget {
  LogInPage({super.key});

  final TextEditingController email = TextEditingController();

  final TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 250,
            width: 600,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                    "asset/background_image 1.png",
                  ),
                  fit: BoxFit.fitHeight),
            ),
            child: const Text(
              "Welcome Back",
              style: TextStyle(
                color: Colors.white,
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                TextField(
                  maxLines: 1,
                  controller: email,
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    hintStyle: const TextStyle(
                      color: Color(0XFF9d9fa0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0XFF9d9fa0), width: 2),
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                TextField(
                  maxLines: 1,
                  obscureText: true,
                  controller: password,
                  decoration: InputDecoration(
                    hintText: "Password",
                    hintStyle: const TextStyle(
                      color: Color(0XFF9d9fa0),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    suffixIcon: const Icon(
                      Icons.visibility_off,
                      size: 23,
                      color: Color(0XFF9d9fa0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Color(0XFF9d9fa0), width: 2),
                      borderRadius: BorderRadius.circular(
                        8,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const Row(
                  children: [
                    Text(
                      "forget password ?",
                      style: TextStyle(
                        color: Color(0XFF9d9fa0),
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0XFFfa9a0c),
                      shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      minimumSize: const Size(400, 48)),
                  onPressed: () async {
                    bool status = await login(
                        UserModel(email: email.text, password: password.text));
                    print(status.toString());
                    if (status) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Success"),
                        backgroundColor: Colors.green,
                      ));
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NavBar(),
                          ));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Failed"),
                        backgroundColor: Colors.red,
                      ));
                    }
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 60,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Color(0XFF7d8fab),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      " Sign Up",
                      style: TextStyle(
                        color: Color(0XFFfa9a0c),
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
