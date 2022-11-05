import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'PremiereLeagueModel.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DetailPage extends StatefulWidget {
  final Teams myTeam;
  const DetailPage({Key? key, required this.myTeam}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(125, 255, 255,1),
      body: Container(
        width: double.infinity,
        height: size.height,
        child:Stack(
          children: [
            //Circles Top White
            Positioned(
                child: SvgPicture.asset("assets/circlesWhite.svg"),
            ),

            //Details Team Text
            Align(
              alignment: Alignment(0.0, -0.75),
                child: Text("Details Team",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w700
                ),),
            ),

            //White Logo
            Align(
              alignment: Alignment(0.0, -0.55),
              child: Container(
                width: 105,
                height: 105,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0.7,
                        blurRadius: 4,
                        offset: Offset(0, 0.6),
                      )
                    ]
                ),
                child: SvgPicture.asset("assets/whiteLogo.svg"),
              )

            ),

            //Team Badge
            Align(
              alignment: Alignment(0.0, -0.59),
              child: Container(

                margin: EdgeInsets.only(left: 30, right: 30, top: 30),
                height: 80,
                width: 80,
                child: Image.network(widget.myTeam.strTeamBadge.toString()),
              ),
            ),

            //Team Name
            Align(
              alignment: Alignment(0.0, -0.3),
              child: Text("${widget.myTeam.strTeam}",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color.fromRGBO(70, 62, 62, 1),
                  fontSize: 18,
                ),) ,
            ),

            //Body Container
            Align(
              alignment: Alignment(0.0, 1),
                child: BodyContainer(
                    child: Stack(
                      children:  [
                        //League Text
                        Positioned(
                            top: 15,
                            left: 5,
                            child: Text("League :",
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(70, 62, 62, 1),
                              fontSize: 16,
                            ),)),

                        //API League
                        Positioned(
                        top: 15,
                        left: 75,
                        child: Text(
                          "${widget.myTeam.strLeague}",
                          style: TextStyle(
                            color: Color.fromRGBO(70, 62, 62, 1),
                            fontSize: 15,
                          ),
                        )),

                        //Stadium Text
                        Positioned(
                          top: 45,
                            left: 5,
                            child: Text("Stadium Name : ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(70, 62, 62, 1),
                                fontSize: 16,
                              ),)),

                        //API Stadium
                        Positioned(
                            top: 45,
                            left: 138,
                            child: Text(
                              "${widget.myTeam.strStadium}",
                              style: TextStyle(
                                color: Color.fromRGBO(70, 62, 62, 1),
                                fontSize: 15,
                              ),
                            )),

                        //Year Text
                        Positioned(
                          top: 75,
                            left: 5,
                            child: Text("Formed Year : ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(70, 62, 62, 1),
                                fontSize: 16,
                              ),)),

                        //API Year
                        Positioned(
                            top: 75,
                            left: 119,
                            child: Text(
                              "${widget.myTeam.intFormedYear}",
                              style: TextStyle(
                                color: Color.fromRGBO(70, 62, 62, 1),
                                fontSize: 15,
                              ),
                            )),

                        //Stadium Location Text
                        Positioned(
                            top: 103,
                            left: 5,
                            child: Text("Stadium Location : ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(70, 62, 62, 1),
                                fontSize: 15,
                              ),)),

                        //API Location
                        Positioned(
                            top: 104.5,
                            left: 147,
                            child: Text(
                              "${widget.myTeam.strStadiumLocation}",

                              style: TextStyle(
                                color: Color.fromRGBO(70, 62, 62, 1),
                                fontSize: 14,
                              ),
                            )),

                        //Description Text
                        Positioned(
                            top: 140,
                            left: 3,
                            child: Text("Description : ",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromRGBO(70, 62, 62, 1),
                                fontSize: 20,
                              ),)),

                        //Description Container
                        Align(
                          alignment: Alignment(0.0, 0.95),
                          child : DescriptionContainer(
                              child: SingleChildScrollView(
                                  child: Text("${widget.myTeam.strDescriptionEN}")
                              )
                          )
                        )


                      ],
                    )),),


            ],
        )

        // Center(
        //   child: Column(
        //     children: [
        //       Column(
        //         children: [
        //           Container(
        //             margin: EdgeInsets.only(left: 30,right: 30, top: 30),
        //             height: 120,
        //             width: 120,
        //             child: Image.network(widget.myTeam.strTeamBadge.toString()),
        //           ),
        //           Container(
        //             margin: EdgeInsets.only(left: 30,right: 30),
        //             height: 300,
        //             width: 300,
        //             child: Image.network(widget.myTeam.strTeamBanner.toString()),
        //           ),
        //         ],
        //       ),
        //       Center(
        //
        //         child: Text("Team Name :${widget.myTeam.strTeam}", textAlign: TextAlign.center,),
        //       ),
        //       Center(
        //         child: Text("Stadium Name : ${widget.myTeam.strStadium}",textAlign: TextAlign.center,),
        //       ),
        //     ],
        //   ),
        // ),
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
      padding: EdgeInsets.symmetric(vertical: 3,horizontal: 12),
      height: size.height * 0.6,
      width: size.width * 0.93,
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }

}

class DescriptionContainer extends StatelessWidget {
  final Widget child;
  const DescriptionContainer({
    Key? key, required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7.7,horizontal: 18),
      height: size.height * 0.36,
      width: size.width * 0.9,
      decoration:BoxDecoration(
        color: Color.fromRGBO(224, 230, 231, 1),
        borderRadius: BorderRadius.circular(30),
      ),
      child: child,
    );
  }

}
