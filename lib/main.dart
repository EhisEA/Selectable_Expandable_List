import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// ==================================================
// ==================================================
// ==================================================
// ==================================================
// ==================================================
class Product {
  final String id, name;
  final double price;

  Product({this.id, this.name, this.price});
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> productList = [
    Product(
      name: "Full Blood Count FBCI",
      id: "1",
      price: 8000,
    ),
    Product(
      name: "Full  FBCI",
      id: "2",
      price: 400,
    ),
    Product(
      name: " Count ",
      id: "3",
      price: 90000,
    ),
    Product(
      name: " Blood Count ",
      id: "4",
      price: 12000,
    ),
  ];

  List selected = [];
  List<Product> productList1 = [
    Product(
      name: "Full Blood Count FBCI",
      id: "1",
      price: 8000,
    ),
    Product(
      name: "Full  FBCI",
      id: "2",
      price: 400,
    ),
    Product(
      name: " Count ",
      id: "3",
      price: 90000,
    ),
    Product(
      name: " Blood Count ",
      id: "4",
      price: 12000,
    ),
  ];

  List selected1 = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //============ here i am adding the id to selected
            MyExpandableList(
              items: List.generate(
                productList.length,
                (index) => ListItem(
                  product: productList[index],
                  selected: selected.indexOf(productList[index].id) != -1,
                  onTap: () {
                    if (!selected.remove(productList[index].id)) {
                      selected.add(productList[index].id);
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
            //============ here i am adding the index to selected
            MyExpandableList(
              items: List.generate(
                productList1.length,
                (index) => ListItem(
                  product: productList1[index],
                  selected: selected1.indexOf(index) != -1,
                  onTap: () {
                    if (!selected1.remove(index)) {
                      selected1.add(index);
                    }
                    setState(() {});
                  },
                ),
              ),
            ),
            // Gi(),
            // Gi(),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

// ==================================================
// ==================================================
// ==================================================
// ==================================================
// ==================================================
class MyExpandableList extends StatefulWidget {
  final List<Widget> items;
  final List<int> selected;

  const MyExpandableList({Key key, this.items, this.selected})
      : super(key: key);
  @override
  _MyExpandableListState createState() => _MyExpandableListState();
}

class _MyExpandableListState extends State<MyExpandableList> {
  List inds = [];
  bool _expand = false;

  void _toggleExpand() {
    setState(() {
      _expand = !_expand;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedContainer(
        color: Colors.grey.shade200,
        duration: Duration(seconds: 3),
        curve: Curves.ease,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: _expand ? Colors.white : Colors.white.withOpacity(0.4),
                  child: ListTile(
                    onTap: _toggleExpand,
                    title: Text("Sexual Wellness test"),
                    trailing: Icon(
                      _expand ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                      color: Colors.black,
                      size: 50,
                    ),
                  ),
                ),
              ),
              AnimatedContainer(
                curve: Curves.easeIn,
                padding: EdgeInsets.symmetric(horizontal: 10),
                duration: Duration(milliseconds: 700),
                child: _expand
                    ? Column(
                        children: widget.items,
                      )
                    : SizedBox(
                        height: 10,
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ==================================================
// ==================================================
// ==================================================
// ==================================================
// ==================================================
class ListItem extends StatelessWidget {
  final bool selected;
  final Function onTap;
  final Product product;

  const ListItem({
    Key key,
    this.selected = false,
    @required this.onTap,
    @required this.product,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          border: Border.all(
              width: 2, color: selected ? Colors.green : Colors.transparent),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10,
            ),
          ]),
      // color: Colors.white.withOpacity(0.4),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ListTile(
          title: Text(product.name),
          subtitle: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              "N${product.price}",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Colors.green,
              ),
            ),
          ),
          trailing: RaisedButton(
            color: selected ? Colors.green : Colors.green.shade100,
            onPressed: onTap,
            child: Text(
              selected ? "REMOVE" : "ADD",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: selected ? Colors.white : Colors.green,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
