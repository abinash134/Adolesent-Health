import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_app/childrendashboardtargetpages/InsidePages/Bad/typesoftobacco.dart';
import 'package:new_app/themes/styles.dart';
import 'package:url_launcher/url_launcher.dart';

import '../ChildWelcomePage/selectageRange.dart';

class DescriptionPageModel {
  Widget? heading;
  Widget? body;

  DescriptionPageModel({this.heading, this.body});

  static List<DescriptionPageModel> tabacooteenPageModelQA = [
    DescriptionPageModel(
      heading: const Header(headingText: "What Is Tobacco?"),
      body: Column(
        children: const [
          AnswerText(
            answerText:
                "Tobacco (say: tuh-BA-ko) is a plant that can be smoked in cigarettes, pipes, or cigars. It's the same plant that's in smokeless tobacco, known as dip, chew, snuff, spit, or chewing tobacco. Smokeless tobacco is not lit or inhaled like tobacco in cigarettes, pipes, and cigars.",
          ),
          SizedBox(
            height: 5,
          ),
          AnswerText(
            answerText:
                "Tobacco contains nicotine (say: NIH-kuh-teen), a chemical that causes a tingly or pleasant feeling — but that feeling only lasts for a little while. Nicotine is also addictive (say: uh-DIK-tiv). That means that if you start to use nicotine, your body and mind will become so used to it that you'll need to have it just to feel OK.",
          ),
        ],
      ),
    ),
    DescriptionPageModel(
      heading: const Header(headingText: "Why its bad?"),
      body: Column(
        children: const [
          AnswerText(
            answerText:
                "Cigarettes and smokeless tobacco kill hundreds of thousands of people every year. In fact, each day 1300 people die from smoking alone.",
          ),
          SizedBox(
            height: 5,
          ),
          AnswerText(
            answerText:
                "The nicotine and other poisonous chemicals in tobacco cause lots of diseases, like heart problems and some kinds of cancer. If you smoke, you hurt your lungs and heart each time you light up. It also can make it more difficult for blood to move around in the body, so smokers may feel tired and cranky. The longer you smoke, the worse the damage becomes.",
          ),
          YoutubeTile(
              lableText: "Watch TED-Ed video on how Tobacco affects body",
              urlLink: "https://www.youtube.com/watch?v=Y18Vz51Nkos")
        ],
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "Types of Tobacco?"),
      body: Column(
        children: const [
          AnswerText(
            answerText:
                "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
          ),
          NormalTile(
            lableText: "See Different types of tabacoo",
            urlLink: "",
          )
        ],
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How it affect mind?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How it affect body?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How to quit it?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How to quit it?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How to quit it?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How to quit it?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
  ];
  static List<DescriptionPageModel> obesityPageModelQA = [
    DescriptionPageModel(
      heading: const Header(headingText: "What Is Obesity?"),
      body: Column(
        children: const [
          AnswerText(
            answerText:
                "Tobacco (say: tuh-BA-ko) is a plant that can be smoked in cigarettes, pipes, or cigars. It's the same plant that's in smokeless tobacco, known as dip, chew, snuff, spit, or chewing tobacco. Smokeless tobacco is not lit or inhaled like tobacco in cigarettes, pipes, and cigars.",
          ),
          SizedBox(
            height: 5,
          ),
          AnswerText(
            answerText:
                "Tobacco contains nicotine (say: NIH-kuh-teen), a chemical that causes a tingly or pleasant feeling — but that feeling only lasts for a little while. Nicotine is also addictive (say: uh-DIK-tiv). That means that if you start to use nicotine, your body and mind will become so used to it that you'll need to have it just to feel OK.",
          ),
        ],
      ),
    ),
    DescriptionPageModel(
      heading: const Header(headingText: "Why its bad?"),
      body: Column(
        children: const [
          AnswerText(
            answerText:
                "Cigarettes and smokeless tobacco kill hundreds of thousands of people every year. In fact, each day 1300 people die from smoking alone.",
          ),
          SizedBox(
            height: 5,
          ),
          AnswerText(
            answerText:
                "The nicotine and other poisonous chemicals in tobacco cause lots of diseases, like heart problems and some kinds of cancer. If you smoke, you hurt your lungs and heart each time you light up. It also can make it more difficult for blood to move around in the body, so smokers may feel tired and cranky. The longer you smoke, the worse the damage becomes.",
          ),
          YoutubeTile(
              lableText: "Watch TED-Ed video on how Tobacco affects body",
              urlLink: "https://www.youtube.com/watch?v=Y18Vz51Nkos")
        ],
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "Types of Tobacco?"),
      body: Column(
        children: const [
          AnswerText(
            answerText:
                "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
          ),
          NormalTile(
            lableText: "See Different types of tabacoo",
            urlLink: "",
          )
        ],
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How it affect mind?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How it affect body?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How to quit it?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How to quit it?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How to quit it?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
    DescriptionPageModel(
      heading: Header(headingText: "How to quit it?"),
      body: AnswerText(
        answerText:
            "What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?What Is Tobacco?",
      ),
    ),
  ];
}

class Header extends StatelessWidget {
  const Header({Key? key, required this.headingText}) : super(key: key);
  final String headingText;
  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      style: DharamaAppTheme.title,
    );
  }
}

class AnswerText extends StatelessWidget {
  const AnswerText({Key? key, required this.answerText}) : super(key: key);
  final String answerText;
  @override
  Widget build(BuildContext context) {
    return Text(answerText, style: DharamaAppTheme.subtitle);
  }
}

class YoutubeTile extends StatelessWidget {
  const YoutubeTile({Key? key, required this.lableText, required this.urlLink})
      : super(key: key);
  final String lableText;
  final String urlLink;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: InkWell(
        onTap: () async {
          if (await launch(urlLink)) throw 'Could not launch $urlLink';
        },
        child: Card(
          child: ListTile(
            leading: Image.asset(
              "assests/images/icons8-youtube-48.png",
              height: 30,
              width: 30,
            ),
            title: Text(lableText),
          ),
        ),
      ),
    );
  }
}

class NormalTile extends StatelessWidget {
  const NormalTile({
    Key? key,
    required this.lableText,
    required this.urlLink,
  }) : super(key: key);
  final String lableText;
  final String urlLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: InkWell(
        onTap: () async {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Typesoftobacco()));
        },
        child: Card(
          child: ListTile(
            title: Text(lableText),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ),
      ),
    );
  }
}
