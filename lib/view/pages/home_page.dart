part of 'pages.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeViewModel homeViewModel = HomeViewModel();

  @override
  void initState() {
    homeViewModel.getProvinceList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 95, 95, 95),
        elevation: 2,
        title: const Text(
          "Province",
          style: TextStyle(
            color: Colors.cyan,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true, // Ensures the title is centered
      ),
      body: Container(
        color: Colors.white,
        child: ChangeNotifierProvider<HomeViewModel>(
          create: (context) => homeViewModel,
          child: Consumer<HomeViewModel>(builder: (context, value, _) {
            switch (value.provinceList.status) {
              case Status.loading:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SpinKitWave(color: Color.fromARGB(255, 45, 138, 237)),
                      SizedBox(height: 16),
                      Text(
                        "Loading",
                        style: TextStyle(
                          color:  Color.fromARGB(255, 45, 138, 237),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              case Status.error:
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error_outline,
                          size: 48, color: Colors.redAccent),
                      SizedBox(height: 16),
                      Text(
                        value.provinceList.message.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.redAccent,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                );
              case Status.completed:
                return ListView.builder(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  itemCount: value.provinceList.data?.length,
                  itemBuilder: (context, index) {
                    return CardProvince(
                        value.provinceList.data!.elementAt(index));
                  },
                );
              default:
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
