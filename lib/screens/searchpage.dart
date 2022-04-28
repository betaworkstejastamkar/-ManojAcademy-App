import 'package:flutter/material.dart';
import 'package:manojacademy/widgets/subjectcards.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          Column(
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
                    child: SizedBox(
                      height: height - 100,
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisSpacing: 10, crossAxisCount: 2),
                        itemCount: subjectCardsBg.length,
                        itemBuilder: (context, index) {
                          return subjectcards(
                              imageurl: "${subjectCardsBg[index]['image']}",
                              name: "${subjectCardsBg[index]['name']}",
                              width: 182,
                              hegiht: 136);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
