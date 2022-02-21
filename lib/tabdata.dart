import 'package:flutter/material.dart';

class Tab1 extends StatefulWidget {
  final String title;
  Tab1({required this.title, Key? key}) : super(key: key);

  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 15),
          ),
        ),
        const cardFood(
            title: 'Afghani Kabab',
            subtitle:
                "Charcol grilled served and oversoft Arabic bread with a side of french"),
        const cardFood(
            title: 'Spiced Meat Balls',
            subtitle:
                "Charcol grilled served and oversoft Arabic bread with a side of french"),
        const cardFood(
            title: 'Oh Sheesh Kabab',
            subtitle:
                "Charcol grilled served and oversoft Arabic bread with a side of french"),
        const cardFood(
            title: 'Spiced Seekh Kabab',
            subtitle:
                "Charcol grilled served and oversoft Arabic bread with a side of french"),
        const cardFood(
            title: 'Afghani Kabab',
            subtitle:
                "Charcol grilled served and oversoft Arabic bread with a side of french"),
        const cardFood(
            title: 'Afghani Kabab',
            subtitle:
                "Charcol grilled served and oversoft Arabic bread with a side of french"),
        const cardFood(
            title: 'Afghani Kabab',
            subtitle:
                "Charcol grilled served and oversoft Arabic bread with a side of french"),
        const cardFood(
            title: 'Afghani Kabab',
            subtitle:
                "Charcol grilled served and oversoft Arabic bread with a side of french"),
      ],
    );
  }
}

class cardFood extends StatelessWidget {
  final String title;
  final String subtitle;
  const cardFood({
    required this.title,
    required this.subtitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            // const Text('Statrtes'),
            ListTile(
              horizontalTitleGap: 0,
              title: Align(
                child: Text(title),
                alignment: Alignment(-1.2, 0),
              ),
              subtitle: Align(
                alignment: Alignment(-1.2, 0),
                child: Text(
                  subtitle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              trailing: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset('assets/biryani.jpg'),
              ),
            ),
            const Text('AED 35.00'),
            const Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
