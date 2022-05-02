import 'package:flutter/material.dart';

List plandata = [
  {
    'months': 24,
    'amount': '₹ 18,999',
  },
  {
    'months': 12,
    'amount': '₹ 14,999',
  },
  {
    'months': 6,
    'amount': '₹ 9,999',
  },
  {
    'months': 3,
    'amount': '₹ 7,999',
  },
];

class SubPlanPage extends StatefulWidget {
  const SubPlanPage({Key? key}) : super(key: key);

  @override
  State<SubPlanPage> createState() => _SubPlanPageState();
}

class _SubPlanPageState extends State<SubPlanPage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
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
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Image.asset('icons/logo.png'),
          )
        ],
        elevation: 1,
        title: Padding(
          padding: const EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Row(
            children: [
              Image.asset('icons/Wallet2.png'),
              const SizedBox(
                width: 5,
              ),
              const Text('Subscription Plan'),
            ],
          ),
        ),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        // centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Choose You Manoj Sir Academy Subscription',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5),
                        child: Row(
                          children: [
                            Image.asset('icons/check-circle.png'),
                            const Text(
                              ' Watch videos anytime',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Image.asset('icons/check-circle.png'),
                            const Text(
                              ' Test Series',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Image.asset('icons/check-circle.png'),
                            const Text(
                              ' Live Sessions',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            Image.asset('icons/check-circle.png'),
                            const Text(
                              ' Certificate',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: SizedBox(
                  height: height,
                  child: ListView.builder(
                      itemCount: plandata.length,
                      itemBuilder: (context, index) {
                        return planCards(
                            months: "${plandata[index]['months']}",
                            amount: "${plandata[index]['amount']}");
                      }),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

Widget planCards({months, amount}) {
  return Padding(
    padding: const EdgeInsets.all(5.0),
    child: Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromRGBO(196, 196, 196, 1)),
        borderRadius: BorderRadius.circular(1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Row(
          children: [
            Image.asset('icons/points.png'),
            const SizedBox(
              width: 10,
            ),
            Text(
              '$months Months',
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
            const Spacer(),
            Text(
              amount,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Image.asset('icons/arrow-right.png')
          ],
        ),
      ),
    ),
  );
}
