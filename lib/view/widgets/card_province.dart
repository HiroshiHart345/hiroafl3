part of 'widgets.dart';

class CardProvince extends StatelessWidget {
  final Province province;
  const CardProvince(this.province, {super.key});

  @override
  Widget build(BuildContext context) {
    Province prov = province;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 45, 138, 237), Color.fromARGB(255, 45, 138, 237)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center( // Centers the ListTile vertically and horizontally inside the container
          child: ListTile(
            contentPadding: const EdgeInsets.all(16),
            title: Text(
              prov.province.toString(),
              textAlign: TextAlign.center, // Center the title text
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
            subtitle: Text(
              "Province ID: ${prov.provinceId}",
              textAlign: TextAlign.center, // Center the subtitle text
              style: const TextStyle(
                color: Colors.white70,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
