import 'package:flutter/material.dart';

class UpbAppBar extends StatefulWidget  implements PreferredSizeWidget {
  final String title;

  UpbAppBar({required this.title});

  @override
  _UpbAppBarState createState() => _UpbAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 45, 79, 143),
          borderRadius: BorderRadius.circular(36),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 30,
              color: Colors.black.withOpacity(0.16),
            ),
          ]),
      child: Row(children: <Widget>[
        const SizedBox(width: 10),
            InkWell(
          onTap: () {
            Navigator.pushNamed(context, "/");
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              children: const [
                Text(
                  "UPB",
                  style: TextStyle(
                      color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "WEB",
                  style: TextStyle(
                      color: Color.fromARGB(255, 230, 201, 38),
                      fontSize: 15,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ),
        ),
        const Spacer(),
        //const UpbAppBarItem("Eventos", "/events"),
        const UpbAppBarItem("Programas", "/programs"),
        const UpbAppBarItem("Noticias", "/news"),
        const UpbAppBarItem("Convenios", "/member-agreements"),
        //const UpbAppBarItem("About Us", "/about-us"),
        // PREGUNTAR SI EL USUARIO ADMIN ESTA LOGEADO PARA DESPLEGAR LA SIGUIENTE OPCION
        // const UpbAppBarItem("Management", "/management-content"),
      ]),
    );
  }
}

class _UpbAppBarState extends State<UpbAppBar> {
  bool isLoggedIn = false; // replace this with your own login state

  @override
  Widget build(BuildContext context) {
    return isLoggedIn ? Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 45, 79, 143),
                borderRadius: BorderRadius.circular(36),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -2),
                    blurRadius: 30,
                    color: Colors.black.withOpacity(0.16),
                  ),
                ]),
            child: Row(children: <Widget>[
              const SizedBox(width: 10),
                  InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: const [
                      Text(
                        "UPB",
                        style: TextStyle(
                            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "WEB",
                        style: TextStyle(
                            color: Color.fromARGB(255, 230, 201, 38),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ),
              ),
              const Spacer(),
              const UpbAppBarItem("Programas", "/programs"),
              const UpbAppBarItem("Noticias", "/news"),
              const UpbAppBarItem("Convenios", "/member-agreements"),
              //const UpbAppBarItem("About Us", "/about-us"),
              // PREGUNTAR SI EL USUARIO ADMIN ESTA LOGEADO PARA DESPLEGAR LA SIGUIENTE OPCION
              const UpbAppBarItem("Management", "/management-content"),
            ]),
          )
          : Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 45, 79, 143),
                borderRadius: BorderRadius.circular(36),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, -2),
                    blurRadius: 30,
                    color: Colors.black.withOpacity(0.16),
                  ),
                ]),
            child: Row(children: <Widget>[
              const SizedBox(width: 10),
                  InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "/");
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: const [
                      Text(
                        "UPB",
                        style: TextStyle(
                            color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "WEB",
                        style: TextStyle(
                            color: Color.fromARGB(255, 230, 201, 38),
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ),
              ),
              const Spacer(),
              const UpbAppBarItem("Programas", "/programs"),
              const UpbAppBarItem("Noticias", "/news"),
              const UpbAppBarItem("Alianzas", "/member-agreements"),
              //const UpbAppBarItem("Login", "/login"),
              const UpbAppBarItem("Conócenos", "/about-us"),
              // PREGUNTAR SI EL USUARIO ADMIN ESTA LOGEADO PARA DESPLEGAR LA SIGUIENTE OPCION
              // const UpbAppBarItem("Management", "/management-content"),
            ]),
          );
  }
}

class UpbAppBarItem extends StatelessWidget {
  final String _title;
  final String _route;

  const UpbAppBarItem(this._title, this._route);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, _route);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(_title,
            style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold)),
      ),
    );
  }
}
