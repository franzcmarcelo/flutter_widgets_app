import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {

  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({ super.key });

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {

  bool isLoading = false;

  void setLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: _InfiniteScrollView(
        isLoading: isLoading,
        setLoading: setLoading,
      ),
      floatingActionButton: FloatingActionButton(
        child: isLoading
          ? SpinPerfect(
              infinite: true,
              child: const Icon(Icons.refresh_outlined)
            )
          : FadeIn(
              child: const Icon(Icons.arrow_back)
            ),
        onPressed: () => context.pop(),
      ),
    );
  }
}

class _InfiniteScrollView extends StatefulWidget {

  final bool isLoading;
  final Function(bool) setLoading;

  const _InfiniteScrollView({
    required this.isLoading,
    required this.setLoading,
  });

  @override
  State<_InfiniteScrollView> createState() => _InfiniteScrollViewState();
}

class _InfiniteScrollViewState extends State<_InfiniteScrollView> {

  final ScrollController scrollController = ScrollController();
  final List<int> imagesIds = [11, 12, 13, 14, 15, 16, 17, 18, 19, 10];
  bool isMounted = true;

  void addImages({ int volumen = 5 }) {
    final lastId = imagesIds.last;
    for (int i = 1; i <= volumen; i++) {
      imagesIds.add(lastId + i);
    }
  }

  Future loadNextPage() async {
    if (widget.isLoading) return;
    widget.setLoading(true);

    await Future.delayed(const Duration(seconds: 2));
    if (!isMounted) return;
    addImages();

    widget.setLoading(false);
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500) {
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    setState(() {
      isMounted = false;
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: ListView.builder(
        controller: scrollController,
        itemCount: imagesIds.length,
        itemBuilder: (context, index) {
          return FadeInImage(
            fit: BoxFit.cover,
            width: double.infinity,
            height: 300,
            placeholder: const AssetImage('assets/images/jar-loading.gif'),
            image: NetworkImage('https://picsum.photos/id/${ imagesIds[index] }/200/300')
          );
        },
      ),
    );
  }
}