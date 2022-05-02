import 'package:flutter/material.dart';

List certificateData = [
  {'subjectname': 'History', 'completed': true},
  {'subjectname': 'English', 'completed': true},
  {'subjectname': 'Science', 'completed': false},
  {'subjectname': 'Maths', 'completed': false},
];

class DownloadCertificatePage extends StatefulWidget {
  const DownloadCertificatePage({Key? key}) : super(key: key);

  @override
  State<DownloadCertificatePage> createState() =>
      _DownloadCertificatePageState();
}

class _DownloadCertificatePageState extends State<DownloadCertificatePage> {
  List<dynamic> completedCertificate = [];
  List<dynamic> notcompletedCertificate = [];
  @override
  void initState() {
    for (var i = 0; i < certificateData.length; i++) {
      if (certificateData[i]['completed']) {
        completedCertificate.insert(0, certificateData[i]);
      } else {
        notcompletedCertificate.insert(0, certificateData[i]);
      }
    }
    super.initState();
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
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Image.asset('icons/arrow-left.png'),
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
              Image.asset('icons/award.png'),
              const SizedBox(
                width: 5,
              ),
              const Text('Accompliment'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'Congratulations !',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Text(
                  'You Can Downlad your certificate now',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: completedCertificate.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 8 / 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return ceritifcateCard(
                        name: completedCertificate[index]['subjectname'],
                        lock: completedCertificate[index]['completed']);
                  }),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                child: Text(
                  'Pending Certificate',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Text(
                  'After the course completion you can unlock the certificate',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              ),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: notcompletedCertificate.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 8 / 10,
                    crossAxisCount: 2,
                  ),
                  itemBuilder: (context, index) {
                    return ceritifcateCard(
                        name: notcompletedCertificate[index]['subjectname'],
                        lock: notcompletedCertificate[index]['completed']);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget ceritifcateCard({name, lock}) {
  return Card(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: 160,
            child: lock
                ? Image.asset('assets/certificate.png',
                    width: 600, fit: BoxFit.fill)
                : Center(
                    child: Image.asset('icons/lock.png',
                        width: 80, fit: BoxFit.contain),
                  )),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Row(
                children: [
                  Text(
                    "Download",
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: lock
                            ? Color.fromRGBO(0, 129, 100, 1)
                            : Colors.black),
                  ),
                  Spacer(),
                  SizedBox(
                      width: 30,
                      height: 30,
                      child: lock
                          ? Image.asset('icons/download.png')
                          : Image.asset(
                              'icons/cantDownload.png',
                              width: 50,
                              height: 50,
                            ))
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
