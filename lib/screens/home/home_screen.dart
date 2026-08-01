import 'package:flutter/material.dart';

import '../../core/routes/app_routes.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text(
          "Lost & Found",
        ),

        actions: [

          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.pushNamed(
                context,
                "/notifications",
              );
            },
          ),

        ],
      ),


      body: SingleChildScrollView(

        padding: const EdgeInsets.all(20),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [


            // Welcome section

            const Text(
              "Hello 👋",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),


            const SizedBox(height: 5),


            const Text(
              "Find lost items. Report found items.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),



            const SizedBox(height: 30),



            // Statistics Card

            Container(

              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(

                color: Colors.blue,

                borderRadius:
                    BorderRadius.circular(20),

              ),


              child: const Row(

                mainAxisAlignment:
                    MainAxisAlignment.spaceAround,


                children: [


                  StatisticItem(
                    number: "12",
                    title: "Lost",
                  ),


                  StatisticItem(
                    number: "8",
                    title: "Found",
                  ),


                  StatisticItem(
                    number: "3",
                    title: "Claims",
                  ),

                ],

              ),

            ),



            const SizedBox(height: 35),



            const Text(

              "Quick Actions",

              style: TextStyle(

                fontSize: 22,

                fontWeight: FontWeight.bold,

              ),

            ),



            const SizedBox(height: 20),



            GridView.count(

              crossAxisCount: 2,

              shrinkWrap: true,

              physics:
                  const NeverScrollableScrollPhysics(),


              crossAxisSpacing: 15,

              mainAxisSpacing: 15,


              children: [



                ActionCard(

                  icon: Icons.report_problem,

                  title: "Report Lost",

                  color: Colors.red,

                  onTap: () {

                    Navigator.pushNamed(

                      context,

                      "/reportLost",

                    );

                  },

                ),




                ActionCard(

                  icon: Icons.card_giftcard,

                  title: "Report Found",

                  color: Colors.green,

                  onTap: () {

                    Navigator.pushNamed(
                        context,
                      AppRoutes.reportFound,
                    );

                    

            

                

                  },

                ),




                ActionCard(

                  icon: Icons.search,

                  title: "Search Items",

                  color: Colors.orange,

                  onTap: () {

                    Navigator.pushNamed(

                      context,

                      "/search",

                    );

                  },

                ),




                ActionCard(

                  icon: Icons.list_alt,

                  title: "My Reports",

                  color: Colors.purple,

                  onTap: () {

                    Navigator.pushNamed(

                      context,

                      "/reports",

                    );

                  },

                ),




                ActionCard(

                  icon: Icons.notifications,

                  title: "Notifications",

                  color: Colors.blue,

                  onTap: () {

                    Navigator.pushNamed(

                      context,

                      "/notifications",

                    );

                  },

                ),




                ActionCard(

                  icon: Icons.person,

                  title: "Profile",

                  color: Colors.teal,

                  onTap: () {

                    Navigator.pushNamed(

                      context,

                      "/profile",

                    );

                  },

                ),


              ],

            ),


          ],

        ),

      ),

    );

  }

}






class StatisticItem extends StatelessWidget {


  final String number;

  final String title;



  const StatisticItem({

    super.key,

    required this.number,

    required this.title,

  });



  @override

  Widget build(BuildContext context) {


    return Column(

      children: [


        Text(

          number,

          style: const TextStyle(

            color: Colors.white,

            fontSize: 28,

            fontWeight: FontWeight.bold,

          ),

        ),



        Text(

          title,

          style: const TextStyle(

            color: Colors.white70,

            fontSize: 16,

          ),

        ),


      ],

    );


  }

}








class ActionCard extends StatelessWidget {


  final IconData icon;

  final String title;

  final Color color;

  final VoidCallback onTap;




  const ActionCard({

    super.key,

    required this.icon,

    required this.title,

    required this.color,

    required this.onTap,

  });



  @override

  Widget build(BuildContext context) {


    return InkWell(

      onTap: onTap,


      borderRadius:
          BorderRadius.circular(20),


      child: Container(

        decoration: BoxDecoration(

          color: Colors.white,


          borderRadius:
              BorderRadius.circular(20),


          boxShadow: const [

            BoxShadow(

              blurRadius: 8,

              color: Colors.black12,

            )

          ],

        ),


        child: Column(

          mainAxisAlignment:
              MainAxisAlignment.center,


          children: [


            CircleAvatar(

              radius: 28,

              backgroundColor: color,

              child: Icon(

                icon,

                color: Colors.white,

                size: 30,

              ),

            ),



            const SizedBox(height: 12),



            Text(

              title,

              textAlign: TextAlign.center,

              style: const TextStyle(

                fontWeight: FontWeight.bold,

              ),

            ),

          ],

        ),

      ),

    );

  }

}