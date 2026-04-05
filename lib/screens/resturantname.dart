// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class ResturantPage extends StatefulWidget {
  const ResturantPage({super.key});

  @override
  State<ResturantPage> createState() => _ResturantPageState();
}

class _ResturantPageState extends State<ResturantPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Header Image
                Stack(
                 children: [
                    Container(
                      height: 250,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/food.webp'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back_ios_new , color: Colors.white,),
                      ),
                    ),
                  ],
                ),
        
                /// Restaurant Name
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 20),
                  child: SizedBox(
                    height: 40,
                    child: Text(
                      'Resturant name xxx',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
        
                /// Price + Category + Type
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 10),
                  child: Row(
                    children: [
                      Text('\$\$', style: TextStyle(color: Colors.grey)),
                      SizedBox(width: 30),
                      Text('Category'),
                      SizedBox(width: 30),
                      Text('Type'),
                    ],
                  ),
                ),
        
                /// Rating
                const Padding(
                  padding: EdgeInsets.only(left: 10, top: 8),
                  child: Row(
                    children: [
                      Text('4.3'),
                      SizedBox(width: 10),
                      Icon(Icons.star, color: Colors.orange, size: 20),
                      SizedBox(width: 10),
                      Text('200+ Rating'),
                    ],
                  ),
                ),
        
                const SizedBox(height: 15),
        
                /// Delivery Row
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Row(
                    children: [
                      const Icon(Icons.monetization_on),
                      const SizedBox(width: 5),
                      const Column(children: [Text('Free'), Text('Delivery')]),
                      const SizedBox(width: 40),
                      const Icon(Icons.access_time_filled),
                      const SizedBox(width: 5),
                      const Column(children: [Text('25'), Text('Minutes')]),
                      const Spacer(),
        
                      /// Take away button
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            color: Color.fromARGB(255, 147, 24, 24),
                            width: 2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Take away',
                          style: TextStyle(
                            color: Color.fromARGB(255, 147, 24, 24),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        
                const SizedBox(height: 20),
        
                /// Featured items
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Featured items', style: TextStyle(fontSize: 16)),
                ),
        
                const SizedBox(height: 20),
        
                /// Horizontal items
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(4, (index) {
                      return 
                      InkWell(
  onTap: () {
    // أي أكشن انت عايزه هنا
  },
  borderRadius: BorderRadius.circular(18),
  child: Padding(
    padding: const EdgeInsets.only(left: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 147, 24, 24),
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        const SizedBox(height: 5),
        const Text('Item name'),
        const Row(
          children: [
            Text('\$\$'),
            SizedBox(width: 5),
            Text('Category'),
          ],
        ),
      ],
    ),
  ),
);

                    }),
                  ),
                ),
        
                const SizedBox(height: 20),
        
                /// Categories horizontal buttons
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(5, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0,
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          onPressed: () {},
                          child: const Text('Category'),
                        ),
                      );
                    }),
                  ),
                ),
        
                /// Most popular
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 20, 0, 10),
                  child: Text('Most popular', style: TextStyle(fontSize: 15)),
                ),
        
                /// Popular item card
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, "/itemname");
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                           
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage("https://cdn.britannica.com/08/177308-050-94D9D6BE/Food-Pizza-Basil-Tomato.jpg"),
                          fit: BoxFit.fill,
                        ),
                        color: Colors.grey,
                        shape: BoxShape.circle,
                      ),
                          width: 100,
                          height: 100,
                          // decoration: BoxDecoration(
                          //   color: Color.fromARGB(255, 147, 24, 24),
                          //   borderRadius: BorderRadius.circular(18),
                          // ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Item name'),
                              SizedBox(height: 5),
                              Text('xxxxxxxxxxxxx'),
                              Text('xxxxxxx'),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('200 EGP'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                InkWell(
                  onTap: () {
                    // Any action you want here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 147, 24, 24),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Item name'),
                              SizedBox(height: 5),
                              Text('xxxxxxxxxxxxx'),
                              Text('xxxxxxx'),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('200 EGP'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
        
                InkWell(
                  onTap: () {
                    // Any action you want here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 147, 24, 24),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Item name'),
                              SizedBox(height: 5),
                              Text('xxxxxxxxxxxxx'),
                              Text('xxxxxxx'),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('200 EGP'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               
                SizedBox(height: 10),
        
                InkWell(
                  onTap: () {
                    // Any action you want here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 147, 24, 24),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Item name'),
                              SizedBox(height: 5),
                              Text('xxxxxxxxxxxxx'),
                              Text('xxxxxxx'),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('200 EGP'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
        
                InkWell(
                  
                  onTap: () {
                    // Any action you want here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 147, 24, 24),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Item name'),
                              SizedBox(height: 5),
                              Text('xxxxxxxxxxxxx'),
                              Text('xxxxxxx'),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('200 EGP'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              
              
              
                const Divider(thickness: 2),
                const Padding(
                   padding: EdgeInsets.all(10),
                  child: Text('Category', style: TextStyle(fontSize: 15)),
                ),
                
                InkWell(
                  onTap: () {
                    // Any action you want here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 147, 24, 24),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Item name'),
                              SizedBox(height: 5),
                              Text('xxxxxxxxxxxxx'),
                              Text('xxxxxxx'),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('200 EGP'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                       SizedBox(height: 10,),
        
                InkWell(
                  onTap: () {
                    // Any action you want here
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 147, 24, 24),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Item name'),
                              SizedBox(height: 5),
                              Text('xxxxxxxxxxxxx'),
                              Text('xxxxxxx'),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('200 EGP'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                       SizedBox(height: 10,),
        
                InkWell(
                  onTap: () {
                    // Any action you want here
                  },  
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 147, 24, 24),
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Item name'),
                              SizedBox(height: 5),
                              Text('xxxxxxxxxxxxx'),
                              Text('xxxxxxx'),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Text('200 EGP'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               
        
                SizedBox(height: 10,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
