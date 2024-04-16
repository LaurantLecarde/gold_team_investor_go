
import "package:flutter/material.dart";
import "package:gap/gap.dart";
import "package:gold_team_investor_go/gold_team/constants/navigators.dart";
import "package:gold_team_investor_go/gold_team/exe_directory/exe_model.dart";
import "package:gold_team_investor_go/gold_team/presentation/screens/drawer_screens/lessons/detailed_lesson.dart";

import "package:google_fonts/google_fonts.dart";

class LessonBuilder extends StatelessWidget {
  const LessonBuilder({
    super.key,
    required this.oneLesson,
  });

  final List<ExeLessonModel> oneLesson;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: oneLesson.length,
        itemBuilder: (context, index) {
          var lesson = oneLesson[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
            child: InkWell(
              onTap: () =>
                  navPush(context, DetailedLesson(lessonModel: lesson)),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26, spreadRadius: 1, blurRadius: 1)
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 250,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child:
                            Image.asset("${lesson.image}", fit: BoxFit.cover),
                      ),
                    ),
                    const Gap(15),
                    Text("${lesson.title}",
                        style: GoogleFonts.nunitoSans(
                            fontWeight: FontWeight.bold, fontSize: 23)),
                    const Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            "assets/icons/lesson.png",
                            color: Colors.grey.shade700,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: Text(" ${lesson.lessonsLinks?.length} dars",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunitoSans(
                                  color: Colors.grey.shade700, fontSize: 15)),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Align(
                      alignment: AlignmentDirectional.centerEnd,
                      child: Container(
                        height: 30,
                        width: 120,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15)),
                                backgroundColor: Colors.lightBlue.shade50),
                            onPressed: () =>navPush(context,DetailedLesson(lessonModel: lesson)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.arrow_forward_outlined,
                                  color: Colors.indigoAccent,
                                  size: 18,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 7.0),
                                  child: Text("Batafsil",
                                      style: GoogleFonts.notoNastaliqUrdu(
                                          color: Colors.indigoAccent,
                                          fontSize: 12)),
                                ),
                              ],
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
