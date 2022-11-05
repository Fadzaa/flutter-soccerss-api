import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin{

  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Icon(Icons.phone_outlined)),
    Tab(icon: Icon(Icons.account_circle_outlined)),
    Tab(icon: Icon(Icons.message_outlined),)
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex =_controller.index;
      });
      print("Selected Index: "+ _controller.index.toString());
    });

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
              onTap: (index) {

              },
              controller: _controller,
              tabs: list),
          title: Text("Tabs Demo"),
        ),
        body: TabBarView(
          controller: _controller,
            children: [
              Center(
                child: Text(_selectedIndex.toString(), style: TextStyle(fontSize: 40),),
              ),
              Center(
                child: Text(_selectedIndex.toString(), style: TextStyle(fontSize: 40),),
              ),
              Center(
                child: Text(_selectedIndex.toString(), style: TextStyle(fontSize: 40),),
              ),
          ],
        ),
      ),
    );
  }
}
