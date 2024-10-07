import 'package:cook_project/service/auth_api.dart';

import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFFfa9a0c),
                    shape: const ContinuousRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12))),
                    minimumSize: const Size(400, 50)),
                onPressed: () {},
                child: const Text(
                  "Add Meal",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              FutureBuilder(
                future: fetchMeal(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return SizedBox(
                      height: 600,
                      width: 800,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: snapshot.data!.meals.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin:const EdgeInsets.all(10),
                            height: 150,
                            width: 800,
                            color: Colors.white,
                            child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 130,
                                    width: 100,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          top: 45, left: 10),
                                      child: ListView.builder(
                                        itemCount: snapshot
                                            .data!.meals[index].images.length,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return Image.network(
                                            snapshot.data!.meals[index]
                                                .images[index],
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        snapshot.data!.meals[index].name,
                                        style: const TextStyle(
                                          color: Colors.black,
                                          fontSize: 21,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        snapshot.data!.meals[index].description,
                                        style: const TextStyle(
                                          color: Colors.grey,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            snapshot.data!.meals[index].price
                                                .toString(),
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          const Text(
                                            "LE",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 16,
                                              fontWeight: FontWeight.normal,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 125),
                                    child: Image.asset("asset/image 46.png"),
                                  ),
                                ]),
                          );
                        },
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.hasError.toString());
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
