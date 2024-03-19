import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/detail_audio_page.dart';
import 'package:flutter_application_1/my_tabs.dart';
import 'package:flutter_application_1/widgets/app_colors.dart';

class myscreen extends StatefulWidget {
  const myscreen({super.key});

  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<myscreen>
    with SingleTickerProviderStateMixin {
  List<String> imagePaths = [
    "assets/images/pic-8.png",
    "assets/images/pic-7.png",
    "assets/images/pic-6.png",
    "assets/images/pic-9.png",
    "assets/images/pic-10.png",
  ];

  List<List<String>> tabImages = [
    [
      "assets/images/pic-3.png",
      "assets/images/pic-2.png",
      "assets/images/pic-4.png",
      "assets/images/pic-5.png",
      "assets/images/pic-5.png",
      "assets/images/pic-6.png",
      "assets/images/pic-7.png"
    ],
    [
      "assets/images/pic-5.png",
      "assets/images/pic-6.png",
      "assets/images/pic-7.png",
      "assets/images/pic-5.png",
      "assets/images/pic-3.png",
      "assets/images/pic-2.png",
      "assets/images/pic-4.png",
    ],
    [
      "assets/images/pic-8.png",
      "assets/images/pic-9.png",
      "assets/images/pic-10.png"
    ],
  ];

  late ScrollController _scrollController;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabImages.length, vsync: this);
    _scrollController = ScrollController();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: background,
      child: SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ImageIcon(
                      AssetImage(
                        "assets/images/noun-app-menu-3077554.png",
                      ),
                      size: 25,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.search,
                          size: 25,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.notifications,
                          size: 25,
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: const Text(
                      "Popular Books",
                      style: TextStyle(fontSize: 30),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 180,
                child: Swiper(
                  autoplay: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                          image: AssetImage(imagePaths[index]),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    );
                  },
                  itemCount: imagePaths.length,
                  pagination: SwiperPagination(),
                  // control: SwiperControl(),
                ),
              ),
              Expanded(
                child: NestedScrollView(
                  controller: _scrollController,
                  headerSliverBuilder:
                      (BuildContext context, bool boxIsScrolled) {
                    return [
                      SliverAppBar(
                        pinned: true,
                        forceElevated: boxIsScrolled,
                        backgroundColor: const Color(0xFFfafafc),
                        bottom: PreferredSize(
                          preferredSize: const Size.fromHeight(50),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 20, left: 10),
                            child: TabBar(
                              indicatorPadding: const EdgeInsets.all(0),
                              indicatorSize: TabBarIndicatorSize.label,
                              labelPadding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              controller: _tabController,
                              isScrollable: true,
                              indicator: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 7,
                                        offset: const Offset(
                                          0,
                                          0,
                                        ))
                                  ]),
                              tabs: const [
                                AppTabs(color: menu1Color, text: "New"),
                                AppTabs(color: menu2Color, text: "Popular"),
                                AppTabs(color: menu3Color, text: "Trending")
                              ],
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
                  //new tab
                  body: TabBarView(controller: _tabController, children: [
                    ListView.builder(
                      itemCount: tabImages[_tabController.index].length,
                      itemBuilder: (_, i) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailAudioPage(
                                  title: "Book Title $i",
                                  subtitle: "Author Name $i",
                                  image: tabImages[_tabController.index][i],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tabVarViewColor,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: const Offset(0, 0),
                                    color: Colors.grey.withOpacity(0.2),
                                  )
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(
                                              tabImages[_tabController.index]
                                                  [i]),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 24,
                                              color: starColor,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              "$i.3$i",
                                              style: const TextStyle(
                                                  color: menu2Color),
                                            )
                                          ],
                                        ),
                                        Text(
                                          "Book Title $i", // Change the text here
                                          style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "Author Name $i", // Change the text here
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width: 60,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: loveColor),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "love", // Change the text here
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    //popular tab
                    ListView.builder(
                      itemCount: tabImages[_tabController.index].length,
                      itemBuilder: (_, i) {
                        int imageIndex =
                            i % tabImages[_tabController.index].length;
                        return GestureDetector(
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tabVarViewColor,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: const Offset(0, 0),
                                    color: Colors.grey.withOpacity(0.2),
                                  )
                                ],
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => DetailAudioPage(
                                        title: "Book Title $i",
                                        subtitle: "Author Name $i",
                                        image: tabImages[_tabController.index]
                                            [i],
                                      ),
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 90,
                                        height: 120,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          image: DecorationImage(
                                            image: AssetImage(
                                              tabImages[_tabController.index]
                                                  [imageIndex],
                                            ),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(width: 10),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.star,
                                                size: 24,
                                                color: starColor,
                                              ),
                                              const SizedBox(width: 5),
                                              Text(
                                                "$imageIndex.3$imageIndex",
                                                style: const TextStyle(
                                                    color: menu2Color),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Book Title $imageIndex",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            "Author Name $imageIndex",
                                            style: const TextStyle(
                                                color: Colors.grey),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            width: 60,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(3),
                                              color: loveColor,
                                            ),
                                            alignment: Alignment.center,
                                            child: const Text(
                                              "love",
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    //trending
                    ListView.builder(
                      itemCount: tabImages[_tabController.index].length,
                      itemBuilder: (_, i) {
                        int imageIndex =
                            i % tabImages[_tabController.index].length;
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailAudioPage(
                                    title: "Book Title $i",
                                    subtitle: "Author Name $i",
                                    image: tabImages[_tabController.index][i],
                                  ),
                                ));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 10,
                              bottom: 10,
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tabVarViewColor,
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 2,
                                    offset: const Offset(0, 0),
                                    color: Colors.grey.withOpacity(0.2),
                                  )
                                ],
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 90,
                                      height: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          image: AssetImage(
                                            tabImages[_tabController.index]
                                                [imageIndex],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            const Icon(
                                              Icons.star,
                                              size: 24,
                                              color: starColor,
                                            ),
                                            const SizedBox(width: 5),
                                            Text(
                                              "$imageIndex.3$imageIndex",
                                              style: const TextStyle(
                                                  color: menu2Color),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "Book Title $imageIndex",
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          "Author Name $imageIndex",
                                          style: const TextStyle(
                                              color: Colors.grey),
                                        ),
                                        const SizedBox(height: 10),
                                        Container(
                                          width: 60,
                                          height: 20,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(3),
                                            color: loveColor,
                                          ),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "love",
                                            style: TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
