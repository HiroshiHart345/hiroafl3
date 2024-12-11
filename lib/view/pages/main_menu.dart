part of 'pages.dart';

class MainMenuPage extends StatefulWidget {
  const MainMenuPage({super.key});

  @override
  State<MainMenuPage> createState() => _MainMenuPageState();
}

class _MainMenuPageState extends State<MainMenuPage> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[HomePage(), CostPage()];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _selectedIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DoubleBack(
        child: _pages[_selectedIndex],
        waitForSecondBackPress: 4,
        onFirstBackPress: () {
          return Fluttertoast.showToast(
            msg: "Press back to close the app!",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Color.fromARGB(255, 45, 138, 237),
            textColor: Colors.white,
            fontSize: 14,
          );
        },
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: const Color.fromARGB(255, 95, 95, 95), 
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              spreadRadius: 5,
              blurRadius: 15,
              offset: Offset(0, 0),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent, 
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor:
              Colors.cyan, 
          elevation: 0, 
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_work, size: 20), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate_rounded, size: 20), label: "Calculate"),
          ],
        ),
      ),
    );
  }
}
