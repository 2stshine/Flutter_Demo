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
                    const Text('성공의 비결, 그들의 루틴 \u{1f41c}',
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
                    mainAxisSpacing: 10,
                    childAspectRatio: 0.8,
                  ),
                  delegate: SliverChildListDelegate([
                    PersonCard(
                      name: '손흥민',
                      imageName: 'son.png',
                      onTap: () => _showPersonInfo(
                          '손흥민: 축구선수, 토트넘 홋스퍼 FC, 골든 부츠 수상자 \n\n\u{1f440} 이런 분들께 추천해요! \n\u{1f446} 운동 선수 지망생 \n\u{1f446} 월드클래스의 루틴이 궁금한 사람 \n\u{1f446} 성실해지고 싶은 사람 \n'),
                    ),
                    PersonCard(
                      name: '정재승',
                      imageName: 'jeong.png',
                      onTap: () => _showPersonInfo(
                          '정재승: 뇌과학자, KAIST 교수\n\n\u{1f440} 이런 분들께 추천해요! \n\u{1f446} 하루를 효율적으로 살고 싶은 사람 \n\u{1f446} 과학자가 되고 싶은 사람 \n\u{1f446} 작가가 되고 싶은 사람 \n'),
                    ),
                    PersonCard(
                      name: '빌 게이츠',
                      imageName: 'bill.png',
                      onTap: () => _showPersonInfo(
                          '빌 게이츠: 마이크로소프트 공동 창립자 \n\n\u{1f440} 이런 분들께 추천해요! \n\u{1f446} 예비 CEO \n\u{1f446} 부자가 되고 싶은 사람 \n\u{1f446} 멋있게 늙고 싶은 사람 \n'),
                    ),
                    PersonCard(
                      name: '팀 쿡',
                      imageName: 'tim.png',
                      onTap: () => _showPersonInfo(
                          '팀 쿡 : Apple CEO \n\n\u{1f440} 이런 분들께 추천해요! \n\u{1f446} 스타트업을 목표하는 사람 \n\u{1f446} 애플을 사랑하는 사람 \n\u{1f446} 미국식 라이프를 경험해보고 싶은 사람 \n'),
                    ),
                    // 추가된 인물 카드
                    PersonCard(
                      name: '수능 만점자',
                      imageName: 'kim.jpg', // 이미지 파일 이름 확인
                      onTap: () => _showPersonInfo(
                          '김동희: 2025 수능 전과목 만점자\n\n\u{1f440} 이런 분들께 추천해요! \n\u{1f446} 수능을 앞둔 사람 \n\u{1f446} 공부를 잘하고 싶은데 뜻대로 안되는 사람 \n\u{1f446} 굶주린 사람  \n'),
                    ),
                    PersonCard(
                      name: '아인슈타인',
                      imageName: 'einstein.png', // 이미지 파일 이름 확인
                      onTap: () => _showPersonInfo(
                          '아인슈타인: 이론물리학자\n\n\u{1f440} 이런 분들께 추천해요! \n\u{1f446} 천재가 되고 싶은 사람 \n\u{1f446} 수학/과학을 좋아하는 사람 \n\u{1f446} 인류의 역사를 새로 쓰고 싶은 사람 \n'),
                    ),
                    PersonCard(
                      name: '유재석',
                      imageName: 'ryu.png', // 이미지 파일 이름 확인
                      onTap: () => _showPersonInfo(
                          '유재석: 예능인\n\n\u{1f440} 이런 분들께 추천해요! \n\u{1f446} 인간 관계가 가장 중요한 사람 \n\u{1f446} 유머 있는 사람이 되고 싶은 사람 \n\u{1f446} 유재석을 좋아하는 사람 \n'),
                    ),
                    PersonCard(
                      name: '톰 크루즈',
                      imageName: 'tom.png', // 이미지 파일 이름 확인
                      onTap: () => _showPersonInfo(
                          '톰 크루즈: 할리우드 배우 \n\n\u{1f440} 이런 분들께 추천해요! \n\u{1f446} 연기가 하고 싶은 사람 \n\u{1f446} 도전에 대한 갈망이 있는 사람 \n\u{1f446} 스릴을 즐기는 사람 \n'),
                    ),
                  ]),
                ),
              ),
            ],
          ),
          // 흰색 배경 정보 텍스트 상자
          if (selectedPersonInfo != null)
            Positioned(
              left: 30,
              bottom: MediaQuery.of(context).viewInsets.bottom +
                  120, // 키보드 높이에 따라 조정
              child: Container(
                width: MediaQuery.of(context).size.width - 60, // 화면 너비에 맞게 조정
                height: 190,
                padding: const EdgeInsets.all(10),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      selectedPersonInfo!,
                      style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ),
          // 루틴 보기 버튼을 하단 중앙에 배치
          if (selectedPersonInfo != null)
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 30), // 하단 여백
                child: ElevatedButton(
                  onPressed: () {
                    // 루틴 보기 버튼 클릭 시 다음 페이지로 이동
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RoutineScreen()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30), // 버튼 크기 조정
                    textStyle: const TextStyle(fontSize: 15), // 텍스트 크기 조정
                  ),
                  child: const Text('루틴 체험하기'),
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

// 루틴 보기 화면 추가
class RoutineScreen extends StatelessWidget {
  const RoutineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daily Routine')),
      body: const Center(child: Text('여기에 루틴 정보를 표시합니다.')),
    );
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
        children: <Widget>[
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage('image/$imageName'), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            name,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
