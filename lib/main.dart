import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Widget myBottom(
  IconData myIcon,
  String label,
  Color myColor,
) {
  return RaisedButton(
    onPressed: () {},
    padding: EdgeInsets.all(1.0),
    child: Row(
      // <Widget> es el tipo de artículos en la lista.
      children: <Widget>[
        Icon(
          myIcon,
          size: 70,
        ),
        Expanded(
          child: Container(
            child: Text(
              label,
              style: TextStyle(fontSize: 20),
            ),
            padding: EdgeInsets.all(40.0),
            constraints: BoxConstraints.expand(
              height: 100.0,
              width: 200.0,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget myAccount() {
  int option = 0;
  List _pages = [
    ListView(
      padding: const EdgeInsets.all(4),
      children: <Widget>[
        myBottom(
          Icons.account_box,
          'Mis Datos',
          Colors.grey,
        ),
        const SizedBox(height: 10),
        myBottom(
          Icons.library_books_outlined,
          'Mis Estudios',
          Colors.grey,
        ),
        const SizedBox(height: 10),
        myBottom(
          Icons.local_hospital_sharp,
          'Historia Clínica',
          Colors.grey,
        ),
      ],
    ),
    Container(
      padding: const EdgeInsets.all(50),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              Icon(
                Icons.local_hospital,
                color: Colors.blue,
                size: 80.0,
              ),
              Icon(
                Icons.favorite_border,
                color: Colors.blue,
                size: 80.0,
              ),
            ],
          ),
        ],
      ),
    ),
  ];
  return _pages[option];
}

Widget myTurn() {
  return ListView(
    padding: const EdgeInsets.all(4),
    children: <Widget>[
      myBottom(
        Icons.event,
        'Mis Turnos',
        Colors.grey,
      ),
      myBottom(
        Icons.add_box,
        'Nuevo Turno',
        Colors.grey,
      ),
    ],
  );
}

Widget mySearch() {
  return ListView(
    padding: const EdgeInsets.all(4),
    children: <Widget>[
      myBottom(
        Icons.people,
        'Especialista',
        Colors.grey,
      ),
      myBottom(
        Icons.find_in_page,
        'Estudio Médico',
        Colors.grey,
      ),
    ],
  );
}

Widget covidIntro() {
  return Container(
    padding: const EdgeInsets.all(50),
    child: Column(
      children: <Widget>[
        Row(
          children: [
            Icon(
              Icons.local_hospital,
              color: Colors.red,
              size: 80.0,
            ),
            Icon(
              Icons.favorite_border,
              color: Colors.red,
              size: 80.0,
            ),
          ],
        ),
        Text(
          'Con el objetivo de evitar los riesgos asociados a la postergación'
          ' de los cuidados cardiovasculares, el gobierno decidió exceptuar del'
          ' aislamiento social a la atención médica preventiva y de seguimiento'
          ' de enfermedades crónicas',
          softWrap: true,
          style: TextStyle(fontSize: 16),
        ),
      ],
    ),
  );
}

class _MyAppState extends State<MyApp> {
  int _selectedTabIndex = 0;

  _selectedPage(int index) {
    List _pages = [
      covidIntro(),
      mySearch(),
      myTurn(),
      myAccount(),
    ];
    return _pages[index];
  }

  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text("CardioApp"), backgroundColor: Colors.lightGreen),
      body: Center(child: _selectedPage(_selectedTabIndex)),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _changeIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), title: Text("Buscar")),
          BottomNavigationBarItem(
              icon: Icon(Icons.calendar_today), title: Text("Turnos")),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), title: Text("Mi cuenta")),
        ],
      ),
    );
  }
}
