import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexilearn/data/models/Library.dart';
import 'package:lexilearn/domain/provider/library_provider.dart';
import 'package:lexilearn/presentation/widget/general/CustomClassContainer.dart';
import 'package:lexilearn/presentation/widget/general/CustomListview.dart';

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        padding: const EdgeInsets.only(top: 20),
        children: [
          // Section 1 header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "YOUR LIBRARY",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Hành động khi nhấn
                    ref
                        .read(libraryProvider.notifier)
                        .addLibrary(
                          Library(
                            id: DateTime.now().millisecondsSinceEpoch,
                            libraryName: "New Language",
                            ownerId: "user_new",
                            ownerDisplayName: "New User",
                            vocabularyIds: [],
                            vocabularyWords: [],
                            completed: 0,
                            total: 10,
                            color: Colors.orange,
                          ),
                        );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.grey, // Màu chữ
                    padding:
                        EdgeInsets.zero, // Xoá padding mặc định nếu muốn khít
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    minimumSize: Size(0, 0),
                  ),
                  child: const Text(
                    "See all",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          // Library List (dynamic)
           LibraryListWidget(),
          // Section 2 header
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Feature Courses",
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "See all",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Feature Course Cards
          SizedBox(
            height: 160,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: 5,
              separatorBuilder: (context, index) => const SizedBox(width: 16),
              itemBuilder: (context, index) =>
                  SizedBox(width: 280, child: GrammarQuizCard()),
            ),
          ),
        ],
      ),
    );
  }
}
