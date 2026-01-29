import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuestionsSammry extends StatelessWidget {
  const QuestionsSammry(this.SummryData, {super.key});

  final List<Map<String, Object>> SummryData;

  @override
  Widget build(BuildContext context) {
    Color answerIndexColor;
    return SizedBox(
      height: 400,
      width: 360,
      child: SingleChildScrollView(
        child: Column(
          children: SummryData.map((data) {
            if (data['user-answer'] == data['correct-answer']) {
              answerIndexColor = Colors.green;
            } else {
              answerIndexColor = Colors.red;
            }
            return Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: answerIndexColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      ((data['question-index'] as int) + 1).toString(),
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                    ),
                  ),

                  SizedBox(width: 12,),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4,),
                        Text(data['user-answer'] as String,style: TextStyle(color: Colors.black87,fontWeight: FontWeight.bold)),
                        Text(data['correct-answer'] as String,style: TextStyle(color: Colors.deepPurple,fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
