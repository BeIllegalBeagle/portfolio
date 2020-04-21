import 'dart:html' as html;

import 'package:platform_detect/platform_detect.dart';
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

 final boldFont = browser.isSafari
    ? "helvetica"
    : "roboto";

 final gitLogo = Container(
    height: 35,
    width: 35,
    decoration: BoxDecoration(
      // backgroundBlendMode: BlendMode.luminosity,
      // color: Colors.white,
//            borderRadius: BorderRadius.circular(40),
      // shape: BoxShape.rectangle,
      image: DecorationImage(
        image: AssetImage("gitLogo.png"),
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    ),
  );

  final appleLogo = Container(
    height: 30,
    width: 30,
    decoration: BoxDecoration(
      // backgroundBlendMode: BlendMode.luminosity,
      // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
      // shape: BoxShape.rectangle,
      image: DecorationImage(
        image: AssetImage("appleLogo.png"),
        alignment: Alignment.center,
        fit: BoxFit.cover,
      ),
    ),
  );

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
        'Hello! I am',
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange, fontFamily: ""),
      ),
      Text(
        "Peter Ajayi",
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
        "a developer with a general interest in all areas of technology\n"
        "I'm always eager to broaden my skillset and knowledge,\n"
        "over the last 18 months I have self taught myself iOS development.\n"
        "If I’m not busy I’ll be found playing video games or\n"
        "building and flying racing drones!",
        softWrap: true,
        // textScaleFactor: 1.0,
        style: TextStyle(
          color: Colors.white70,
          fontSize: 18,
          fontFamily: ""),
        
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            color: Colors.red,
            child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  gitLogo,
                  Text("GitHub",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                      fontFamily: boldFont)
                  ),
                  SizedBox(
                    width: 5,
                  ),
                ]
              ),            
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

  double imageSizeforLargeScreen(double size, bool isWidth) {
    if(size > 1250.0) {
      return (isWidth
        ? 300
        : 600);
    }
    else {
      return size * (isWidth
        ? 0.25
        : 0.50);
    } 
  }

//MARK: - Mito Images

  mitoScreenImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.70
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, false),
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.35
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, true),
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("mito/mito1.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  mitoScreenImage2(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.70
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, false),
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.35
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, true),
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("mito/mito2.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );

  mitoScreenImage3(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.70
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, false),
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.35
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, true),

        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("mito/mito3.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      );


//MARK: - WeatherMe Images

  weatherMeScreenImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.70
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, false),
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.35
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, true),
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("weatherMe/weatherMe1.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
  );

  weatherMeScreenImage2(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.70
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, false),
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.35
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, true),
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("weatherMe/weatherMe3.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
  );

   weatherMeScreenImage3(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.70
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, false),
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.35
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, true),
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("weatherMe/weatherMe2.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
  );

  //MARK: - RxMovies Images

  rxMoviesScreenImage(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.70
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, false),
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.35
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, true),
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("rxMovies/rxMovies1.png"),
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
  );

  rxMoviesScreenImage2(context) => Container(
        height: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.70
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, false),
        width: ResponsiveWidget.isSmallScreen(context)
            ? MediaQuery.of(context).size.height * 0.35
            : imageSizeforLargeScreen(MediaQuery.of(context).size.width, true),
        decoration: BoxDecoration(
          // backgroundBlendMode: BlendMode.luminosity,
          // color: Colors.blue,
//            borderRadius: BorderRadius.circular(40),
          // shape: BoxShape.rectangle,
          image: DecorationImage(
            image: AssetImage("rxMovies/rxMovies2.png"),
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

  final rxMovies = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
         SizedBox(
          height: 60,
        ),
        Text(
          "iOS Development example app",
          textScaleFactor: 2,
          style: TextStyle(
            color: Colors.orange,
            fontFamily: "helvetica"
          ),
        ),
        Text(
          "RxMovies",
          style: TextStyle(
            fontFamily: "",
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 48
          ),
        ),
        Text(
          "Example app using rxSwift and rxCocoa",
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
            TextSpan(
              text: "RxMovies presents movie information for new and upcoming\n"
                    "movies. I created this example app with the MVVM design pattern,\n"
                    "the aim being to learn how to use frameworks ",
              style: TextStyle(
                fontFamily: "helvetica",
                color: Colors.white70,
                fontSize: 18)
            ),
             TextSpan(
              text: "‘RxSwift’ ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: boldFont,
                color: Colors.white,
                fontSize: 18
              )
            ),
            TextSpan(
              text: "and\n",
              style: TextStyle(
                fontFamily: "helvetica",
                color: Colors.white70,
                fontSize: 18
              )
            ),
            TextSpan(
              text: "‘RxCocoa’.",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: boldFont,
                color: Colors.white,
                fontSize: 18
              )
            )
          ])
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          maxLines: 60,
          text: TextSpan(children: [
            TextSpan(
              text: "The app shows movie poster images along with a star rating\n"
                    "for each movie and a release date. Data was utilised from\n"
                    "themoviedb.org",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18)
            ),
          ])
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          maxLines: 60,
          text: TextSpan(children: [
            TextSpan(
              text: "With this project I learned the basics of using RxSwift/Cocoa.\n",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18)
            ),
          ])
        ),
         Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
          ButtonTheme(
              height: 50.0,
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                shape: StadiumBorder(),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    gitLogo,
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "View on GitHub",
                      style: TextStyle(
                        fontFamily: boldFont,
                        fontSize: 18
                      ),
                    ),
                  ]
                ),
                color: Colors.red,
                onPressed: () {
                  html.window.open("https://github.com/BeIllegalBeagle/RxMovies", "dd");
                },
                // padding: EdgeInsets.all(10),
              ),
            ),
          ]
         )
        ],
    );

  final weatherMe = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
       Text(
        "iOS Development",
        textScaleFactor: 2,
        style: TextStyle(
          color: Colors.orange,
          fontFamily: "helvetica"),
      ),
      Text(
        "WeatherMe",
        style: TextStyle(
          fontFamily: "",
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 48
        ),
      ),
      Text(
        "Look at the weather where ever you are",
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
          TextSpan(
            text: "WeatherMe is a weather app I created for the\n"
                  "purpose of re-enforcing the MVVM app architecture\npattern.",
            style: TextStyle(
              fontFamily: boldFont,
              fontWeight: FontWeight.bold,
              color: Colors.white70,
              fontSize: 22)
          ),
        ])
      ),
      SizedBox(
        height: 20,
      ),
      RichText(
        maxLines: 60,
        text: TextSpan(children: [
          TextSpan(
            text: "I worked with OpenWeatherMap APIs and parsed it’s JSON\n"
                  "responses to my model classes.\n",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70,
              fontSize: 18)
          ),
        ])
      ),
      RichText(
        maxLines: 60,
        text: TextSpan(children: [
          TextSpan(
            text: "Utilised ",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70,
              fontSize: 18
            )
          ),
          TextSpan(
            text: "Core Location",
            style: TextStyle(
              fontFamily: boldFont,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 18
            )
          ),
          TextSpan(
            text: " to determine users location, which is then",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70,
              fontSize: 18
            )
          ),
          TextSpan(
            text: "\nused in the OpenWeatherMap API REST request.\n",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70,
              fontSize: 18
            )
          ),
        ])
      ),
      SizedBox(
        height: 10,
      ),
      RichText(
        maxLines: 60,
        text: TextSpan(children: [
          TextSpan(
            text: "Built entirely with UIKit, the user interface is all created\n"
                  "programmatically, with NSLayout for aligning ui elements without\n"
                  "the need for any storyboards.",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70,
              fontSize: 18)
          ),
        ])
      ),
       SizedBox(
        height: 20,
      ),
      Text(
        "Challenge",
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
      RichText(
        maxLines: 60,
        text: TextSpan(children: [
          TextSpan(
            text: "I decided to make an application using only apples core libraries,\n"
                  "this meant that I would not use any third party code via cocoa\n"
                  "pods etc to help with the building of my app.",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70,
              fontSize: 18)
          ),
        ])
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        "Highlight",
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
      RichText(
        maxLines: 60,
        text: TextSpan(children: [
          TextSpan(
            text: "The app shows both the weekly and daily forecast\n"
                  "with an aesthetic design and allows for the location\n"
                  "to be changed based on user input.",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70,
              fontSize: 18)
          ),
        ])
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ButtonTheme(
              height: 50.0,
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                shape: StadiumBorder(),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    gitLogo,
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "View on GitHub",
                      style: TextStyle(
                        fontFamily: boldFont,
                        fontSize: 18
                      ),
                    ),
                  ]
                ),
                color: Colors.red,
                onPressed: () {
                  html.window.open("https://github.com/BeIllegalBeagle/weatherMe", "dd");
                },
                // padding: EdgeInsets.all(10),
              ),
            ),
        ]
      )
      ],
  );

  final mito = Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text(
          "iOS Development",
          textScaleFactor: 2,
          style: TextStyle(
            color: Colors.orange,
            fontFamily: "helvetica"
          ),
        ),
        Text(
          "Mito",
          style: TextStyle(
            fontFamily: boldFont,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 48
          ),
        ),
        Text(
          "a way to dynamically grow online nano\ncommunities",
          style: TextStyle(
            fontFamily: boldFont,
            color: Colors.white70,
            fontWeight: FontWeight.bold,
            fontSize: 24
          ),
        ),
        SizedBox(
          height: 5,
        ),
        RichText(
          maxLines: 60,
          text: TextSpan(children: [
            TextSpan(
              text: "Mito enables people to make friends in small temporary\n"
                    "chat groups and grow them into permanent large\nforums.",
              style: TextStyle(
                fontFamily: boldFont,
                fontWeight: FontWeight.bold,
                color: Colors.white70,
                fontSize: 18)
            ),
          ])
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
          maxLines: 60,
          text: TextSpan(children: [
            TextSpan(
              text: "The design pattern started off with MVC because the\n"
                    "project was a proof of concept and MVC was simple to implement.\n"
                    "When the size of the project grew it was switched to",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontFamily: "helvetica")
            ),
            TextSpan(text: ' MVVM\n', 
              style: TextStyle(
                fontFamily: boldFont,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              fontSize: 18)
            ),
            TextSpan(
              text: "making the code easier to manage.",
              style: TextStyle(
                color: Colors.white70,
                fontSize: 18,
                fontFamily: "helvetica")
            )
          ])
        ),
        SizedBox(
          height: 10,
        ),
        RichText(
          maxLines: 60,
          text: TextSpan(children: [
            TextSpan(
              text: "The UI for the sign up section and settings is created using\n"
                    "storyboards, the rest of the apps ui is made programmatically.\n"
                    "The app uses",
              style: TextStyle(
                fontFamily: "helvetica",
                color: Colors.white70,
                fontSize: 18)
            ),
            TextSpan(text: ' IBoutlets and autolayout', 
              style: TextStyle(
                fontFamily: boldFont,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              fontSize: 18)
            ),
            TextSpan(text: " for button actions",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70, 
              fontSize: 18)),
            TextSpan(text: "\nand storyboarded ui layout.\n",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70, 
              fontSize: 18)),
          
          ])
        ),
        SizedBox(
          height: 20,
        ),
        RichText(
          maxLines: 800,
          textAlign: TextAlign.justify,
          text: TextSpan(
            // style: TextStyle(color: Colors.white70, fontSize: 18),
            children: [
            TextSpan(text: "I used the ",
              style: TextStyle(
                fontFamily: "helvetica",
                color: Colors.white70,
                fontSize: 18)
            ),
            TextSpan(text: "Target-Action pattern ",
              style: TextStyle(
                fontFamily: boldFont,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18
              ),
            ),
            TextSpan(text: "for programmatical buttons and ",
              style: TextStyle(fontFamily: "helvetica",
              color: Colors.white70, 
              fontSize: 18)
            ),
            TextSpan(text: "\ngesture actions. Frameworks",
              style: TextStyle(
                fontFamily: "helvetica",
                color: Colors.white70, 
                fontSize: 18)
            ),
            TextSpan(
              text: " NSLayout and Snapkit ",
              style: TextStyle(
                fontFamily: boldFont,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18
              ),
            ),
            TextSpan(
            text: "were used",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70,
              fontSize: 18)
          ),
            TextSpan(
            text: "\nfor the programmatic layout of ui elements.",
            style: TextStyle(
              fontFamily: "helvetica",
              color: Colors.white70,
              fontSize: 18)
          )
          ])
          ),
          RichText(
            maxLines: 60,
            textAlign: TextAlign.justify,
            text: TextSpan(children: [
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text:"\nThe different sections for 'posts' and 'cells' was made\n"
              "using a wrapper library for "
              ),
              TextSpan(text: 'UIPageController',
                style: TextStyle(
                  fontFamily: boldFont,
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
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: "I created reusable "),
              TextSpan(
                text: 'UICollectionViewCell and UITableViewCell',
                style: TextStyle(
                  fontFamily: boldFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
              ),
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: "\nclasses to have users interact with groups and view content\n"
                      "in the app."),])
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
        RichText(
            maxLines: 60,
            textAlign: TextAlign.justify,
            text: TextSpan(children: [
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: "I used a "),
              TextSpan(
                text: "cryptocurrency ",
                style: TextStyle(
                  fontFamily: boldFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
              ),
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: "called nano for the upvotes/points of the"),])
        ),
        RichText(
            maxLines: 60,
            textAlign: TextAlign.justify,
            text: TextSpan(children: [
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: "network and individual users have their own crypto-wallet to \n"
                      "accept funds. Users must also confirm transactions with their\n"
                      "private keys for blocks to be accepted on the nano blockchain.\n"
                      "Towards the end of development a third party REST API I used for\n"
                      "the transmission and retrieval of new blocks shut their services\ndown.\n\n"
                      "I solved this by hosting my own nano node on "
                ),
              TextSpan(
                text: "AWS ",
                style: TextStyle(
                  fontFamily: boldFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
              ),
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: "and making a\nscript in Elixir for blocks to be confirmed. I also created an MQTT\n"
                      "broker to publish new user transactions received by the node.\n"
                ),])
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "\nHighlights",
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
        RichText(
            maxLines: 120,
            textAlign: TextAlign.justify,
            text: TextSpan(children: [
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: "Because the groups where users communicate are temporary,\n"
                      "I created a custom animaton using "
                ),
              TextSpan(
                text: "Core Animation ",
                style: TextStyle(
                  fontFamily: boldFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
              ),
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: "to trigger upon\nreceiving a group expiration message via MQTT.\n\n"
                      "Learned to write complex UI programmatically with NSlayout and\n"
                      "Snapkit. Used "
                ),
              TextSpan(
                text: "Core Graphics and UIBezierPath",
                style: TextStyle(
                  fontFamily: boldFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
              ),
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: " to create custom\n"
                      "shapes such as the dynamic X shaped genome button.\n\n"
                      "Used Elixir server to implement"
              ),
              TextSpan(
                text: " push notifications",
                style: TextStyle(
                  fontFamily: boldFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
              ),
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: " when a user\ngets a reply.\n\n"
                      "Used storage frameworks "
              ),
              TextSpan(
                text: "Realm and Keychain ",
                style: TextStyle(
                  fontFamily: boldFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 18),
              ),
              TextSpan(
                style: TextStyle(
                  fontFamily: "helvetica",
                  color: Colors.white70,
                  fontSize: 18),
                text: "to store user\n"
                      "preferences and sensitive data such as cryptographic private keys."
               ),
              ])
        ),
        SizedBox(
          height: 20,
        ),
        Text("Implemented additional onboarding with 'Sign in with Apple' and\n"
             "a new decentralised service that respects user privacy called\nBlockstack.",
          style: TextStyle(
            fontFamily: "helvetica",
            color: Colors.white70,
            fontSize: 18),
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            ButtonTheme(
              height: 50.0,
              child: OutlineButton(
                borderSide: BorderSide(
                  color: Colors.red,
                ),
                shape: StadiumBorder(),
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    appleLogo,
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "View on AppStore",
                      style: TextStyle(
                        fontFamily: boldFont,
                        fontSize: 18
                      ),
                    ),
                  ]
                ),
                color: Colors.red,
                onPressed: () {
                  html.window.open("https://apps.apple.com/us/app/mito/id1460578918?ls=1", "dd");
                },
                // padding: EdgeInsets.all(10),
              ),
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
              SizedBox(height: MediaQuery.of(context).size.width * 0.01),
              mitoScreenImage2(context),
              SizedBox(height: MediaQuery.of(context).size.width * 0.01),
              mitoScreenImage3(context),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              weatherMeScreenImage(context),
              SizedBox(height: MediaQuery.of(context).size.width * 0.01),
              weatherMeScreenImage2(context),
              SizedBox(height: MediaQuery.of(context).size.width * 0.01),
              weatherMeScreenImage3(context),
              SizedBox(height: MediaQuery.of(context).size.width * 0.05),
              rxMoviesScreenImage(context),
              SizedBox(height: MediaQuery.of(context).size.width * 0.01),
              rxMoviesScreenImage2(context)

            ],
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.02),
         Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[        
             mito,
              SizedBox(height: MediaQuery.of(context).size.width * 0.30),
             weatherMe,
              SizedBox(height: 150),
              SizedBox(height: MediaQuery.of(context).size.width * 0.9),
             rxMovies
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
          mito,
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          weatherMeScreenImage(context),
          SizedBox(height: MediaQuery.of(context).size.width * 0.02),
          weatherMeScreenImage2(context),
          SizedBox(height: MediaQuery.of(context).size.width * 0.02),
          weatherMeScreenImage3(context),
          SizedBox(height: MediaQuery.of(context).size.width * 0.05),
          weatherMe,
          SizedBox(height: MediaQuery.of(context).size.width * 0.1),
          rxMoviesScreenImage(context),
          SizedBox(height: MediaQuery.of(context).size.width * 0.02),
          rxMoviesScreenImage2(context),
          rxMovies,
          SizedBox(height: MediaQuery.of(context).size.width * 0.2),
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
                text: "Contact me",
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
