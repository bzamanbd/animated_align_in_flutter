import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  final String title;
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool chng = false;
  bool isVisible = false;
  bool bgcolor = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Stack(
          children: [
            InkWell(
              onTap: () => setState(() {
                chng = !chng;
              }),
              child: SizedBox(
                height: size.height,
                width: size.width,
                child: Container(
                  color: bgcolor ? Colors.black : Colors.grey,
                ),
              ),
            ),
            AnimatedAlign(
              onEnd: () => setState(() {
                isVisible = !isVisible;
                bgcolor = !bgcolor;
              }),
              alignment: chng ? Alignment.topCenter : Alignment.bottomCenter,
              duration: const Duration(seconds: 2),
              child: SizedBox(
                height: size.height / 30,
                child: Container(
                  color: Colors.green,
                ),
              ),
            ),
            Visibility(
              visible: isVisible ? true : false,
              child: const Center(
                child: Text(
                  'Welcome',
                  textScaleFactor: 2.5,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ));
  }
}
