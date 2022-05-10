import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:manojacademy/widgets/popularcards.dart';

List downloadList = [
  {
    'image': 'assets/blueBox.svg',
    'name': 'English',
    'videos': [
      {
        'image': 'assets/bluebox.png',
        'subname': 'English',
        'name': 'The Living Organisms and their Surrounding',
        'time': '2:24'
      },
      {
        'image': 'assets/greenbox.png',
        'subname': 'English',
        'name': 'Weather and Climate',
        'time': '2:24'
      },
    ]
  },
  {
    'image': 'assets/greenBox.svg',
    'name': 'Maths',
    'videos': [
      {
        'image': 'assets/bluebox.png',
        'subname': 'Maths',
        'name': 'The Living Organisms and their Surrounding',
        'time': '2:24'
      },
      {
        'image': 'assets/greenbox.png',
        'subname': 'Maths',
        'name': 'Weather and Climate',
        'time': '2:24'
      },
    ]
  },
  {
    'image': 'assets/greyBox.svg',
    'name': 'Science',
    'videos': [
      {
        'image': 'assets/bluebox.png',
        'subname': 'Science',
        'name': 'The Living Organisms and their Surrounding',
        'time': '2:24'
      },
      {
        'image': 'assets/greenbox.png',
        'subname': 'Science',
        'name': 'Weather and Climate',
        'time': '2:24'
      },
    ]
  },
  {
    'image': 'assets/purpleBox.svg',
    'name': 'Hindi',
    'videos': [
      {
        'image': 'assets/bluebox.png',
        'subname': 'Hindi',
        'name': 'The Living Organisms and their Surrounding',
        'time': '2:24'
      },
      {
        'image': 'assets/greenbox.png',
        'subname': 'Hindi',
        'name': 'Weather and Climate',
        'time': '2:24'
      },
    ]
  },
];

class OfflineVideoScreen extends StatefulWidget {
  const OfflineVideoScreen({Key? key}) : super(key: key);

  @override
  State<OfflineVideoScreen> createState() => _OfflineVideoScreenState();
}

class _OfflineVideoScreenState extends State<OfflineVideoScreen> {
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
              SvgPicture.asset('icons/download.svg'),
              const SizedBox(
                width: 5,
              ),
              const Text('My Downloaded videos'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: downloadList.length,
            itemBuilder: (_, index) => dowloadedVideoCards(
                name: downloadList[index]['name'],
                imageurl: downloadList[index]['image'],
                data: downloadList[index]['videos']),
          ),
        ),
      ),
    );
  }
}

Widget dowloadedVideoCards({imageurl, name, data}) {
  return Builder(
    builder: (context) => ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => OfflineVideos(
                data: data,
              ),
            ),
          );
        },
        child: Card(
          elevation: 4,
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: SvgPicture.asset(
                  imageurl,
                  width: 50,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 8,
                  child: SvgPicture.asset('icons/arrow-right.svg')),
            ],
          ),
        ),
      ),
    ),
  );
}

class OfflineVideos extends StatefulWidget {
  final List data;
  const OfflineVideos({Key? key, required this.data}) : super(key: key);

  @override
  State<OfflineVideos> createState() => _OfflineVideosState();
}

class _OfflineVideosState extends State<OfflineVideos> {
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
              SvgPicture.asset('icons/download.svg'),
              const SizedBox(
                width: 5,
              ),
              const Text('My Downloaded videos'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView.builder(
          itemCount: widget.data.length,
          itemBuilder: (context, index) => poplurcards(
              time: widget.data[index]['time'],
              subname: widget.data[index]['subname'],
              imageUrl: widget.data[index]['image'],
              name: widget.data[index]['name']),
        ),
      ),
    );
  }
}
