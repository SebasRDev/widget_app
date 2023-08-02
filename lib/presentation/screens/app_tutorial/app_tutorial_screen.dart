import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imgUrl;

  SlideInfo(this.title, this.caption, this.imgUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Non laborum exercitation velit velit sunt ex dolor amet reprehenderit fugiat laboris nostrud sint.', 'assets/tutorial/1.png'),
  SlideInfo('Entrega Rapida', 'Exercitation do Lorem Lorem enim officia deserunt minim minim.', 'assets/tutorial/2.png'),
  SlideInfo('Disfruta la comida', 'Mollit qui irure dolore in sit nulla ea proident eiusmod incididunt enim qui.', 'assets/tutorial/3.png'),
];

class AppTutorialScreen extends StatefulWidget {

  static const name = 'tutorial_screen';

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
      
      if(!endReached && page >= (slides.length - 1.5)){
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

    final theme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black.withOpacity(0.6),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    PageView(
                      controller: pageViewController,
                      physics: const BouncingScrollPhysics(),
                      children: slides.map(
                          (slide) => _Slide(
                            title: slide.title, 
                            caption: slide.caption, 
                            imgUrl: slide.imgUrl)
                      ).toList()
                    ),
                    Positioned(
                      right: 0,
                      top: 15,
                      child: TextButton(
                        child: const Text('Saltar Tutorial'), 
                        onPressed: () => context.pop(),
                      )
                    ),
                    endReached ? 
                      Positioned(
                        bottom: 20,
                        right: 0,
                        child: FadeInRight(
                          from: 10,
                          delay: const Duration(seconds: 1),
                          child: FilledButton(
                            onPressed: () => context.pop(), 
                            child: const Text('Comenzar'),
                          ),
                        )
                      ) 
                      : const SizedBox(),


                  ],
                ),
              ),
            ),
        ),
        ]
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imgUrl;

  const _Slide({required this.title, required this.caption, required this.imgUrl});

  @override
  Widget build(BuildContext context) {

    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodyMedium;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(imgUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}