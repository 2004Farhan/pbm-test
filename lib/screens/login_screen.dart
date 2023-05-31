import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) async {
    try {
      // ignore: unused_local_variable
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text,
      );

      // Berhasil login, lanjutkan ke layar lain atau tindakan lainnya
      // misalnya menampilkan pesan sukses atau mengarahkan ke beranda.
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Pengguna dengan email tersebut tidak ditemukan.');
      } else if (e.code == 'wrong-password') {
        print('Password yang dimasukkan salah.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(102, 218, 255, 1.0),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(0.0),
        child: Column(
          children: [
            Container(
              child: Image.network(
                "https://firebasestorage.googleapis.com/v0/b/onvocation-81249.appspot.com/o/Group%201743.png?alt=media&token=64df1d5d-ed4d-4061-929c-57cb15fa06c4&_gl=1*1matcp8*_ga*NTYyMDIyOTE4LjE2ODQxNzY3MzU.*_ga_CW55HF8NVT*MTY4NTU1NDA1OC4yMS4xLjE2ODU1NTQwODcuMC4wLjA.",
                width: 245,
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Color.fromRGBO(20, 0, 92, 1.0), width: 1.0),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(35),
                    topLeft: Radius.circular(35),
                  ),
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Container(),
                        SizedBox(height: 16.0),
                        Container(
                          width: 230,
                          height: 45,
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black, width: 1.0),
                          //   borderRadius: BorderRadius.circular(0.0),
                          // ),
                          child: TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Email',
                              labelStyle: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                              hintText: 'Email Address',
                              hintStyle: TextStyle(fontSize: 12),
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        Container(
                          width: 230,
                          height: 45,
                          // decoration: BoxDecoration(
                          //   border: Border.all(color: Colors.black, width: 1.0),
                          //   borderRadius: BorderRadius.circular(0.0),
                          // ),
                          child: TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Password',
                              labelStyle: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                              hintText: 'Masukkan password',
                              hintStyle: TextStyle(fontSize: 12),
                              prefixIcon: Icon(Icons.password),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                            style: TextStyle(fontSize: 12.0),
                          ),
                        ),
                        SizedBox(height: 16.0),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(200.0, 35.0),
                            primary: Color.fromRGBO(20, 0, 92, 1.0),
                          ),
                          onPressed: () => _login(context),
                          child: Text('Log In'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
