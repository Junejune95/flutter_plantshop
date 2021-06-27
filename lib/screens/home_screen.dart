import 'package:flutter/material.dart';
import 'package:plantshop/models/plant.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  PageController _pageController;
  ScrollController _controller;
  int _selectedPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Transform.translate(
          offset: Offset(20, 0),
          child: ClipOval(
            child: Image.network(
              'https://images.unsplash.com/flagged/photo-1595514191830-3e96a518989b?ixid=MnwxMjA3fDB8MHx0b3BpYy1mZWVkfDh8dG93SlpGc2twR2d8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
              fit: BoxFit.cover,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.menu,
              color: Colors.green[900],
              size: 30,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 50,
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45),
              boxShadow: [
                BoxShadow(
                  color: Colors.green[900].withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 10,
                  offset: Offset(0, 6),
                )
              ],
            ),
            child: TextField(
              cursorColor: Colors.green[900],
              decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(14.0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.green[900],
                  ),
                  hintText: 'Search Plant'),
            ),
          ),
          Container(
            height: 500,
            width: double.infinity,
            child: PageView.builder(
              itemBuilder: (BuildContext context, int index) {
                return __plantSector(index);
              },
              controller: _pageController,
              itemCount: plants.length,
              onPageChanged: (int index) {
                setState(() {
                  _selectedPage = index;
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.green[900]),
                ),
                Container(
                  width: 40,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.green[900].withOpacity(0.2),
                          spreadRadius: 0.4,
                          blurRadius: 10,
                          offset: Offset(0, 6),
                        )
                      ]),
                  child: Icon(Icons.more_horiz),
                )
              ],
            ),
          ),
          
          // ListView.builder(
          //   itemBuilder: (BuildContext context, int index) {
          //     return Container(
          //       child: Text('hello'),
          //     );
          //   },
          //   itemCount: plants.length,
          // )
        ],
      ),
    );
  }

  __plantSector(index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3)).clamp(0.0, 2.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 500.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          Container(
            height: 500,
            margin: EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 30.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.green[900].withOpacity(0.1),
                  spreadRadius: 6,
                  blurRadius: 10,
                  offset: Offset(0, 6),
                )
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Hero(
                  tag: plants[index].imageUrl,
                  child: Center(
                    child: Image(
                      height: 280.0,
                      width: 280.0,
                      image: AssetImage(
                        plants[index].imageUrl,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 30,
                  child: Container(
                    child: Column(
                      children: [
                        Text(
                          plants[index].name,
                          style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '\$' + plants[index].amount.toString(),
                          style: TextStyle(
                            color: Colors.green[900],
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
