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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

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
              padding: EdgeInsets.only(top: 0),
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
            Stack(
              alignment: Alignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // 그림자 색상
                          spreadRadius: 2, // 그림자 퍼짐 정도
                          blurRadius: 8, // 그림자 흐림 정도
                          offset: const Offset(0, 1), // 그림자 위치 조정
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        'image/son.png',
                        width: 300,
                        height: 300,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 450, left: 70, right: 70),
                  child: Text(
                    '손흥민, 아인슈타인 등 22인의 루틴이 준비되어 있습니다.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
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
                padding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 25), // 버튼 크기 조정
                textStyle: const TextStyle(fontSize: 17), // 텍스트 크기 조정
              ),
              child: const Text('\u{1f3a9} 유명인 체험하기'),
            ),
          ],
        ),
      ),
    );
  }
}
