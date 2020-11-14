import 'package:flutter/material.dart';

import 'package:workshop_formation/src/models/models.dart';
import 'package:workshop_formation/src/widgets/widgets.dart';

// ------------------
// UnknowScreen
// ------------------
class UnknownScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('404!'),
      ),
    );
  }
}

// ------------------
// SCREEN 1
// ------------------
class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecran N°1'),
      ),
      //RESOLUTION: Remplacer le body par une liste simple en conservant la navigation
      body: ListView.builder(
        padding: EdgeInsets.all(8.0),
        itemExtent: 20.0,
        itemBuilder: (BuildContext context, int i) {
          return ListItem(
            index: i + 1,
            onTapCallback: () {
              Navigator.pushNamed(
                context,
                '/second',
                arguments: ScreenArguments('item', "${i + 1}"),
              );
            },
          );
        },
      ),
    );
  }
}

// ------------------
// SCREEN 2
// ------------------
class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //RESOLUTION: Comment récuperer l'argument dans l'écran ?
    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecran N°2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //RESOLUTION: afficher le title de l'argument
            Text('Arg title is ${args.title}'),
            //RESOLUTION: afficher le message de l'argument
            Text('Arg message is ${args.message}'),
            ElevatedButton(
              //RESOLUTION: Implémenter la navigation retour
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('via le pop : retour à l\'écran précédent'),
            ),
          ],
        ),
      ),
    );
  }
}