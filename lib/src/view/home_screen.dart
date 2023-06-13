import 'package:flutter/material.dart';
import 'package:learn_provider/src/controller/home_provider.dart';
import 'package:learn_provider/src/model/user.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var txtConName = TextEditingController(text: "");
    var txtConEmail = TextEditingController(text: "");
    var user = context.watch<HomeProvider>().getTodoList;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Todo List"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TextFormField(
            controller: txtConName,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              constraints: const BoxConstraints(
                maxHeight: 50,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              hintText: "Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: txtConEmail,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              constraints: const BoxConstraints(
                maxHeight: 50,
              ),
              contentPadding: const EdgeInsets.symmetric(horizontal: 15),
              hintText: "Email",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                textColor: Colors.white,
                color: Colors.blue,
                onPressed: () {
                  context
                      .read<HomeProvider>()
                      .add(UserModel(txtConName.text, txtConEmail.text));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Text(
                  "Submit",
                ),
              ),
              const SizedBox(width: 20),
              MaterialButton(
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                color: Colors.red,
                onPressed: () {
                  txtConEmail.clear();
                  txtConName.clear();
                },
                child: const Text(
                  "Clear",
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          user.isNotEmpty
              ? Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: const Offset(3, 3),
                          color: Colors.grey.shade300,
                        ),
                      ]),
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: user.length,
                    itemBuilder: (context, index) {
                      return Material(
                        child: ListTile(
                          title: Text("${user[index].name}"),
                          subtitle: Text("${user[index].email}"),
                          trailing: IconButton(
                            color: Colors.red,
                            onPressed: () {
                              context.read<HomeProvider>().deleted(index);
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}
