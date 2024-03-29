import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppTutorialScreen extends StatelessWidget {

  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _AppTutorialView(),
    );
  }
}

class SlideData {
  final String title;
  final String caption;
  final String imageUrl;

  const SlideData({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });
}

final List<SlideData> _slidesData = [
  const SlideData(
    title: 'Cillum nulla enim in voluptate.',
    caption: 'Fugiat labore aliqua eiusmod velit veniam sint mollit sunt amet et ea.',
    imageUrl: 'assets/images/tutorial_1.png',
  ),
  const SlideData(
    title: 'Occaecat non ullamco commodo.',
    caption: 'Irure ullamco nulla quis consequat incididunt exercitation do aliqua voluptate.',
    imageUrl: 'assets/images/tutorial_2.png',
  ),
  const SlideData(
    title: 'Aliqua occaecat laboris.',
    caption: 'Magna aliquip cillum fugiat qui sunt quis exercitation est ex ullamco consequat.',
    imageUrl: 'assets/images/tutorial_3.png',
  ),
];

class _AppTutorialView extends StatefulWidget {
  const _AppTutorialView();

  @override
  State<_AppTutorialView> createState() => _AppTutorialViewState();
}

class _AppTutorialViewState extends State<_AppTutorialView> {

  final PageController pageViewController = PageController();
  bool finalSlide = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {

      final page = pageViewController.page ?? 0;
      if ( !finalSlide && page >= (_slidesData.length - 1) ) {
        setState(() {
          finalSlide = true;
        });
        return;
      }

      if ( finalSlide && page < (_slidesData.length - 1) ) {
        setState(() {
          finalSlide = false;
        });
      }

    });
  }

  @override
  void dispose() {
    pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: pageViewController,
          physics: const BouncingScrollPhysics(),
          children: _slidesData.map((slide) => _Slide(
            title: slide.title,
            caption: slide.caption,
            imageUrl: slide.imageUrl,
          )).toList(),
        ),
        Positioned(
          right: 20,
          top: 50,
          child: TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Skip'),
          ),
        ),
        finalSlide
          ? Positioned(
              bottom: 30,
              right: 30,
              child: FadeInRight(
                from: 15,
                delay: const Duration(milliseconds: 300),
                child: FilledButton(
                  onPressed: () {
                    context.pop();
                  },
                  child: const Text('Get Started'),
                ),
              )
            )
          : const SizedBox(),
      ],
    );
  }
}

class _Slide extends StatelessWidget {

  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imageUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ]
        ),
      ),
    );
  }
}
