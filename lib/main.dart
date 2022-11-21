import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TicTaeToe',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Tic Tae Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final EdgeInsets gap = const EdgeInsets.all(3);
  final List<int> indices = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  final List<String> values = ["", "X", "O"];
  bool turn = false;
  int allFilled = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(values[indices[0]],
                            style: TextStyle(color: Colors.cyanAccent, fontSize: 50)),
                        ),
                        onPressed: () {
                          buttonUpdate(0);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(values[indices[1]],
                              style: TextStyle(color: Colors.cyanAccent, fontSize: 50)),
                        ),
                        onPressed: () {
                          buttonUpdate(1);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(values[indices[2]],
                              style: TextStyle(color: Colors.cyanAccent, fontSize: 50)),
                        ),
                        onPressed: () {
                          buttonUpdate(2);
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(values[indices[3]],
                              style: TextStyle(color: Colors.cyanAccent, fontSize: 50)),
                        ),
                        onPressed: () {
                          buttonUpdate(3);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(values[indices[4]],
                              style: TextStyle(color: Colors.cyanAccent, fontSize: 50)),
                        ),
                        onPressed: () {
                          buttonUpdate(4);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(values[indices[5]],
                              style: TextStyle(color: Colors.cyanAccent, fontSize: 50)),
                        ),
                        onPressed: () {
                          buttonUpdate(5);
                        },
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(values[indices[6]],
                              style: TextStyle(color: Colors.cyanAccent, fontSize: 50)),
                        ),
                        onPressed: () {
                          buttonUpdate(6);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(values[indices[7]],
                              style: TextStyle(color: Colors.cyanAccent, fontSize: 50)),
                        ),
                        onPressed: () {
                          buttonUpdate(7);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(25),
                      child: ElevatedButton(
                        child: Padding(
                          padding: const EdgeInsets.all(50),
                          child: Text(values[indices[8]],
                              style: TextStyle(color: Colors.cyanAccent, fontSize: 50)),
                        ),
                        onPressed: () {
                          buttonUpdate(8);
                        },
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void buttonUpdate(int pos) {
    setState(() {
      if (turn == false && indices[pos] == 0) {
        allFilled++;
        indices[pos] = 1;
        turn = true;
      } else if (turn == true && indices[pos] == 0) {
        allFilled++;
        indices[pos] = 2;
        turn = false;
      }
      _checkWinner();
    });
  }

  void _checkWinner() {
    int winner = 3;
    // Checking rows
    if (indices[0] == indices[1] &&
        indices[0] == indices[2] &&
        indices[0] != 0) {
      winner = indices[1];
    }
    if (indices[3] == indices[4] &&
        indices[3] == indices[5] &&
        indices[3] != 0) {
      winner = indices[3];
    }
    if (indices[6] == indices[7] &&
        indices[6] == indices[8] &&
        indices[6] != 0) {
      winner = indices[6];
    }
    // Checking Column
    if (indices[0] == indices[3] &&
        indices[0] == indices[6] &&
        indices[0] != 0) {
      winner = indices[0];
    }
    if (indices[1] == indices[4] &&
        indices[1] == indices[7] &&
        indices[1] != 0) {
      winner = indices[1];
    }
    if (indices[2] == indices[5] &&
        indices[2] == indices[8] &&
        indices[2] != 0) {
      winner = indices[2];
    }
    // Checking Diagonal
    if (indices[0] == indices[4] &&
        indices[0] == indices[8] &&
        indices[0] != 0) {
      winner = indices[0];
    }
    if (indices[2] == indices[4] &&
        indices[2] == indices[6] &&
        indices[2] != 0) {
      winner = indices[2];
    } else if (allFilled == indices.length) {
      winner = 0;
    }
    returnDialog(winner);
  }

  void returnDialog(int winner) {
    switch (winner) {
      case 0:
        _showDrawDialog();
        break;
      case 1:
        _showWinDialog(winner);
        break;
      case 2:
        _showWinDialog(winner);
        break;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        indices[i] = 0;
      }
      allFilled = 0;
    });
  }
  //Show draw dialog
  void _showDrawDialog() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: const Text("Pareggio!",
            style: TextStyle(color: Colors.red, fontSize: 50)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _clearBoard();
              Navigator.of(ctx).pop();
            },
            child: const Text("Nuova partita"),
          ),
        ],
      ),
    );
  }

  void _showWinDialog(int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        content: Text("Ha vinto il giocatore ${values[index]}!",
            style: TextStyle(color: Colors.green, fontSize: 50)),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              _clearBoard();
              Navigator.of(ctx).pop();
            },
            child: const Text("Nuova partita"),
          ),
        ],
      ),
    );
  }
}