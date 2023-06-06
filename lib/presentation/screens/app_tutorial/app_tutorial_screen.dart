import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Search food',
      'Lorem proident nostrud laboris dolor aliqua amet sunt ipsum mollit officia ullamco elit ullamco consectetur. In tempor magna labore tempor duis minim ea exercitation. Est officia ea ex qui nisi nulla cupidatat. Aliqua elit in officia ea sint et qui duis dolor reprehenderit sint. Quis nostrud enim ad excepteur occaecat magna consectetur cillum. Adipisicing et dolor aliqua ut amet pariatur et eiusmod consectetur reprehenderit cupidatat adipisicing laboris.',
      'assets/images/1.png'),
  SlideInfo(
      'Quick delivery',
      'Dolor dolor mollit cupidatat magna. Eu qui ipsum magna nulla irure nulla. Minim sit proident consequat deserunt veniam laborum. Non sunt est nisi culpa. Voluptate qui mollit sit in dolore fugiat eu Lorem qui.',
      'assets/images/2.png'),
  SlideInfo(
      'Enjoy your meal',
      'Aliqua laboris excepteur labore tempor non adipisicing. Incididunt aliquip Lorem velit cupidatat voluptate minim amet dolore in. Quis quis excepteur et in ad. Tempor id id aliquip mollit ad laborum velit consequat dolore elit eu. Cillum sunt minim quis exercitation ullamco.',
      'assets/images/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;

      if (!endReached && page >= (slides.length - 1)) {
        setState(() {
          endReached = true;
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            physics: const BouncingScrollPhysics(),
            controller: pageViewController,
            children: slides
                .map((slideData) => _Slide(
                    title: slideData.title,
                    caption: slideData.caption,
                    imageUrl: slideData.imageUrl))
                .toList(),
          ),
          Positioned(
            right: 20,
            top: 50,
            child: TextButton(
              child: const Text('Quit'),
              onPressed: () => context.pop(),
            ),
          ),
          endReached
              ? Positioned(
                  bottom: 30,
                  right: 30,
                  child: FadeInRight(
                    from: 15,
                    delay: const Duration(seconds: 1),
                    child: FilledButton(
                      child: const Text('Start'),
                      onPressed: () => context.pop(),
                    ),
                  ),
                )
              : const SizedBox()
        ],
      ),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(imageUrl),
          const SizedBox(height: 20),
          Text(
            title,
            style: titleStyle,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            caption,
            style: captionStyle,
            textAlign: TextAlign.center,
          ),
        ],
      )),
    );
  }
}
