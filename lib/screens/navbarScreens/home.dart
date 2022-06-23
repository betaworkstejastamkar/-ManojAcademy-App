import 'package:bottom_picker/bottom_picker.dart';
import 'package:bottom_picker/resources/arrays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:manojacademy/api/getclassdata.dart';
import 'package:manojacademy/data/studentdata.dart';
import 'package:manojacademy/screens/subScreens/notificationscreen.dart';
import 'package:manojacademy/widgets/carouselwindow.dart';
import 'package:manojacademy/widgets/drawer.dart';
import 'package:manojacademy/widgets/popularcards.dart';
import 'package:manojacademy/widgets/subjectcards.dart';
import 'package:manojacademy/widgets/videocards.dart';

var homePage = [];
List imageDataItems = [
  'assets/carousalbg (2).png',
  'assets/carousalbg.png',
];

List videoCardData = [
  {
    'image': 'assets/carousalbg (2).png',
    'name': 'Stone age man',
    'subname': 'History',
    'hours': '2',
    'mintes': '30'
  },
  {
    'image': 'assets/carousalbg (2).png',
    'name': 'How things work',
    'subname': 'Science',
    'hours': '2',
    'mintes': '27'
  },
  {
    'image': 'assets/carousalbg (2).png',
    'name': 'The Power of G',
    'subname': 'Science',
    'hours': '2',
    'mintes': '40'
  }
];

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void openPickerWithCustomPickerTextStyle(BuildContext context) {
    BottomPicker(
      height: 400,
      dismissable: true,
      items: [for (int i = 0; i < classes.length; i++) Text(classes[i])],
      title: '',
      pickerTextStyle: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
      onSubmit: (index) {
        setState(() {
          studentClass = classes[index];
        });
      },
      layoutOrientation: LAYOUT_ORIENTATION.rtl,
      itemExtent: 30,
      displayCloseIcon: false,
      displayButtonIcon: false,
      buttonSingleColor: Theme.of(context).primaryColor,
      buttonText: 'ok',
      buttonAlignement: MainAxisAlignment.end,
      buttonTextStyle: const TextStyle(
          fontSize: 12, fontWeight: FontWeight.w500, color: Colors.white),
      closeIconColor: Colors.red,
    ).show(context);
  }

  dynamic apiCall;

  @override
  void initState() {
    apiCall = fetchHomePage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _key = GlobalKey();
    String dropdownvalue = studentClass;
    return FutureBuilder(
      future: apiCall,
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          homePage = snapshot.data as List<dynamic>;

          return Scaffold(
            key: _key,
            appBar: AppBar(
              actions: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const NotificationScreen()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: SvgPicture.asset('icons/bell.svg'),
                  ),
                )
              ],
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              title: InkWell(
                onTap: () => openPickerWithCustomPickerTextStyle(context),
                child: Center(
                  child: Wrap(
                    crossAxisAlignment: WrapCrossAlignment.start,
                    children: [
                      Text(dropdownvalue),
                      const SizedBox(
                        width: 5,
                      ),
                      const RotatedBox(
                        quarterTurns: 3,
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: 18,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              centerTitle: true,
              leading: IconButton(
                  icon: SvgPicture.asset('icons/align-left.svg'),
                  onPressed: () {
                    _key.currentState?.openDrawer();
                    // Scaffold.of(context).openDrawer();
                  }),
            ),
            drawer: const SideBar(),
            body: SingleChildScrollView(
              physics: const ScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CarouselWindow(data: homePage[0]),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: SizedBox(
                          height: 250,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: homePage[1].length,
                              itemBuilder: (context, index) {
                                return videoCards(
                                  imageUrl: "${homePage[1][index]['image']}",
                                  name: "${homePage[1][index]['name']}",
                                  subname: "${homePage[1][index]['subname']}",
                                  hour: "${homePage[1][index]['hours']}",
                                  mintes: "${homePage[1][index]['mintes']}",
                                );
                              }),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        child: Text(
                          "Categories",
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          height: 140,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: subjectCardsBg.length,
                            itemBuilder: (context, index) {
                              return subjectcards(
                                  imageurl: "${subjectCardsBg[index]['image']}",
                                  name: "${subjectCardsBg[index]['name']}",
                                  width: 154,
                                  hegiht: 116);
                            },
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                            child: Text(
                              "Popular Courses",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: homePage[2].length,
                              itemBuilder: (context, index) {
                                return poplurcards(
                                    imageUrl: "${homePage[2][index]['image']}",
                                    name: "${homePage[2][index]['name']}",
                                    subname: "${homePage[2][index]['subname']}",
                                    time: homePage[2][index]['time']);
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
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
