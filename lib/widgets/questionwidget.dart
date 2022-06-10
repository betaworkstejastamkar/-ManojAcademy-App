import 'package:flutter/material.dart';

class McqCards extends StatefulWidget {
  final int index, marks;
  final String question;
  final List answers;
  const McqCards(
      {Key? key,
      required this.index,
      required this.question,
      required this.marks,
      required this.answers})
      : super(key: key);

  @override
  State<McqCards> createState() => _McqCardsState();
}

class _McqCardsState extends State<McqCards> {
  List points = ['A', 'B', 'C', 'D', 'E'];
  int selected = 0;

  @override
  void initState() {
    super.initState();
    selected = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            Text(
              'Q ${widget.index}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              '${widget.marks} Marks',
              style: const TextStyle(
                  color: Color.fromRGBO(165, 153, 153, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          ]),
          const Divider(
            thickness: 0.5,
            color: Color.fromRGBO(196, 196, 196, 1),
          ),
          Text(
            widget.question,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          ListView.builder(
            itemCount: widget.answers.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      if (selected == index + 1) {
                        selected = 0;
                      } else {
                        selected = index + 1;
                      }
                    });
                  },
                  child: Row(
                    children: [
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          color: selected == index + 1
                              ? Theme.of(context).primaryColor
                              : Colors.white,
                          borderRadius: BorderRadius.circular(40),
                          border: selected == index + 1
                              ? Border.all(
                                  style: BorderStyle.none,
                                )
                              : Border.all(
                                  width: 1,
                                  color: const Color.fromRGBO(165, 153, 153, 1),
                                  style: BorderStyle.solid,
                                ),
                        ),
                        child: Center(
                          child: selected == index + 1
                              ? Text(points[index],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white))
                              : Text(points[index],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.black)),
                        ),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      Text(widget.answers[index],
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                              color: Colors.black)),
                      const Spacer(
                        flex: 9,
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ShortAnsCard extends StatefulWidget {
  final int index, marks;
  final String question;
  const ShortAnsCard({
    Key? key,
    required this.index,
    required this.question,
    required this.marks,
  }) : super(key: key);

  @override
  State<ShortAnsCard> createState() => _ShortAnsCardState();
}

class _ShortAnsCardState extends State<ShortAnsCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(children: [
            Text(
              'Q ${widget.index}',
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            const Spacer(),
            Text(
              '${widget.marks} Marks',
              style: const TextStyle(
                  color: Color.fromRGBO(165, 153, 153, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w300),
            ),
          ]),
          const Divider(
            thickness: 0.5,
            color: Color.fromRGBO(196, 196, 196, 1),
          ),
          Text(
            widget.question,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w400, color: Colors.black),
          ),
          TextField(
            maxLines: 5,
            textAlignVertical: TextAlignVertical.top,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintText: 'Type your Answer',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide.none),
              filled: true,
              fillColor: const Color.fromRGBO(196, 196, 196, 0.5),
            ),
          )
        ],
      ),
    );
  }
}
