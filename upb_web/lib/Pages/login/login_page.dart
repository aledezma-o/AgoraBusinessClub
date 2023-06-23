import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:upb_web/static_resources/color_resources.dart';
import 'package:upb_web/static_resources/theme_data.dart';
import 'package:upb_web/Components/upb_scaffold.dart';

import '../home/home_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _showLoginForm = false;

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void _toggleLoginForm() {
    setState(() {
      _showLoginForm = !_showLoginForm;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final laMejorAppPara = Center(
      child: Container(
        margin: EdgeInsets.only(left: 176, right: 176),
        child: Text(
          'La mejor app para contactarnos entre upbinos',
          style: UpbTextStyle.getTextStyle('h1', ColorResourcees.p_Blue, 'b'),
          textAlign: TextAlign.justify,
        ),
      ),
    );
    final iniciarSesion = ElevatedButton(
      onPressed: _toggleLoginForm,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorResourcees.s_Yellow),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
        textStyle: MaterialStateProperty.all(
            UpbTextStyle.getTextStyle('h4', ColorResourcees.s_white, 'b')),
        shadowColor: MaterialStateProperty.all(Colors.black),
      ),
      child: Text('Iniciar sesión'),
    );
    final login1 = Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        laMejorAppPara,
        const SizedBox(height: 64),
        Text(
          'UPB App',
          style: UpbTextStyle.getTextStyle('b1', ColorResourcees.p_Blue, 'n'),
        ),
        const SizedBox(height: 32),
        iniciarSesion,
      ],
    );
    final usuarioYContrasena = Column(children: [
      TextField(
          controller: _emailController,
          decoration: InputDecoration(
              filled: true,
              fillColor: Color.fromRGBO(51, 83, 230, 0.1),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: 'E-mail')),
      const SizedBox(height: 16),
      TextField(
        controller: _passwordController,
        obscureText: true,
        decoration: InputDecoration(
            filled: true,
            fillColor: Color.fromRGBO(51, 83, 230, 0.1),
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            hintText: 'Contraseña'),
      )
    ]);
    final botonEntrar = ElevatedButton(
      onPressed: () {
        String user = _emailController.text;
        String password = _passwordController.text;
        if (user.isNotEmpty && password.isNotEmpty) {
          _isLoading ? null : _submit();
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ColorResourcees.s_Yellow),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        )),
        textStyle: MaterialStateProperty.all(
            UpbTextStyle.getTextStyle('h4', ColorResourcees.s_white, 'b')),
        shadowColor: MaterialStateProperty.all(Colors.black),
      ),
      child:
          _isLoading ? const CircularProgressIndicator() : const Text('Entrar'),
    );
    final login2 =
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Column(children: <Widget>[
        Container(
            margin: const EdgeInsets.only(left: 40, right: 40, bottom: 80),
            child: Column(children: <Widget>[
              Text(
                '¡Hola',
                style: UpbTextStyle.getTextStyle(
                    'h1', ColorResourcees.p_Blue, 'b'),
                textAlign: TextAlign.justify,
              ),
              Text(
                'de nuevo!',
                style: UpbTextStyle.getTextStyle(
                    'h1', ColorResourcees.s_Yellow, 'b'),
                textAlign: TextAlign.justify,
              )
            ])),
        Container(
            width: size.width * 0.65,
            child: Column(children: [
              usuarioYContrasena,
              SizedBox(height: 16),
            ])),
        SizedBox(height: 16),
        botonEntrar,
      ])
    ]);
    return UpbScaffold(
        body: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[!_showLoginForm ? login1 : login2],
    )));
  }

  void _submit() async {
    setState(() {
      _isLoading = true;
    });
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      if (userCredential.user != null) {
        DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user?.uid)
            .get();
        //Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        
        Navigator.pushNamed(context, "/");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('No user found with that email.'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('OK'),
                    )
                  ]);
            });
      } else if (e.code == 'wrong-password') {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                  title: const Text('Error'),
                  content: const Text('Wrong password provided for that user.'),
                  actions: <Widget>[
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('OK'))
                  ]);
            });
      }
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}