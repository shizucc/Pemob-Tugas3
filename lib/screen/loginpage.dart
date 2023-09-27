import 'package:flutter/material.dart';
import 'package:pemob_t3/screen/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Widget _inputField(String hint, TextEditingController controller,
      bool obscure, Icon sufficIcon) {
    return TextField(
      decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
          suffixIcon: IconButton(
            icon: sufficIcon,
            onPressed: () {},
          )),
      controller: controller,
      obscureText: obscure,
    );
  }

  void login() {
    final Map<String, String> credential = {
      'username': 'admin',
      'password': 'admin'
    };
    final inputUsername = _usernameController.text;
    final inputPassword = _passwordController.text;

    if (inputUsername == credential['username'] &&
        inputPassword == credential['password']) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Selamat datang")));
      saveUsername();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Username atau Password salah")));
    }
  }

  void saveUsername() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("username", _usernameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
            ),
            const SizedBox(
              height: 15,
            ),
            _inputField("Username", _usernameController, false,
                const Icon(Icons.clear)),
            const SizedBox(
              height: 15,
            ),
            _inputField("Password", _passwordController, true,
                const Icon(Icons.remove_red_eye)),
            const SizedBox(
              height: 15,
            ),
            const Text(
              "Forget Password ?",
              style: TextStyle(color: Colors.blue),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: login,
              child: Container(
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(114, 134, 211, 1),
                    borderRadius: BorderRadius.circular(10)),
                height: 50,
                child: const Center(
                    child: Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 17),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
