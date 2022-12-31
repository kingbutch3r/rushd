import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rushd/app/common/const.dart';
import 'package:rushd/app/modules/audiobook/controllers/audiobook_controller.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: false,
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          "Shoeb",
          style: TextStyle(color: Colors.black),
        ),
        actions: const [
          CircleAvatar(
            backgroundColor: Const.mainBlack,
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Const.primaryColor,
        onPressed: () {},
        child: const Icon(Icons.search_outlined),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     elevation: 1,
      //     showSelectedLabels: false,
      //     selectedItemColor: Const.mainWhite,
      //     showUnselectedLabels: false,
      //     backgroundColor: Const.mainBlack,
      //     items: [
      //       const BottomNavigationBarItem(
      //           icon: Icon(Icons.book_outlined), label: "Books"),
      //       const BottomNavigationBarItem(
      //           icon: Icon(Icons.person_outline_outlined), label: "User")
      //     ]),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   height: 40,
              //   padding: const EdgeInsets.symmetric(horizontal: 20),
              //   child: TextField(
              //     autofocus: false,
              //     textAlignVertical: TextAlignVertical.bottom,
              //     style: const TextStyle(fontSize: 16.0, color: Const.mainBlack),
              //     decoration: InputDecoration(
              //         border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10.0),
              //         ),
              //         focusedBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10.0),
              //             borderSide: const BorderSide(color: Const.mainBlack)),
              //         enabledBorder: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(10.0),
              //             borderSide: const BorderSide(color: Const.halfWhite)),
              //         suffixIcon: InkWell(
              //           onTap: () {},
              //           child: Icon(
              //             Icons.search_rounded,
              //             color: Const.mainBlack,
              //           ),
              //         ),
              //         fillColor: Const.halfWhite,
              //         filled: true,
              //         hintStyle: TextStyle(color: Colors.grey),
              //         hintText: "Search"),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Card(
                  color: Const.primaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: SizedBox(
                    height: 200,
                    width: Get.width,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 16),
                child: Text(
                  "Recomended Books",
                  style: TextStyle(
                      color: Const.mainBlack,
                      fontWeight: FontWeight.w700,
                      fontSize: 16),
                ),
              ),
              Obx(() => Column(
                    children: [
                      for (var book in controller.audiobooks)
                        InkWell(
                          onTap: () {
                            Get.toNamed("/audiobook", arguments: book);
                            if (Get.find<AudiobookController>().audioBook ==
                                null) {
                              Get.find<AudiobookController>().loadAudioBook();
                            }
                          },
                          child: Card(
                              elevation: 0,
                              child: ListTile(
                                isThreeLine: true,
                                leading: Image.network(
                                  book.coverThumb!,
                                  height: 50,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      "${book.author}  | ${book.langauge.toString().toUpperCase()}",
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                    Row(
                                      children: [
                                        for (var genr in book.genre!)
                                          Padding(
                                            padding: const EdgeInsets.all(2),
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                  padding: const EdgeInsets
                                                          .symmetric(
                                                      horizontal: 5,
                                                      vertical: 1),
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              25),
                                                      color:
                                                          Const.secondaryColor),
                                                  child: Text(
                                                    genr,
                                                    style: const TextStyle(
                                                        fontSize: 11,
                                                        color: Const.mainWhite),
                                                  )),
                                            ),
                                          )
                                      ],
                                    )
                                  ],
                                ),
                                title: Text(
                                  book.title!,
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Const.mainBlack),
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.play_arrow_outlined,
                                      color: Const.primaryColor,
                                    )),
                              )),
                        )
                    ],
                  ))
              // Expanded(
              //   child: Container(
              //       padding: const EdgeInsets.fromLTRB(4, 8, 4, 0),
              //       child: FutureBuilder(
              //           future: FirebaseFirestore.instance
              //               .collection("audiobooks")
              //               .get(),
              //           builder: (context,
              //               AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>>
              //                   snapshot) {
              //             if (snapshot.hasData) {
              //               return GridView.count(
              //                 crossAxisCount: 3,
              //                 childAspectRatio: 6 / 7,
              //                 children: [
              //                   for (var book in snapshot.data!.docs)
              //                     Padding(
              //                       padding: const EdgeInsets.symmetric(
              //                           horizontal: 2, vertical: 4),
              //                       child: InkWell(
              //                         onTap: () {
              //                           Get.toNamed(Routes.audioBook,
              //                               arguments: "ID");
              //                         },
              //                         child: Card(
              //                           color: Color(0xFFFFE9B1),
              //                           shape: RoundedRectangleBorder(
              //                               borderRadius: BorderRadius.circular(8)),
              //                           clipBehavior: Clip.hardEdge,
              //                           child: Stack(
              //                             alignment: Alignment.bottomCenter,
              //                             children: [
              //                               Expanded(
              //                                 child: ClipRRect(
              //                                     clipBehavior: Clip.hardEdge,
              //                                     borderRadius:
              //                                         BorderRadius.circular(8),
              //                                     child: Image.network(
              //                                       book.data()["cover_thumb"],
              //                                       fit: BoxFit.fitWidth,
              //                                     )),
              //                               ),
              //                               Container(
              //                                 color: Colors.white,
              //                                 width: double.infinity,
              //                                 height: 30,
              //                                 child: Column(
              //                                   children: [
              //                                     Padding(
              //                                       padding:
              //                                           const EdgeInsets.symmetric(
              //                                               vertical: 2,
              //                                               horizontal: 2),
              //                                       child: Text(
              //                                         book.data()["title"],
              //                                         style: const TextStyle(
              //                                             fontSize: 12,
              //                                             color: Colors.black,
              //                                             fontWeight:
              //                                                 FontWeight.bold),
              //                                         textAlign: TextAlign.left,
              //                                         softWrap: false,
              //                                       ),
              //                                     ),
              //                                     Padding(
              //                                       padding:
              //                                           const EdgeInsets.symmetric(
              //                                               horizontal: 2),
              //                                       child: Text(
              //                                         book.data()["author"],
              //                                         style: const TextStyle(
              //                                           fontSize: 10,
              //                                         ),
              //                                         textAlign: TextAlign.left,
              //                                         softWrap: false,
              //                                       ),
              //                                     )
              //                                   ],
              //                                 ),
              //                               )
              //                             ],
              //                           ),
              //                         ),
              //                       ),
              //                     )
              //                 ],
              //               );
              //             } else {
              //               return const Center(
              //                 child: CircularProgressIndicator(),
              //               );
              //             }
              //           })),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
