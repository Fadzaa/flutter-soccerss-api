import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hit_api/DetailPage.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:hit_api/PremiereLeagueModel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PremiereLeagueModel? premiereLeagueModel;
  bool isLoaded = true;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAllListPL();
  }

  void getAllListPL() async{
    setState(() {
      isLoaded = false;
    });

    final res = await http.get(
        Uri.parse(
            "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League"
        )
    );
    print("status code : " + res.statusCode.toString());

    premiereLeagueModel =
        PremiereLeagueModel.fromJson(json.decode(res.body.toString()));
    print("team 0 : " + premiereLeagueModel!.teams![0].strTeam.toString());

    setState(() {
      isLoaded = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(125, 255, 255,1),
      body:Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            //White Circles
            Positioned(
                top: 0,
                left: 0,
                child: SvgPicture.asset("assets/BigCircles.svg")
            ),

            //Soccers Text
            Positioned(
              top: 50,
              right: 37,
                child: Text("Soccers",style: TextStyle(
                  color: Colors.white,
                  fontSize: 34,
                  fontWeight: FontWeight.w700,
                ),)),

            //Side Text #1
            Positioned(
                top: 110,
                left: 120,
                child: Text("Know more about",style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w200,
                ),)),

            //Side Text #2
            Positioned(
                top: 140,
                right: 10,
                child: Text("your Favourite Team",style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w200,
                ),)),

            //White Line
            Align(
              alignment: Alignment(0.0, -0.47),
                child: Divider(
                  color: Colors.white,
                  height: 25,
                  thickness: 2,
                  indent: 5,
                  endIndent: 5,
                )
            ),

            //Body Container
            Align(
              alignment: Alignment(0.0, 1),
              child: BodyContainer(child: Stack(
                children: [
                  Positioned(
                      top: 12,
                      left: 5,
                      child: Text("League English Premier",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                          fontSize: 18,
                        ) ,)),

                  //Container Logo
                  Positioned(
                    top: 50,
                    child: Container(
                      width: 400,
                      height: 100,
                      child: isLoaded ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: premiereLeagueModel!.teams!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          myTeam: premiereLeagueModel!.teams![index])),
                                );
                              },
                              child: Container(
                                height: 80,
                                width: 95,
                                margin: EdgeInsets.only(bottom: 5),

                                child: Card(
                                  color: Color.fromRGBO(236, 239, 239, 1.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),

                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0.0),
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          child: Image.network(
                                              premiereLeagueModel!.teams![index].strTeamBadge.toString()),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                      ): Center(child : CircularProgressIndicator()),
                    ),
                  ),

                  //Jersey Text
                  Positioned(
                    top: 160,
                    left: 2,
                    child: Text("Go Check out your Favourite Team Jersey",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 17,
                      ),
                    ),
                  ),

                  //Container Jersey
                  Positioned(
                    top: 194,
                    child: Container(
                      width: 400,
                      height: 100,
                      child: isLoaded ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: premiereLeagueModel!.teams!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          myTeam: premiereLeagueModel!.teams![index])),
                                );
                              },
                              child: Container(
                                height: 80,
                                width: 95,
                                margin: EdgeInsets.only(bottom: 5),

                                child: Card(
                                  color: Color.fromRGBO(236, 239, 239, 1.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),

                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment: Alignment(0.0, 0.0),
                                        child: Container(
                                          height: 70,
                                          width: 70,
                                          child: Image.network(
                                              premiereLeagueModel!.teams![index].strTeamJersey.toString()),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }
                      ): Center(child : CircularProgressIndicator()),
                    ),
                  ),

                  //Details Text
                  Positioned(
                    bottom: 150,
                    left: 7,
                    child: Text("Details Team",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    ),
                  ),

                  //Container Details Team
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: 400,
                      height: 148,
                      child: isLoaded ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: premiereLeagueModel!.teams!.length,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => DetailPage(
                                          myTeam: premiereLeagueModel!.teams![index])),
                                );
                              },
                              child: Container(
                                height: 148,
                                width: 189,
                                margin: EdgeInsets.only(bottom: 5),

                                child: Card(
                                  color: Color.fromRGBO(236, 239, 239, 1.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),

                                  child: Image.network(
                                    premiereLeagueModel!.teams![index].strTeamFanart1.toString(),
                                    fit: BoxFit.cover,),
                                ),
                              ),
                            );
                          }
                      ) : Center(child : CircularProgressIndicator()),
                    ),
                  ),
                ],
              ),),
            ),

            //English Text


          ],
        ),
      ),
    );
  }
}

class BodyContainer extends StatelessWidget {
  final Widget child;
  const BodyContainer({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.7,horizontal: 7),
      height: size.height * 0.62,
      width: double.infinity,
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(25),topRight: Radius.circular(25)),
      ),
      child: child,
    );
  }
}

class CardContainer extends StatelessWidget {
  final Widget child;
  const CardContainer({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.7,horizontal: 18),
      height: 82,
      width: 80,
      decoration:BoxDecoration(
          color: Color.fromRGBO(224, 230, 231, 0.6),
          borderRadius: BorderRadius.circular(15),
      ),
      child: child,
    );
  }
}