import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manojacademy/widgets/questionwidget.dart';
import 'package:quiver/async.dart';

List testData = [
  {
    'marks': 2,
    'question': 'The famous Konark Sun temple was built by whom?',
    'type': 'mcq',
    'Answers': [
      'Narshimhadeva I',
      'Angabhima deva I',
      'Konkanivarman',
      'Narsimhavarman II'
    ],
  },
  {
    'marks': 5,
    'question':
        'In which state of India, the first Paleolithic site was discovered?',
    'type': 'short_answers',
    'Answers':
        'In which state of India, the first Paleolithic site was discovered?'
  },
  {
    'marks': 2,
    'question':
        'In which state of India, the first Paleolithic site was discovered?',
    'type': 'short_answers',
    'Answers':
        'In which state of India, the first Paleolithic site was discovered?'
  },
  {
    'marks': 2,
    'question': 'The famous Konark Sun temple was built by whom?',
    'type': 'mcq',
    'Answers': [
      'Narshimhadeva I',
      'Angabhima deva I',
      'Konkanivarman',
      'Narsimhavarman II'
    ],
  },
];

class LiveTestPage extends StatefulWidget {
  final String chapterName;
  final int timer, chapNo;
  const LiveTestPage(
      {Key? key,
      required this.chapterName,
      required this.timer,
      required this.chapNo})
      : super(key: key);

  @override
  State<LiveTestPage> createState() => _LiveTestPageState();
}

class _LiveTestPageState extends State<LiveTestPage> {
  num _start = 0;
  double _current = 0;
  List timer = [];

  String formatedTime(int secTime) {
    String getParsedTime(String time) {
      if (time.length <= 1) return "0$time";
      return time;
    }

    int hr = 0;
    int min = secTime ~/ 60;
    int sec = secTime % 60;

    if (min > 60) {
      hr = min ~/ 60;
      min = min - 60;
    }

    String parsedTime = getParsedTime(hr.toString()) +
        " : " +
        getParsedTime(min.toString()) +
        " : " +
        getParsedTime(sec.toString());

    return parsedTime;
  }

  void startTimer() {
    int start = _start.toInt();
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: start),
      const Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      if (mounted) {
        setState(() {
          _current = (start - duration.elapsed.inSeconds).toDouble();
          timer = formatedTime(_current.toInt()).split(':');
        });
      }
    });

    sub.onDone(() async {
      sub.cancel();
      return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              title: const Text('Time Over'),
              content:
                  const Text('The test Time is end. Thank for your response'),
              actions: <Widget>[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Theme.of(context).primaryColor),
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  @override
  void initState() {
    super.initState();
    // List temp = widget.timer.split(":");
    _start = widget.timer * 60;
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 1,
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: ElevatedButton(
            onPressed: () async {
              return showDialog(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return WillPopScope(
                    onWillPop: () async => false,
                    child: AlertDialog(
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(10.0))),
                      title: const Text('Alert'),
                      content: const Text('You want to end the Test?'),
                      actions: <Widget>[
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Theme.of(context).primaryColor),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Keep Going'),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white, onPrimary: Colors.black),
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).pop();
                          },
                          child: const Text('End the Test'),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: SvgPicture.asset('icons/arrow-left.svg'),
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.white)),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          // child: Text(_current.toString()),
          child: timer.isNotEmpty
              ? int.parse(timer[0]) > 0
                  ? Text('${timer[0]}hr:${timer[1]}m:${timer[2]}s')
                  : int.parse(timer[1]) > 0
                      ? Text('${timer[1]}m:${timer[2]}s')
                      : Text('${timer[2]}s')
              : const Text('Timer'),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'chap ${widget.chapNo} - ${widget.chapterName}',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16),
              ),
              const SizedBox(height: 10),
              Text(
                '${testData.length} question | 30 minutes',
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 16),
              ),
              const Divider(
                thickness: 1,
                color: Color.fromRGBO(165, 153, 153, 1),
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: testData.length,
                itemBuilder: (context, index) {
                  if (testData[index]['type'] == 'mcq') {
                    return McqCards(
                        index: index + 1,
                        // context: context,
                        question: testData[index]['question'],
                        marks: testData[index]['marks'],
                        answers: testData[index]['Answers']);
                  } else {
                    return ShortAnsCard(
                        index: index + 1,
                        question: testData[index]['question'],
                        marks: testData[index]['marks']);
                  }
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        onPressed: () async {
          return showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext context) {
              return WillPopScope(
                onWillPop: () async => false,
                child: AlertDialog(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  title: const Text('Alert'),
                  content: const Text('You want to Submit the Test?'),
                  actions: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor),
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).pop();
                      },
                      child: const Text('Yes'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          primary: Colors.white, onPrimary: Colors.black),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Not Yet'),
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: const Text('Submit'),
        style: ElevatedButton.styleFrom(
            primary: Theme.of(context).primaryColor, onPrimary: Colors.white),
      ),
    );
  }
}
