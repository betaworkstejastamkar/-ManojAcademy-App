import 'package:flutter/material.dart';
import 'package:manojacademy/widgets/subjectcards.dart';

List topSearch = ['History', 'Scicence', ''];

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon:
                        Image.asset('navbaricons/unselected/search.png'),
                    // icon: new Icon(Icons.search),
                    labelText: "Search For Topic or Chapter",
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
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
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 0,
                              crossAxisSpacing: 10,
                              crossAxisCount: 2),
                      itemCount: subjectCardsBg.length,
                      itemBuilder: (context, index) {
                        return subjectcards(
                            imageurl: "${subjectCardsBg[index]['image']}",
                            name: "${subjectCardsBg[index]['name']}",
                            width: width / 60,
                            hegiht: height / 6);
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
