import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manojacademy/api/getlivelecture.dart';

List testReusltData = [];

class TestResultPage extends StatefulWidget {
  const TestResultPage({Key? key}) : super(key: key);

  @override
  State<TestResultPage> createState() => _TestResultPageState();
}

class _TestResultPageState extends State<TestResultPage> {
  dynamic apiCall;
  @override
  void initState() {
    apiCall = getTestResult();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: apiCall,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          testReusltData = snapshot.data as List<dynamic>;

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
                itemCount: testReusltData[0].length,
                itemBuilder: (context, index) {
                  return subjectTitle(
                      name: "${testReusltData[0][index]['name']}",
                      resultdata: testReusltData[0][index]['testdata']);
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return Center(
            child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ));
      },
    );
  }
}

Widget subjectTitle({name, required List resultdata}) {
  return Builder(builder: (context) {
    double width = MediaQuery.of(context).size.width;
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
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
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
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1.2,
                crossAxisCount: width < 440 ? 2 : 3,
              ),
            ),
          ),
        ],
      ),
    );
  });
}

Widget testResultView({chapter, question, rigthanswers, wrongansers, precent}) {
  var _precent = precent / 100;
  precent = (rigthanswers / question) * 100;
  return Builder(builder: (context) {
    double width = MediaQuery.of(context).size.width;
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
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                SizedBox(
                  height: width / 5,
                  width: width / 5,
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
  });
}
