import 'package:flutter/material.dart';

class FavBooks extends StatefulWidget {
  const FavBooks({Key? key}) : super(key: key);

  @override
  State<FavBooks> createState() => _FavBooksState();
}

List<String> tabImages = [
  "assets/images/pic-3.png",
  "assets/images/pic-2.png",
  "assets/images/pic-4.png",
  "assets/images/pic-5.png",
  "assets/images/pic-2.png",
  "assets/images/pic-6.png",
  "assets/images/pic-7.png",
  "assets/images/pic-1.png",
  "assets/images/pic-4.png",
];
var arrname = ['Book1', 'Book2', 'Book3'];

class _FavBooksState extends State<FavBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Favorites"),
        centerTitle: true,
      ),
      body: Container(
        color: Color.fromARGB(255, 253, 255, 255),
        child: ListView.builder(
          itemCount: arrname.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailAudioPage(
                      title: "Book Title $index",
                      subtitle: "Author Name $index",
                      image: tabImages[index],
                    ),
                  ),
                );
              },
              child: ListTile(
                leading: Image.asset(
                  tabImages[index],
                  width: 40, // Adjust the width as needed
                  height: 100, // Adjust the height as needed
                ),
                title: Text(
                  arrname[index],
                  style: TextStyle(
                    color: const Color.fromARGB(255, 244, 10, 10),
                    fontSize: 24,
                  ),
                ),
                subtitle: Text(
                  'Author',
                  style: TextStyle(
                    color: Color.fromARGB(255, 123, 87, 74),
                    fontSize: 15,
                  ),
                ),
                trailing: OutlinedButton(
                  child: Icon(Icons.book),
                  onPressed: () {
                    print(arrname[index]);
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class DetailAudioPage extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  DetailAudioPage(
      {required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 120,
            height: 200,
          ),
          SizedBox(height: 20),
          Text(
            subtitle,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
