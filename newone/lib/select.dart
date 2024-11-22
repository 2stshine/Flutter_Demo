import 'package:flutter/material.dart';

class SelectScreen extends StatefulWidget {
  const SelectScreen({super.key});

  @override
  _SelectScreenState createState() => _SelectScreenState();
}

class _SelectScreenState extends State<SelectScreen> {
  String? selectedPersonInfo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SyncRoutine', style: TextStyle(fontSize: 16)),
      ),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.all(30.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    const Text(
                      '유명인의 하루 살아보기',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text('성공의 비결, 그들의 루틴',
                        style: TextStyle(fontSize: 14)),
                    const SizedBox(height: 30),
                  ]),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 0,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildListDelegate([
                    PersonCard(
                      name: '손흥민',
                      imageName: 'son.png',
                      onTap: () => _showPersonInfo(
                          '손흥민: 축구선수, 토트넘 홋스퍼 FC, 골든 부츠 수상자 \n\n 1. 패스 훈련 \n 2. 양발 슈팅 훈련 \n 3. 영양 잡힌 식단'),
                    ),
                    PersonCard(
                      name: '정재승',
                      imageName: 'jeong.png',
                      onTap: () => _showPersonInfo(
                          '정재승: 뇌과학자, KAIST 교수\n\n 1. 일어난 직후 20분 독서 \n 2. 뇌 영양소 챙기기 \n 3. 안경 똑바로 쓰기'),
                    ),
                    PersonCard(
                      name: '빌 게이츠',
                      imageName: 'bill.png',
                      onTap: () => _showPersonInfo(
                          '빌 게이츠: 마이크로소프트 공동 창립자 \n\n 1. 5시 기상하기 \n 2. 약속 장소 10분 일찍 도착하기 \n 3. 스마트폰 멀리하기'),
                    ),
                    PersonCard(
                      name: '팀 쿡',
                      imageName: 'tim.png',
                      onTap: () => _showPersonInfo(
                          '팀 쿡: Apple CEO \n\n 1. 기상 직후 오늘 해야할 일 정리하기 \n 2. 점심 식사 이후 10분 명상하기 \n 3. 잘 웃기'),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          if (selectedPersonInfo != null)
            Positioned(
              left: 30,
              bottom: 180,
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.transparent,
                child: Text(
                  selectedPersonInfo!,
                  style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _showPersonInfo(String info) {
    setState(() {
      selectedPersonInfo = info;
    });
  }
}

class PersonCard extends StatelessWidget {
  final String name;
  final String imageName;
  final VoidCallback onTap;

  const PersonCard({
    super.key,
    required this.name,
    required this.imageName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('image/$imageName'), // 수정된 부분
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
