
import 'package:ams/src/pages/view/audit_object_page.dart';
import 'package:ams/src/services/controller/object_controller.dart';
import 'package:ams/src/services/repository/api_client.dart';
import 'package:ams/src/services/repository/repo_service.dart';
import 'package:ams/src/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.lazyPut(() => ApIClient(appBaseUrl: BASE_URL));
 Get.lazyPut(() => Services(apIClient: Get.find()));
Get.lazyPut(() => ObjectController(serviceRepo: Get.find()));
Get.find<ObjectController>().getList(object_path);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Side Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentPageIndex = 0;
  final PageController _pageController = PageController();
  bool _isMenuOpen = false;

  @override
  Widget build(BuildContext context) {
    //MediaQuery.of(context).size.width < 600?_isMenuOpen=false:_isMenuOpen=true;
    return Scaffold(
      appBar: AppBar(
        title: const Text('AMS'),
        actions: const <Widget>[
        ],
      ),
      drawer: MediaQuery.of(context).size.width < 600
          ?
      buildDrawer()
          : null,
      body: Row(
        children: <Widget>[
          if (MediaQuery.of(context).size.width >= 600 && !_isMenuOpen)
            Container(
              width: 300,
              child: buildDrawer(),
            ),
          Expanded(
            flex: 3,
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: <Widget>[
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   if (MediaQuery.of(context).size.width >= 600)
                     Row(
                       children: [
                         IconButton(
                           icon: Icon(!_isMenuOpen?Icons.arrow_back:Icons.arrow_forward),
                           onPressed: () {
                             setState(() {
                               _isMenuOpen = !_isMenuOpen;
                             });
                           },
                         ),
                         Container(child: Text('/home'),)
                       ],
                     ),
                   Expanded(child: AuditObjectList()),
                 ],
               ),
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text('Submenu 1 Content'),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Submenu 2 Content'),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  child: Center(
                    child: Text('Submenu Item 3 Content'),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  child: Center(
                    child: Text('Submenu Item 4 Content'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Drawer buildDrawer() {
    return Drawer(

              child:

              ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.dashboard),
                    title: Text('Home'),
                    onTap: () {
                      _pageController.animateToPage(0,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
                    },
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.folder),
                    title: Text('Annual Plan'),
                    children: <Widget>[
                      ListTile(
                        title: Text('Submenu Item 1'),
                        onTap: () {
                          _pageController.animateToPage(1,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                      ),
                      ListTile(
                        title: Text('Submenu Item 2'),
                        onTap: () {
                          _pageController.animateToPage(2,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                      ),
                    ],
                  ),
                  ExpansionTile(
                    leading: Icon(Icons.folder),
                    title: Text('Submenu 2'),
                    children: <Widget>[
                      ListTile(
                        title: Text('Submenu Item 3'),
                        onTap: () {
                          _pageController.animateToPage(3,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                      ),
                      ListTile(
                        title: Text('Submenu Item 4'),
                        onTap: () {
                          _pageController.animateToPage(4,
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
  }
}
