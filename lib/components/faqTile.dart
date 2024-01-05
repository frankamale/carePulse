import 'package:carepulse/components/faqTile.dart';
import 'package:carepulse/models/faqs.dart';
import 'package:carepulse/models/items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqTile extends StatefulWidget {
  FaqTile({super.key});

  @override
  State<FaqTile> createState() => _FaqTileState();
}

class Frequent {
  bool isExpanded;
  String header;
  String body;

  Frequent({this.isExpanded = false, required this.body, required this.header});
}

class _FaqTileState extends State<FaqTile> {
  final List<Frequent> _frequent = [
    Frequent(
        body:
        "Having sex with a person who has HIV without using a condom\n Sharing drug needles or other drug equipment with someone who has HIV \n Using the same needle as someone with HIV when you get a tattoo\n Women with HIV can pass it to their babies before or during birth, and through breastfeeding.",
        header: "How Is HIV Passed From One Person to Another?"),
    Frequent(
        body: "Always use a condom when having sex.\n Do not use alcohol or drugs. That way you can make smart choices based on clear thinking. \n Activities like hugging, kissing, and rubbing against one another don't spread HIV as long as there are no open sores being touched.",
        header: "How Can I Avoid spreading HIV?"),
    Frequent(
        body: "Many people who have HIV don't have any symptoms at all for many years. \n The only way to know if you're infected is to get tested.\n Don't wait for symptoms to show up.\nIf you find out you're infected soon after it happens, \nyou'll have more options for treatment and care to help prevent you from getting sick.",
        header: "How Can I Tell if I Have HIV? \n Are There Symptoms?"),
    Frequent(
      header: 'What if I Test Positive for HIV?',
      body:
      "Prompt, early medical treatment and a healthy lifestyle can help you stay well. \nWe have more and better treatments today, and people are living longer and with a better quality of life than ever before.",
    ),
    Frequent(
      header: 'How Long Does It Take for HIV to Cause AIDS?',
      body:
      "Before HIV medicines became available, Scientists used to think that about half the people with HIV developed AIDS within 10 years after they were infected. \nHowever, current drug therapies have dramatically changed the outlook for people living with HIV. \nIf you start HIV medicines early in the course of your infection, keep your medical appointments, and stay on your medicines, you may never develop HIV-related illnesses.",
    ),
    Frequent(
      header: 'What Happens if I Get AIDS?',
      body:
      "When you get infected with HIV, your body's immune system gets weaker. \nThe immune system is what makes your body able to fight off infection and disease. \nIt takes time for this to happen. But when it does, it can lead to AIDS and be fatal.\nWhen a person has AIDS, the immune system is so weak it can't fight off viruses or bacteria. ",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              _frequent[index].isExpanded = !_frequent[index].isExpanded;
            });
          },
          children: _frequent.map((Frequent fa) {
            return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(fa.header, style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15
                    ),),
                  );
                },
                isExpanded: fa.isExpanded,
                body: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(fa.body),
                  ),
                ));
          }).toList(),
        )
      ],
    );
  }
}
