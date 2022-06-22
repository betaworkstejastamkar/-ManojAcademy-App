import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manojacademy/api/getlivelecture.dart';

class LivePage extends StatefulWidget {
  const LivePage({Key? key}) : super(key: key);

  @override
  State<LivePage> createState() => _LivePageState();
}

var liveCardsData = [];

class _LivePageState extends State<LivePage> {
  dynamic apiCall;
  @override
  void initState() {
    apiCall = getLiveLecData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: apiCall,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          liveCardsData = snapshot.data as List<dynamic>;

          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).primaryColor,
              title: Row(
                children: [
                  SvgPicture.asset('icons/livelecturereddot.svg'),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text('Live Sessions')
                ],
              ),
              leading: const Text(''),
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView.builder(
                  itemCount: liveCardsData[0].length,
                  itemBuilder: (context, index) {
                    return liveCards(
                        title: '${liveCardsData[0][index]['title']}',
                        subject: '${liveCardsData[0][index]['subject']}',
                        date: '${liveCardsData[0][index]['date']}',
                        startTime: '${liveCardsData[0][index]['startTime']}',
                        endTime: '${liveCardsData[0][index]['endTime']}',
                        lecturer: '${liveCardsData[0][index]['lecturer']}',
                        width: width,
                        height: height);
                  }),
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

Widget liveCards(
    {title, subject, date, startTime, endTime, lecturer, width, height}) {
  return Card(
    elevation: 4,
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
          Card(
            elevation: 0,
            color: const Color.fromRGBO(0, 0, 0, 0.1),
            child: Padding(
              padding: const EdgeInsetsDirectional.all(5),
              child: Text(
                subject,
                style: const TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'date: ',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                date,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Text(
                'Timing: ',
                style: TextStyle(
                    color: Color.fromRGBO(0, 0, 0, 0.5),
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                '$startTime - $endTime',
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            lecturer,
            style: const TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: width - 50,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Join'),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(0, 129, 100, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
