import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      debugShowCheckedModeBanner: false,
      home: MyMenuSilver(),
    );
  }
}

class MyMenuSilver extends StatefulWidget {
  MyMenuSilver({Key key}) : super(key: key);

  @override
  State<MyMenuSilver> createState() => _MyMenuSilverState();
}

class _MyMenuSilverState extends State<MyMenuSilver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color(0xFF000000),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Image.network(
                  'https://img.freepik.com/vector-gratis/plantilla-moderna-cupon-o-vale_23-2147945687.jpg?size=338&ext=jpg'),
            ),
            Card(
              child: ListTile(
                title: Text('Ruta de restaurantes'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('Ruta de Ropa'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ), // Populate the Drawer in the next step.
      ),
      body: MySilverContent(),
    );
  }
}

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.network(
          'https://img.freepik.com/vector-gratis/plantilla-moderna-cupon-o-vale_23-2147945687.jpg?size=338&ext=jpg'),
    );
  }
}

class MySilverContent extends StatefulWidget {
  MySilverContent({Key key}) : super(key: key);

  @override
  _MySilverContentState createState() => _MySilverContentState();
}

class _MySilverContentState extends State<MySilverContent> {
  List<Cupones> _cupones = [
    Cupones("descripcion", "urlimagen", "porcentaje"),
    Cupones("descripcion", "urlimagen", "porcentaje"),
    Cupones("descripcion", "urlimagen", "porcentaje"),
    Cupones("descripcion", "urlimagen", "porcentaje"),
    Cupones("descripcion", "urlimagen", "porcentaje"),
    Cupones("descripcion", "urlimagen", "porcentaje"),
    Cupones("descripcion", "urlimagen", "porcentaje"),
    Cupones("descripcion", "urlimagen", "porcentaje"),
    Cupones("descripcion", "urlimagen", "porcentaje"),
    Cupones("descripcion", "urlimagen", "porcentaje"),
  ];
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      primary: true,
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Color(0xFF000000),
          pinned: _pinned,
          snap: _snap,
          floating: _floating,
          titleTextStyle: TextStyle(fontWeight: FontWeight.bold),
          expandedHeight: 100.0,
          flexibleSpace: const FlexibleSpaceBar(
            title: Text('CuponApp'),
            centerTitle: false,
            titlePadding: EdgeInsetsDirectional.only(
                start: 50, bottom: 17, end: 780, top: 10),
            background: Logo(),

            ///    collapseMode: CollapseMode.pin,
            //  stretchModes: [StretchMode.blurBackground],
          ),
          actions: <Widget>[
            IconButton(
              alignment: Alignment.centerLeft,
              icon: const Icon(Icons.shopping_cart),
              iconSize: 45,
              tooltip: 'Open shopping cart',
              color: Colors.lightBlue,
              onPressed: () {
                // handle the press
              },
            ),
            IconButton(
              alignment: Alignment.centerLeft,
              icon: const Icon(Icons.ad_units),
              iconSize: 45,
              tooltip: 'Open shopping cart',
              color: Colors.lightBlue,
              onPressed: () {
                // handle the press
              },
            ),
          ],
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
            child: Center(
              child: Text('Los numeros representan a los cupones.'),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 211.0,
                    child: Center(
                      child: Column(
                        children: [
                          Image.network(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZZEmj84c5XoAGe17HZIf2fH95s8XWsyHnOc66GuiOjWFNhgDOEYUVT5UCWMbFaDbaV0E&usqp=CAU'),
                          Text(_cupones[index].name)
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: index.isOdd ? Colors.white : Colors.black12,
                    height: 100.0,
                    // transform: Matrix4.rotationZ(0.01),
                    child: Center(
                      child: Text('%$index' + '0', textScaleFactor: 5),
                    ),
                  ),
                ],
              );
            },
            childCount: _cupones.length,
          ),
        ),
      ],
    );
  }
}

class Cupones {
  String name;
  String urlimagen;
  String porcentaje;

  Cupones(name, url, porcentaje) {
    this.name = name;
    this.urlimagen = url;
    this.porcentaje = porcentaje;
  }
}
