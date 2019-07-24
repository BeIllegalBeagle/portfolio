
import 'package:flutter_web/material.dart';
import 'package:portfolio/responsive_widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return ResponsiveWidget(
      largeScreen: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          ),
        drawer: ResponsiveWidget.isSmallScreen(context)
          ? Drawer(
            child: ListView(
            padding: const EdgeInsets.all(20),
            children: <Widget>[
              NavButton(
                text: "about",
                onPressed: () {},
              ),
              NavButton(
                text: "work",
                onPressed: () {},
              ),
              NavButton(
                text: "contact",
                onPressed: () {},
              )
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
              NavButton(
                text: "about",
                onPressed: () {},
              ),
              NavButton(
                text: "work",
                onPressed: () {},
              ),
              NavButton(
                text: "contact",
                onPressed: () {},
              )
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
          color: Colors.deepOrange,
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
        "Hi there! My name is",
        textScaleFactor: 2,
        style: TextStyle(color: Colors.orange),
      ),
      Text(
        "Peter\nAjayi",
        textScaleFactor: 5,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(
        height: 10,
      ),
      Text(
        "I am a junior developer with interest in all areas of technology\n"
        "and always eager to broaden my skillset and knowledge.\n"
        "If I’m not busy I’ll be found socialising playing video games or flying racing drones",
        softWrap: true,
        textScaleFactor: 1.5,
        style: TextStyle(color: Colors.white70),
      ),
      SizedBox(
        height: 20,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            shape: StadiumBorder(),
            child: Text("Resume"),
            color: Colors.red,
            onPressed: () {},
            padding: EdgeInsets.all(10),
          ),
          SizedBox(
            width: 20,
          ),
          OutlineButton(
            borderSide: BorderSide(
              color: Colors.red,
            ),
            shape: StadiumBorder(),
            child: Text("Say Hi!"),
            color: Colors.red,
            onPressed: () {},
            padding: EdgeInsets.all(10),
          )
        ],
      )
    ],
  );

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[profileImage(context), profileData],
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
                onPressed: () {},
                color: Colors.blue,
              ),
            ],
          ),
          Text(
            "Peter Ajayi ©️2019",
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
            onPressed: () {},
            color: Colors.blue,
          ),
          Text(
            "Peter Ajayi ©️2019",
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
