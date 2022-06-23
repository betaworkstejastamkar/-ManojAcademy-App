import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manojacademy/api/getlivelecture.dart';

List certificateData = [];

class DownloadCertificatePage extends StatefulWidget {
  const DownloadCertificatePage({Key? key}) : super(key: key);

  @override
  State<DownloadCertificatePage> createState() =>
      _DownloadCertificatePageState();
}

class _DownloadCertificatePageState extends State<DownloadCertificatePage> {
  List<dynamic> completedCertificate = [];
  List<dynamic> notcompletedCertificate = [];
  dynamic apiCall;
  @override
  void initState() {
    apiCall = getCertificates();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return FutureBuilder(
      future: apiCall,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          certificateData = snapshot.data as List<dynamic>;

          for (var i = 0; i < certificateData.length; i++) {
            if (certificateData[0][i]['completed']) {
              completedCertificate.insert(0, certificateData[0][i]);
            } else {
              notcompletedCertificate.insert(0, certificateData[0][i]);
            }
          }
          if (notcompletedCertificate.isNotEmpty &&
              completedCertificate.isNotEmpty) {
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
                        backgroundColor:
                            MaterialStateProperty.all(Colors.white)),
                  ),
                ),
                title: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SvgPicture.asset('icons/award.svg'),
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
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Congratulations !',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.15,
                            crossAxisCount: width < 440 ? 2 : 3,
                          ),
                          itemBuilder: (context, index) {
                            return ceritifcateCard(
                                name: completedCertificate[index]
                                    ['subjectname'],
                                lock: completedCertificate[index]['completed']);
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        child: Text(
                          'Pending Certificate',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 0),
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
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1.15,
                            crossAxisCount: width < 440 ? 2 : 3,
                          ),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: ceritifcateCard(
                                  name: notcompletedCertificate[index]
                                      ['subjectname'],
                                  lock: notcompletedCertificate[index]
                                      ['completed']),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            );
          }
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

Widget ceritifcateCard({name, lock}) {
  return Builder(builder: (context) {
    double width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: width,
          height: width < 440 ? width / 3 : width / 4,
          decoration: BoxDecoration(
            color: lock ? Colors.transparent : Colors.grey.shade200,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(18),
              topRight: Radius.circular(18),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(18), topRight: Radius.circular(18)),
            child: lock
                ? Image.asset(
                    'assets/certificate.png',
                    fit: BoxFit.cover,
                  )
                : Center(
                    child: Image.asset('icons/lock.png', fit: BoxFit.contain),
                  ),
          ),
        ),
        Card(
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(18),
                  bottomRight: Radius.circular(18))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  name,
                  style: const TextStyle(
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
                              ? const Color.fromRGBO(0, 129, 100, 1)
                              : Colors.black),
                    ),
                    const Spacer(),
                    SvgPicture.asset('icons/download.svg',
                        width: 30,
                        height: 30,
                        color: lock
                            ? const Color.fromRGBO(0, 129, 100, 1)
                            : const Color.fromRGBO(1, 1, 1, 0.5))
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  });
}
