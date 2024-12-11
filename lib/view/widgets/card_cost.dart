part of 'widgets.dart';

class CardCost extends StatelessWidget {
  final Costs cost;
  const CardCost(this.cost, {super.key});

  String rupiahMoneyFormatter(int? value) {
    if (value == null) return "Rp0,00";
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp',
      decimalDigits: 2,
    );
    return formatter.format(value);
  }

  @override
  Widget build(BuildContext context) {
    Costs cost = this.cost;
    Cost firstCost = cost.cost?.isNotEmpty ?? false ? cost.cost![0] : Cost();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 5,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 45, 138, 237),
              Color.fromARGB(255, 45, 138, 237)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, 
          crossAxisAlignment: CrossAxisAlignment.center, 
          children: [
            Row(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    "${cost.description} (${cost.service})",
                    textAlign:
                        TextAlign.center, 
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Divider(color: Colors.white70, thickness: 1),
            const SizedBox(height: 8),
            Text(
              "Cost: ${rupiahMoneyFormatter(firstCost.value)}",
              textAlign: TextAlign.center, // Center the text
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              "Estimated Arrival: ${firstCost.etd}",
              textAlign: TextAlign.center, // Center the text
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
