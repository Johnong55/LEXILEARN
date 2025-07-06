import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lexilearn/data/models/Library.dart';
import 'package:lexilearn/domain/provider/library_provider.dart';
import 'package:lexilearn/presentation/widget/general/CustomLibraryContainer.dart';

class LibraryListWidget extends ConsumerStatefulWidget {
  const LibraryListWidget({super.key});

  @override
  ConsumerState<LibraryListWidget> createState() => _LibraryListWidgetState();
}

class _LibraryListWidgetState extends ConsumerState<LibraryListWidget> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late List<Library> _libraries;

  @override
  void initState() {
    super.initState();
    _libraries = ref.read(libraryProvider);
  }

  @override
  Widget build(BuildContext context) {
    final libraries = ref.watch(libraryProvider);

    // Nếu số lượng tăng, chèn phần tử vào AnimatedList
    if (libraries.length > _libraries.length) {
      final newItemIndex = libraries.length - 1;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _listKey.currentState?.insertItem(newItemIndex);
      });
    }

    _libraries = List.from(libraries);

    return SizedBox(
      height: 200,
      child: AnimatedList(
        key: _listKey,
        scrollDirection: Axis.horizontal,
        initialItemCount: libraries.length,
        padding: const EdgeInsets.only(left: 10),
        itemBuilder: (context, index, animation) {
          final lib = libraries[index];
          return SizeTransition(
            sizeFactor: animation,
            axis: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: customLibraryContainer(
                title: lib.libraryName,
                completed: lib.completed,
                total: lib.total,
                color: lib.color,
              ),
            ),
          );
        },
      ),
    );
  }
}
