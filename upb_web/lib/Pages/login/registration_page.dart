import 'package:flutter/material.dart';
import 'package:upb_web/Services/authentication_service.dart';
import 'package:upb_web/Static_resources/color_resources.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final _key = GlobalKey<FormState>();

  final AuthenticationService _auth = AuthenticationService();

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailContoller = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(
          left: 200,
          right: 200
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [ColorResourcees.p_Yellow, ColorResourcees.s_Blue],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),),
        child: Center(
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Registrarse',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                            labelText: 'Nombre',
                            labelStyle: TextStyle(
                              color: Colors.white,
                            )),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: _emailContoller,
                        decoration: const InputDecoration(
                            labelText: 'Correo',
                            labelStyle: TextStyle(color: Colors.white)),
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text("Genero",style: TextStyle(
                            color: ColorResourcees.s_white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400
                          )),
                          SizedBox(width: 80),
                          const Text('Hombre',style: TextStyle(
                            color: ColorResourcees.s_white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w200
                          )),
                          Checkbox(
                            value: _genderController.text == 'male',
                            onChanged: ( value) {
                              setState(() {
                                 _genderController.text = 'male';
                              });
                            },
                          ),
                          SizedBox(width: 20),
                          const Text('Mujer',style: TextStyle(
                            color: ColorResourcees.s_white,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w200
                          )),
                          Checkbox(
                            value: _genderController.text == 'female',
                            onChanged: ( value) {
                              setState(() {
                                 _genderController.text = 'female';
                              });
                            },
                          )
                        ]),
                      const SizedBox(height: 5),
                      TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'Contrasena',
                            labelStyle: TextStyle(color: Colors.white)
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          TextButton(
                            onPressed: () {
                              if (_key.currentState!= null) {
                                createUser();
                              }
                            },
                            style:  TextButton.styleFrom(foregroundColor: Colors.white),
                            child: const Text('Sign Up'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style:  TextButton.styleFrom(foregroundColor: Colors.white),
                            child: const Text('Cancel'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void createUser() async {
    dynamic result = await _auth.createNewUser(
        _nameController.text, _emailContoller.text,_genderController.text, _passwordController.text);
    if (result == null) {
      print('Email is not valid');
    } else {
      print(result.toString());
      _nameController.clear();
      _passwordController.clear();
      _emailContoller.clear();
      _genderController.clear();
      Navigator.pop(context);
    }
  }
}