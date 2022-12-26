import 'package:flutter/material.dart';
import 'package:scratcher/widgets.dart';

void main() {
  runApp(const ScratchPage());
}

class ScratchPage extends StatefulWidget {
  const ScratchPage({super.key});
  @override
  State<ScratchPage> createState() => _ScratchPageState();
}

class _ScratchPageState extends State<ScratchPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Scratch and Win"),
          backgroundColor: Colors.red,
        ),
        body: Container(
            padding: const EdgeInsets.all(12.0),
            child: GridView.builder(
              itemCount: 9,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 1.0,
                  mainAxisSpacing: 1.0),
              itemBuilder: (BuildContext context, int index) {
                return showScratchCard(context);
                // return Card(
                //     color: Colors.orange,
                //     child: Center(
                //       child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.center,
                //           children: const <Widget>[
                //             Expanded(
                //                 child: Icon(Icons.arrow_back,
                //                     size: 50.0, color: Colors.black)),
                //             Text("You won "),
                //           ]),
                //     ));
              },
            )),
      ),
    );
  }

  showScratchCard(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Scratcher(
        brushSize: 100,
        threshold: 50,
        color: Colors.blue,
        onChange: (value) => print("Scratch progress: $value%"),
        onThreshold: () => print("Threshold reached"),
        child: Container(
          height: 150,
          width: 150,
          // height: MediaQuery.of(context).size.height * 0.32,
          // width: MediaQuery.of(context).size.width * 0.5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              SizedBox(
                // height: MediaQuery.of(context).size.height * 0.18,
                // width: MediaQuery.of(context).size.width * 0.5,
                height: 250,
                width: 25,
                // child: Image.asset(
                //   "assets/cele.png",
                // ),
                child: Text("hello"),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "You\'ve won",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 24,
                      letterSpacing: 1,
                      color: Colors.blue),
                ),
              ),
              Text(
                "\$10",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
