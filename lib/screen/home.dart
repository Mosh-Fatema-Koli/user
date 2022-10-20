import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user/model/user_model.dart';
import 'package:user/provider/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState

    // getAllOrders();
    Provider.of<CategoryProvider>(context, listen: false).getCategory();
    super.initState();
  }

  Widget build(BuildContext context) {
    final users = Provider.of<CategoryProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("USER")),
        backgroundColor: Colors.red,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
              height: 210,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: users.categoryList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      height: 180,
                      width: 150,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.amber),
                      child: Column(
                        children: [
                          Icon(
                            Icons.person_rounded,
                            size: 80,
                          ),
                          Text(
                              "${users.categoryList[index].data?.first.firstName ?? ""}"),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.green,
                                    ),
                                    onPressed: () {},
                                    child: Text("Edit")),
                              )),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: TextButton(
                                    style: TextButton.styleFrom(
                                      backgroundColor: Colors.red,
                                      foregroundColor: Colors.white,
                                    ),
                                    onPressed: () {},
                                    child: Text("Delete")),
                              )),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              )),
        ],
      ),
      floatingActionButton: _buttonVisiable
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.red,
              child: Icon(
                Icons.add,
                size: 30,
                color: Colors.white,
              ),
            )
          : null,
    );
  }

  bool onProgress = false;

  bool _buttonVisiable = true;
  ScrollController? _scrollController;
}
