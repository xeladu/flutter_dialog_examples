import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dialog Examples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _simpleDialogResult = "";
  String _alertDialogResult = "";
  String _cupertinoAlertDialogResult = "";
  String _dialogResult = "";
  String _overlayResult = "";
  String _toastResult = "";

  final TextStyle _defaultTextStyle = const TextStyle(
      decoration: TextDecoration.none,
      color: Colors.white,
      fontSize: 14,
      fontFamily: "Roboto",
      fontVariations: [],
      fontStyle: FontStyle.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () async {
                          var res = await _showAlertDialog();
                          setState(() {
                            _alertDialogResult =
                                "You clicked \"${res ? "Yes, it's great!" : "No, not really"}\"";
                          });
                        },
                        child: const Text("Alert dialog example"))),
                const SizedBox(width: 10),
                SizedBox(
                    width: 300,
                    child: Text(_alertDialogResult, style: _defaultTextStyle))
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () async {
                          var res = await _showCupertinoAlertDialog();
                          setState(() {
                            _cupertinoAlertDialogResult =
                                "You clicked \"${res ? "Yes, it's great!" : "No, not really"}\"";
                          });
                        },
                        child: const Text("Cupertino alert dialog example"))),
                const SizedBox(width: 10),
                SizedBox(
                    width: 300,
                    child: Text(_cupertinoAlertDialogResult,
                        style: _defaultTextStyle))
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () async {
                          var res = await _showSimpleDialog();
                          setState(() {
                            _simpleDialogResult =
                                "You clicked \"${res ? "Yes, it's great!" : "No, not really"}\"";
                          });
                        },
                        child: const Text("Simple dialog example"))),
                const SizedBox(width: 10),
                SizedBox(
                    width: 300,
                    child: Text(_simpleDialogResult, style: _defaultTextStyle))
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: () async {
                          var res = await _showDialog();
                          setState(() {
                            _dialogResult =
                                "You clicked \"${res ? "Yes, it's great!" : "No, not really"}\"";
                          });
                        },
                        child: const Text("Dialog example"))),
                const SizedBox(width: 10),
                SizedBox(
                    width: 300,
                    child: Text(_dialogResult, style: _defaultTextStyle))
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: _showOverlay,
                        child: const Text("Overlay example"))),
                const SizedBox(width: 10),
                SizedBox(
                    width: 300,
                    child: Text(_overlayResult, style: _defaultTextStyle))
              ]),
              const SizedBox(height: 10),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                SizedBox(
                    width: 300,
                    child: ElevatedButton(
                        onPressed: _showToast,
                        child: const Text("Toast example"))),
                const SizedBox(width: 10),
                SizedBox(
                    width: 300,
                    child: Text(_toastResult, style: _defaultTextStyle))
              ])
            ]));
  }

  Future<bool> _showAlertDialog() async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) => AlertDialog(
                icon: const CircleAvatar(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  child: Icon(Icons.check),
                ),
                title: const Text("My alert dialog"),
                content: const SizedBox(
                    height: 150,
                    child: Text("This is an alert dialog.\nDo you like it?")),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("No, not really!")),
                  ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text("Yes, it's great!"))
                ])));
  }

  Future<bool> _showCupertinoAlertDialog() async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) => CupertinoAlertDialog(
                title: const Text("My alert dialog"),
                content: const SizedBox(
                    height: 150,
                    child: Text(
                        "This is a cupertino alert dialog.\nDo you like it?")),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      child: const Text("No, not really!")),
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      child: const Text("Yes, it's great!"))
                ])));
  }

  Future<bool> _showSimpleDialog() async {
    return await showDialog(
        barrierDismissible: false,
        context: context,
        builder: ((context) => SimpleDialog(
                title: const Center(child: Text("My simple dialog")),
                contentPadding: const EdgeInsets.all(8),
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                    child: Icon(Icons.check),
                  ),
                  const SizedBox(
                      height: 150,
                      child: Text("This is a simple dialog.\nDo you like it?")),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("No, not really!")),
                    ElevatedButton(
                        onPressed: () => Navigator.of(context).pop(true),
                        child: const Text("Yes, it's great!"))
                  ])
                ])));
  }

  void _showOverlay() {
    OverlayEntry? overlayEntry;

    var topWidget = Container(
        color: Colors.grey,
        height: 400,
        width: 300,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const CircleAvatar(
            backgroundColor: Colors.green,
            foregroundColor: Colors.white,
            child: Icon(Icons.check),
          ),
          SizedBox(
              height: 150,
              child: Text("This is an overlay.\nDo you like it?",
                  style: _defaultTextStyle)),
          const SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            TextButton(
                onPressed: () {
                  overlayEntry?.remove();
                  setState(() {
                    _overlayResult = "You clicked \"No, not really\"";
                  });
                },
                child: const Text("No, not really!")),
            ElevatedButton(
                onPressed: () {
                  overlayEntry?.remove();
                  setState(() {
                    _overlayResult = "You clicked \"Yes, it's great!\"";
                  });
                },
                child: const Text("Yes, it's great!"))
          ])
        ]));

    overlayEntry = OverlayEntry(builder: (context) => topWidget);
    Overlay.of(context)!.insert(overlayEntry);
  }

  void _showToast() {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.grey,
        behavior: SnackBarBehavior.floating,
        dismissDirection: DismissDirection.horizontal,
        duration: const Duration(seconds: 3),
        onVisible: () {
          setState(() {
            _toastResult = "Toast is visible!";
          });
        },
        padding: const EdgeInsets.all(16),
        content: Row(children: [
          Text("This is a toast.\nDo you like it?", style: _defaultTextStyle),
          const Spacer(),
          TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                setState(() {
                  _toastResult = "You clicked \"No, not really\"";
                });
              },
              child: const Text("No, not really!")),
          ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).hideCurrentSnackBar();
                setState(() {
                  _toastResult = "You clicked \"Yes, it's great!\"";
                });
              },
              child: const Text("Yes, it's great!"))
        ])));
  }

  Future<bool> _showDialog() async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Dialog(
                child: Container(
              color: Colors.grey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.check),
                    ),
                    SizedBox(
                        height: 150,
                        child: Text("This is a dialog.\nDo you like it?",
                            style: _defaultTextStyle)),
                    const SizedBox(height: 10),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(false);
                          },
                          child: const Text("No, not really!")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: const Text("Yes, it's great!"))
                    ])
                  ]),
            )));
  }
}
