import 'package:flutter/material.dart';
import 'select.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '깔끔한 홈 화면',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final PageController _pageController = PageController(viewportFraction: 0.8);
  int _currentPage = 0;

  final List<String> _images = [
    'image/son.png',
    'image/einstein.png',
    'image/ryu.png',
    'image/tom.png',
    'image/bill.png',
    'image/jeong.png',
    'image/beast.png',
    'image/kim.jpg',
    'image/wonbin.png',
    'image/obama.png',
    // 추가 이미지들...
  ];

  final List<String> _names = [
    '손흥민',
    '아인슈타인',
    '유재석',
    '톰 크루즈',
    '빌 게이츠',
    '정재승',
    'Mr.Beast',
    '김동희',
    'RIIZE 원빈',
    '오바마',
    // 추가 이름들...
  ];

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentPage != next) {
        setState(() {
          _currentPage = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SyncRoutine'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 70),
              child: Text(
                'SyncRoutine',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 0, bottom: 10),
              child: Text(
                'Now',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontSize: 30,
                    color: Color.fromARGB(255, 222, 77, 77),
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 350,
              child: PageView.builder(
                controller: _pageController,
                itemCount: _images.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(_images[index]),
                            fit: BoxFit.cover),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 8,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                _names[_currentPage],
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 50, left: 70, right: 70),
              child: Text(
                '손흥민, 아인슈타인 등 10명의 루틴이 준비되어 있습니다.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SelectScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                textStyle: const TextStyle(fontSize: 17),
              ),
              child: const Text('\u{1f3a9} 유명인 체험하기'),
            ),
          ],
        ),
      ),
    );
  }
}
