import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

List testReusltData = [
  {
    'name': 'Maths',
    'testdata': [
      {
        'chapter': 2,
        'Question': 50,
        'R_Answer': 33,
        'W_Answer': 17,
        'completed': 45,
      },
      {
        'chapter': 2,
        'Question': 50,
        'R_Answer': 33,
        'W_Answer': 17,
        'completed': 60,
      }
    ],
  },
  {
    'name': 'History',
    'testdata': [
      {
        'chapter': 2,
        'Question': 50,
        'R_Answer': 33,
        'W_Answer': 17,
        'completed': 45,
      },
      {
        'chapter': 2,
        'Question': 50,
        'R_Answer': 33,
        'W_Answer': 17,
        'completed': 60,
      },
      {
        'chapter': 2,
        'Question': 50,
        'R_Answer': 33,
        'W_Answer': 17,
        'completed': 80,
      }
    ]
  },
  {
    'name': 'English',
    'testdata': [
      {
        'chapter': 2,
        'Question': 50,
        'R_Answer': 33,
        'W_Answer': 17,
        'completed': 90,
      },
      {
        'chapter': 2,
        'Question': 50,
        'R_Answer': 33,
        'W_Answer': 17,
        'completed': 25,
      }
    ]
  },
];

class TestResultPage extends StatefulWidget {
  const TestResultPage({Key? key}) : super(key: key);

  @override
  State<TestResultPage> createState() => _TestResultPageState();
}

class _TestResultPageState extends State<TestResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: SvgPicture.asset('icons/arrow-left.svg'),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.white)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset('icons/bar-chart.svg'),
              const SizedBox(
                width: 5,
              ),
              const Text('Test result'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
        child: ListView.builder(
          itemCount: testReusltData.length,
          itemBuilder: (context, index) {
            return subjectTitle(
                name: "${testReusltData[index]['name']}",
                resultdata: testReusltData[index]!['testdata']);
          },
        ),
      ),
    );
  }
}

Widget subjectTitle({name, required List resultdata}) {
  return SingleChildScrollView(
    physics: const ScrollPhysics(),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
          child: Text(
            name,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: resultdata.length,
            itemBuilder: (context, index) {
              return testResultView(
                  chapter: "${resultdata[index]['chapter']}",
                  question: resultdata[index]['Question'],
                  rigthanswers: resultdata[index]['R_Answer'],
                  wrongansers: resultdata[index]['W_Answer'],
                  precent: resultdata[index]['completed']);
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 8 / 9,
              crossAxisCount: 2,
            ),
          ),
        ),
      ],
    ),
  );
}

Widget testResultView({chapter, question, rigthanswers, wrongansers, precent}) {
  var _precent = precent / 100;
  precent = (rigthanswers / question) * 100;

  return Card(
    elevation: 0,
    shape: RoundedRectangleBorder(
      side: const BorderSide(color: Color.fromRGBO(196, 196, 196, 1)),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   children: [
          //     TextButton(
          //       onPressed: () {},
          //       child: const Text('Retry'),
          //       style: ButtonStyle(
          //         foregroundColor: MaterialStateProperty.all(
          //             const Color.fromRGBO(0, 129, 100, 1)),
          //         elevation: MaterialStateProperty.all(0),
          //       ),
          //     )
          //   ],
          // ),
          Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey.shade300,
                  strokeWidth: 10,
                  color: const Color.fromRGBO(0, 129, 100, 1),
                  value: _precent,
                ),
              ),
              Text('$precent/100')
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(color: Color.fromRGBO(196, 196, 196, 1)),
          ),
          Row(
            children: [
              const Text(
                'Chapter : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '$chapter',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                'No of Questions : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '$question',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                'Right Answers : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '$rigthanswers',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Row(
            children: [
              const Text(
                'Wrong Answer : ',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
              Text(
                '$wrongansers',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
