import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main(){
  debugPaintSizeEnabled = true; // Remove to suppress visual layout
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  var images = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Expanded(
        child: Image.asset('images/pic1.jpg'),
      ),
      Expanded(
        flex: 2,
        child: Image.asset('images/pic2.jpg'),
      ),
      Expanded(
        child: Image.asset('images/pic3.jpg'),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Layout demo',
        home: Scaffold(
          appBar: AppBar(
            title: Text('Layout Demo'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //images,
                //rating,
                //detail,
                //box
                new Expanded(child: _buildGrid()),
                new Expanded(child: _buildList())
              ],
            ),
          ),
        )
    );
  }

  static final stars = Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(Icons.star, color: Colors.green),
      Icon(Icons.star, color: Colors.green),
      Icon(Icons.star, color: Colors.green),
      Icon(Icons.star, color: Colors.black),
      Icon(Icons.star, color: Colors.black),
    ],
  );

  var rating = Container(
    padding: EdgeInsets.all(20),
    child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          stars,
          Text(
            '170 Review',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontFamily: 'Roboto',
              letterSpacing: 0.5,
              fontSize: 20,
            ),
          )
        ]
    ),
  );

  static final descTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.w800,
    fontFamily: 'Roboto',
    letterSpacing: 0.5,
    fontSize: 18,
    height: 2,
  );

  var detail = DefaultTextStyle.merge(
      style: descTextStyle,
      child: Container(
          padding: EdgeInsets.all(20),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.kitchen, color: Colors.amber),
                      Text('PREP: '),
                      Text('25 min')
                    ]
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.timer, color: Colors.amber),
                      Text('COOK: '),
                      Text('1 hour'),
                    ]
                ),
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.restaurant, color: Colors.amber),
                      Text('FEED: '),
                      Text('4-6'),
                    ]
                )
              ]
          )
      )
  );

  var box = Container(
    decoration: BoxDecoration(
      color: Colors.black26,
    ),
    child: Column(
        children: [
          _buildImageRow(1),
          _buildImageRow(3),
        ]
    ),
  );

  static Widget _buildDecoratedImage(int imageIndex) =>
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 10, color: Colors.black38),
            borderRadius: const BorderRadius.all(const Radius.circular(8)),
          ),
          margin: const EdgeInsets.all(4),
          child: Image.asset('images/pic$imageIndex.jpg'),
        ),
      );

  static Widget _buildImageRow(int imageIndex) =>
      Row(
        children: [
          _buildDecoratedImage(imageIndex),
          _buildDecoratedImage(imageIndex + 1),
        ],
      );

// #docregion grid
  Widget _buildGrid() =>
      GridView.extent(
          maxCrossAxisExtent: 150,
          padding: const EdgeInsets.all(4),
          mainAxisSpacing: 4,
          crossAxisSpacing: 4,
          children: _buildGridTileList(30));

  // The images are saved with names pic0.jpg, pic1.jpg...pic29.jpg.
  // The List.generate() constructor allows an easy way to create
  // a list when objects have a predictable naming pattern.
  List<Container> _buildGridTileList(int count) =>
      List.generate(
          count, (i) => Container(child: Image.asset('images/pic$i.jpg')));
// #enddocregion grid

  Widget _buildList() => ListView(
    children: [
      _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
      _tile('The Castro Theater', '429 Castro St', Icons.theaters),
      _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
      _tile('Roxie Theater', '3117 16th St', Icons.theaters),
      _tile('United Artists Stonestown Twin', '501 Buckingham Way',
          Icons.theaters),
      _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
      Divider(),
      _tile('K\'s Kitchen', '757 Monterey Blvd', Icons.restaurant),
      _tile('Emmy\'s Restaurant', '1923 Ocean Ave', Icons.restaurant),
      _tile(
          'Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.restaurant),
      _tile('La Ciccia', '291 30th St', Icons.restaurant),
    ],
  );

  ListTile _tile(String title, String subtitle, IconData icon) => ListTile(
    title: Text(title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        )),
    subtitle: Text(subtitle),
    leading: Icon(
      icon,
      color: Colors.blue[500],
    ),
  );
}