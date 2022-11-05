import 'package:flutter/material.dart';
import 'package:hit_api/DetailPage.dart';
import 'package:hit_api/PremiereLeagueModel.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/flutter_svg.dart';

class listFootball extends StatefulWidget {
  const listFootball({Key? key}) : super(key: key);

  @override
  State<listFootball> createState() => _listFootballState();
}

class _listFootballState extends State<listFootball> {
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
      backgroundColor: Color.fromRGBO(255, 255, 255, 0),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Top Layer
            Container(
              width: double.infinity,
              height: 270,
              color: Color.fromRGBO(125, 255, 255, 1),
              child: Stack(
                children: [
                  //White Circles
                  Positioned(
                      top: 0,
                      left: 0,
                      child: SvgPicture.asset("assets/circlesWhite.svg")),

                  //Title Text
                  Align(
                    alignment: Alignment(0.7, -0.5),
                    child: Text(
                      "Search Teams",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  //Search Bar
                  Align(
                      alignment: Alignment(0.0, 0.45),
                      child: FieldFunction(
                          child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search Here...',
                        ),
                      ))),
                ],
              ),
            ),


            //ScrollLayer
            Container(

              color: Color.fromRGBO(125, 255, 255, 1),
              width: double.infinity,
              height: size.height * 0.59,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment(0.0, 0.0),
                    child: BodyContainer(child:
                    isLoaded ? ListView.builder(
                        itemCount: premiereLeagueModel!.teams!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DetailPage(myTeam: premiereLeagueModel!.teams![index])),
                              );
                            },
                            child: Align(
                              child: Container(
                                height: 100,
                                width: 340,
                                margin: EdgeInsets.only(bottom: 5),
                                child: Card(
                                  color: Color.fromRGBO(236, 239, 239, 1.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(20))
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        left:13,
                                        top: 10,
                                        bottom: 10,
                                        child: Container(
                                          height: 50,
                                          width: 50,
                                          child: Image.network(premiereLeagueModel!.teams![index].strTeamBadge.toString()),
                                        ),
                                      ),

                                      Positioned(
                                        top: 15,
                                        left: 75,
                                        child: Text(premiereLeagueModel!.teams![index].strTeam.toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18,
                                          ),),
                                      ),

                                      Positioned(
                                        top: 47,
                                        left: 75,
                                        child: Text(premiereLeagueModel!.teams![index].strStadium.toString()
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        }

                    ) : Center(child : CircularProgressIndicator()),),
                  ),



                ],
              )
            ),
          ],
        ),
      ),
    );
  }
}

class FieldFunction extends StatelessWidget {
  final Widget child;
  const FieldFunction({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 18),
      height: size.height * 0.075,
      width: size.width * 0.85,
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
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
      padding: EdgeInsets.symmetric(vertical: 0,horizontal: 18),
      height: size.height,
      width: size.width * 0.95,
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
      ),
      child: child,
    );
  }

}


