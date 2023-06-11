import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //create serach bar
          // TextField(
          //   decoration: InputDecoration(
          //     hintText: 'Search',
          //     prefixIcon: Icon(Icons.search),
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(10),
          //     ),
          //   ),
          // ),

          //create drop down button for city from
          DropdownButtonFormField(
            decoration: InputDecoration(
              hintText: 'City From',
              prefixIcon: Icon(Icons.location_city),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            items: [
              DropdownMenuItem(
                child: Text('Dhaka'),
                value: 'Dhaka',
              ),
              DropdownMenuItem(
                child: Text('Sylhet'),
                value: 'Sylhet',
              ),
              DropdownMenuItem(
                child: Text('Chittagong'),
                value: 'Chittagong',
              ),
              DropdownMenuItem(
                child: Text('Rajshahi'),
                value: 'Rajshahi',
              ),
              DropdownMenuItem(
                child: Text('Khulna'),
                value: 'Khulna',
              ),
            ],
            onChanged: (value) {},
          ),

          SizedBox(height: 10,),

          //create drop down button for city to
          DropdownButtonFormField(
            decoration: InputDecoration(
              hintText: 'City To',
              prefixIcon: Icon(Icons.location_city),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            items: [
              DropdownMenuItem(
                child: Text('Dhaka'),
                value: 'Dhaka',
              ),
              DropdownMenuItem(
                child: Text('Sylhet'),
                value: 'Sylhet',
              ),
              DropdownMenuItem(
                child: Text('Chittagong'),
                value: 'Chittagong',
              ),
              DropdownMenuItem(
                child: Text('Rajshahi'),
                value: 'Rajshahi',
              ),
              DropdownMenuItem(
                child: Text('Khulna'),
                value: 'Khulna',
              ),
            ],
            onChanged: (value) {},
          ),

          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //create date and time picker using date picker
              // ElevatedButton(
              //   onPressed: () {
              //     showDatePicker(
              //       context: context,
              //       initialDate: DateTime.now(),
              //       firstDate: DateTime.now(),
              //       lastDate: DateTime(2000),
              //     );
              //   },
              //   child: Text('Date'),
              // ),


            ],
          ),

        ],
      ),),
    );
  }
}
