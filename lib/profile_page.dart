import 'dart:html' as html;

import 'package:flutter_web/material.dart';
import 'package:portfolio/responsive_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ResponsiveWidget(
      largeScreen: Scaffold(
        //  appBar: AppBar(
        //    leading: RaisedButton(
        //       shape: RoundedRectangleBorder(),
        //       child: Text("Back"),
        //       color: Colors.red,
        //       onPressed: () {
        //         Navigator.pop(context,true);
        //       },
        //       padding: EdgeInsets.all(5),
        //   ),
        //   title: Text("Portfolio"),
        //  ),

        drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
            child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              // NavButton(
              //   text: "about",
              //   onPressed: () {},
              // ),
              // NavButton(
              //   text: "work",
              //   onPressed: () {},
              // ),
              // NavButton(
              //   text: "contact",
              //   onPressed: () {},
              // )
            ],
            )
          )
        : null,
        body: SingleChildScrollView(
          child: AnimatedPadding(
            duration: Duration(seconds: 1),
            padding: EdgeInsets.all(MediaQuery.of(context).size.height * 0.1),
            child: ResponsiveWidget(
              largeScreen: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                    NavHeader(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    ProfileInfo(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.2,
                    ),
                    MitoInfo(),
                    SocialInfo()
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}

class NavHeader extends StatelessWidget {
  Widget build(BuildContext context){
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: ResponsiveWidget.isSmallScreen(context)
        ? MainAxisAlignment.center
        : MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        PKDot(),
        if (!ResponsiveWidget.isSmallScreen(context))
          Row(
            children: <Widget>[
              // NavButton(
              //   text: "about",
              //   onPressed: () {},
              // ),
              // NavButton(
              //   text: "work",
              //   onPressed: () {},
              // ),
              // NavButton(
              //   text: "contact",
              //   onPressed: () {},
              // )
            ],
          )
      ],
      )
    );
  }
}

class PKDot extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          "PA",
          textScaleFactor: 2,
          style: TextStyle(
            fontWeight: FontWeight.bold
          )
        ),
        SizedBox(
          width: 5,
        ),
        AnimatedContainer(
          duration: Duration(seconds: 1),
          height: 8,
          width: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue
          ),
        )
      ],
    );
  }
}

class NavButton extends StatelessWidget {

  final text;
  final onPressed;
  final Color color;

  const NavButton(
    {
      Key key,
      @required this.text,
      @required this.onPressed,
      this.color = Colors.orange
    }
  ) : super(key: key);

  @override
  Widget build(BuildContext context){
    return OutlineButton(
      child: Text(text),
      borderSide: BorderSide(
        color: color
      ),
      onPressed: onPressed,
      highlightedBorderColor: color,

    );
  }
}



class ProfileInfo extends StatelessWidget {
  profileImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.25
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          backgroundBlendMode: BlendMode.luminosity,
          color: Colors.amber,
//            borderRadius: BorderRadius.circular(40),
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage("weingarten.jpeg"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        '\$whoami',
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange, fontFamily: ""),
      ),
      Text(
        ">Peter Ajayi",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 48,
          fontFamily: ""
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "I am a developer with general interest in all areas of technology\n"
        "I'm always eager to broaden my skillset and knowledge.\n"
        "If I’m not busy I’ll be found playing video games or\nflying racing drones!",
        softWrap: true,
        // textScaleFactor: 1.0,
        style: TextStyle(color: Colors.white70, fontSize: 18, fontFamily: ""),
        
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("GitHub"),
            color: Colors.red,
            
            onPressed: () {
              html.window.open("https://github.com/BeIllegalBeagle?tab=repositories", "dd");
            },
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          // OutlineButton(
          //   borderSide: BorderSide(
          //     color: Colors.red,
          //   ),
          //   shape: StadiumBorder(),
          //   child: Text("Say Hi!"),
          //   color: Colors.red,
          //   onPressed: () {},
          //   padding: EdgeInsets.all(10),
          // )
        ],
      ),
      SizedBox(
        height: 20,
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[profileImage(context),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.02),
                   profileData],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          profileImage(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData
        ],
      ),
    );
  }

}

class MitoInfo extends StatelessWidget {
  mitoScreenImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.90
            : MediaQuery.of(context).size.width * 0.50,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.45
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("posts.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

    mitoScreenImage2(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.90
            : MediaQuery.of(context).size.width * 0.50,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.45
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("create_cell.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

    mitoScreenImage3(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.90
            : MediaQuery.of(context).size.width * 0.50,
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.45
            : MediaQuery.of(context).size.width * 0.25,
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("immortal_screen.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

       readStoryBtn(context) => RaisedButton(
            shape: StadiumBorder(),
            child: Text("Read Story"),
            color: Colors.red,
            
            onPressed: () {
               Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
            },
            padding: EdgeInsets.all(10),
          );

  final profileData = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
        "iOS Development",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange),
      ),
      Text(
        "Mito",
        style: TextStyle(
          fontFamily: "",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 48
        ),
      ),
      Text(
        "a way to dynamically grow nano communities",
        style: TextStyle(
          fontFamily: "",
          color: Colors.white60,
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
      ),
      SizedBox(
        height: 10,
      ),
      RichText(
        maxLines: 60,
        text: TextSpan(children: [
          TextSpan(text: "The UI for the sign up section and settings is created using\n"
        "storyboards, the rest of the apps ui is made programmatically.\n"
        "The app uses", style: TextStyle(color: Colors.white70, fontSize: 18)),
          TextSpan(text: ' IBoutlets and autolayout', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18)
          ),
          TextSpan(text: " for button actions and storyboarded ui layout.\n\n",
          style: TextStyle(color: Colors.white70, fontSize: 18)),
        
        ])
      ),
      SizedBox(
        height: 20,
      ),
      RichText(
        maxLines: 800,
        textAlign: TextAlign.justify,
        text: TextSpan(children: [
           TextSpan(text: "I used the ",
            style: TextStyle(color: Colors.white70, fontSize: 18)
          ),
          TextSpan(text: "Target-Action pattern ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18
            ),
          ),
          TextSpan(text: "for programmatical button and ",
            style: TextStyle(color: Colors.white70, fontSize: 18)
          ),
          TextSpan(text: "\ngesture actions. Frameworks",
            style: TextStyle(color: Colors.white70, fontSize: 18)
          ),
          TextSpan(
            text: " NSLayout and Snapkit ",
            style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18
            ),
          ),
           TextSpan(
           text: "were used",
          style: TextStyle(color: Colors.white70, fontSize: 18)
         ),
           TextSpan(
           text: "\nfor the programmatic layout of ui elements",
          style: TextStyle(color: Colors.white70, fontSize: 18)
         )
        ])
        ),
        RichText(
          maxLines: 60,
          textAlign: TextAlign.justify,
          text: TextSpan(children: [
            TextSpan(
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18),
              text:"\nThe different sections for 'posts' and 'cells' was made\n"
            "using a wrapper library for "
            ),
            TextSpan(text: 'UIPageController',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18
              ),
            ),
          ])
        ),
        RichText(
          maxLines: 60,
          textAlign: TextAlign.justify,
          text: TextSpan(children: [
             TextSpan(
            style: TextStyle(color: Colors.white70, fontSize: 18),
            text: "I created highly reusable " ),
            TextSpan(text: 'UICollectionview and UITableviewcell', style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 18),
          ),TextSpan(
            style: TextStyle(color: Colors.white70, fontSize: 18),
            text: "\nclasses to have users interact with groups and view content"),])
        ),
      SizedBox(
        height: 20,
      ),
      Text(
        "\nChallenge",
        style: TextStyle(
          fontFamily: "",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "I used a cryptocurrency called nano for the points of the\n"
        "network and individual users have their own crypto-wallet to \n"
        "accept funds they must also confirm transactions with their private\n"
        "keys for blocks to be accepted on the nano blockchain. Towards\n"
        "the end of development a third party REST API I used for the\n"
        "transmission and retrieval of new blocks shut their services down.\n\n"
        "I solved this by running my own nano node on AWS and making a\n"
        "small Elixir script so that blocks can be confirmed. I also\n"
        "created an MQTT broker to publish new user transactions\n"
        "received by the node.\n",
        style: TextStyle(
          fontFamily: "",
          color: Colors.white60,
          fontSize: 18
        ),
      ),
       SizedBox(
        height: 20,
      ),
      Text(
        "Highlights",
        style: TextStyle(
          fontFamily: "",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 24
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "Because the groups where users commuicate are temporary\n"
        "I created a custom animaton using Core Animation to\n"
        "trigger upon receiving a group experation message via\nMQTT.\n\n"
        "Learned to write complex UI programmatically with NSlayout\n"
        "and Snapkit. Also used UIBezierPath to create custom shapes\nsuch as the X shaped genome button.\n\n"
        "Used Elixir to implement push notifications when a user gets\n"
        "a reply.\n\n"
        "Implemented onboarding with 'Signin with Apple' and a\ndecentralised service called Blockstack",
        style: TextStyle(
          fontFamily: "",
          color: Colors.white60,
          fontSize: 18
        ),
      ),
       SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            shape: StadiumBorder(),
            child: Text("View on AppStore"),
            color: Colors.red,
            onPressed: () {
              html.window.open("https://apps.apple.com/us/app/mito/id1460578918?ls=1", "dd");
            },
            padding: EdgeInsets.all(10),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              mitoScreenImage(context),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              mitoScreenImage2(context),
              SizedBox(height: MediaQuery.of(context).size.width * 0.03),
              mitoScreenImage3(context)
            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
         Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[        
             profileData,
            //  readStoryBtn(context)
             ],
          )
          ],
      ),
      smallScreen: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          mitoScreenImage(context),
          SizedBox(height: MediaQuery.of(context).size.width * 0.03),
          mitoScreenImage2(context),
          SizedBox(height: MediaQuery.of(context).size.width * 0.03),
          mitoScreenImage3(context),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          profileData
        ],
      ),
    );
  }

}

class SocialInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              NavButton(
                text: "Github",
                onPressed: () {
                  html.window.open("https://github.com/BeIllegalBeagle?tab=repositories", "dd");
                },
                color: Colors.blue,
              ),
            ],
          ),
          Text(
            "Peter Ajayi ©️2020",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
      smallScreen: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NavButton(
            text: "Github",
            onPressed: () {
              html.window.open("https://github.com/BeIllegalBeagle?tab=repositories", "dd");
            },
            color: Colors.blue,
          ),
          Text(
            "Peter Ajayi ©️2020",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
