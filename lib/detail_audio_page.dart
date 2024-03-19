import 'package:flutter/material.dart';
import 'package:flutter_application_1/audio_file.dart';
import 'package:flutter_application_1/widgets/app_colors.dart';
import 'package:audioplayers/audioplayers.dart';

class DetailAudioPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;

  const DetailAudioPage(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.image})
      : super(key: key);

  @override
  State<DetailAudioPage> createState() => _DetailAudioPageState();
}

class _DetailAudioPageState extends State<DetailAudioPage> {
  AudioPlayer advancePlayer = AudioPlayer();
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
  @override
  void initState() {
    super.initState();
    advancePlayer = AudioPlayer();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: audioBluishBackground,
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              height: screenHeight / 3,
              child: Container(
                  decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/pic-9.png"),
                    fit: BoxFit.cover),
                // color: audioBlueBackground,
              ))),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {},
                ),
              ],
              backgroundColor: Colors.transparent,
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              top: screenHeight * 0.2,
              height: screenHeight * 0.36,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(40)),
                child: Column(
                  children: [
                    SizedBox(
                      height: screenHeight * 0.1,
                    ),
                    Text(
                      widget.title,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Avenir"),
                    ),
                    Text(
                      widget.subtitle,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    AudioFile(advancePlayer: advancePlayer),
                  ],
                ),
              )),
          Positioned(
            top: screenHeight * 0.12,
            left: screenWidth * 0.5 - 75,
            right: screenWidth * 0.5 - 75,
            height: screenHeight * 0.16,
            child: Container(
              decoration: BoxDecoration(
                  color: audioGreyBackground,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white, width: 2)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 5),
                    image: DecorationImage(
                        image: AssetImage(widget.image), fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: screenHeight * 0.56,
            height: screenHeight * 0.44,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              padding: const EdgeInsets.all(20),
              itemCount: tabImages.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailAudioPage(
                            title: "dfsdsf",
                            subtitle: "dsfds",
                            image: "assets/images/pic-9.png",
                          ),
                        ),
                      );
                    },
                    child: GridTile(
                      // footer: Text(tabImages[index]['name']),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage(tabImages[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      //just for testing, will fill with image later
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
