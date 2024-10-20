import 'package:flutter/material.dart';
import 'app_bar_custom.dart';
import 'map_view.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const MapView(),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBarCustom(onMenuPressed: _toggleContainer),
          ),
          if (showContainer)
            const Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: MenuPrincipal(),
            ),
        ],
      ),
    );
  }

  void _toggleContainer() {
    setState(() {
      showContainer = !showContainer;
    });
  }
}

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height / 2,
        color: const Color.fromARGB(255, 27, 27, 27).withOpacity(0.7),
        child: Row(
          children: <Widget>[
            Expanded(
              child: Align(
                alignment: Alignment.topRight,
                child: _crearBoton(),
              ),
            )
          ],
        ));
  }

  SizedBox _crearBoton() {
    return SizedBox(
      width: 130,
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(top: 10, right: 10),
        child: ElevatedButton(
          style: ButtonStyle(
            foregroundColor: const WidgetStatePropertyAll(Colors.white),
            backgroundColor:
                WidgetStateProperty.all<Color>(Colors.black54.withOpacity(0.3)),
            shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0))),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('lib/icon/tradiciones_icon.png',
                  height: 25, width: 25
                  ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Tradiciones",
                      textScaler: TextScaler.linear(0.97),
                    )),
              ),
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}