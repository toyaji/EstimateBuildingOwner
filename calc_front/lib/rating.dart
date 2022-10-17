import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewRating extends StatelessWidget {
  const ReviewRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: const Text('상가주인 평가하기'),
        ),
        body: Column(
          children: [
            Align(
              alignment: const AlignmentDirectional(-1, 0),
              child: Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                child: Text(
                  'Question 1/3',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(8, 12, 8, 0),
              child: LinearPercentIndicator(
                percent: 0.3,
                lineHeight: 12,
                animation: true,
                progressColor: Theme.of(context).primaryColor,
                backgroundColor: Theme.of(context).focusColor,
                barRadius: const Radius.circular(24),
                padding: EdgeInsets.zero,
              ),
            ),
            const Padding(padding: EdgeInsets.all(16.0)),
            const CustomRatingWidget(question: 'Q1. 상가의 시설관리는 잘 이루어졌나요?'),
            const CustomRatingWidget(question: 'Q2. 상가의 시설관리는 잘 이루어졌나요?'),
            const CustomRatingWidget(question: 'Q2. 상가의 시설관리는 잘 이루어졌나요?'),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 40,
                  width: 140,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('다음'),
                  ),
                ),
              ],
            )
          ],
        ));
  }
}

class CustomRatingWidget extends StatelessWidget {
  final String question;

  const CustomRatingWidget({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(8, 20, 0, 10),
          child: Text(
            question,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RatingBar(
            minRating: 1,
            maxRating: 5,
            initialRating: 3,
            allowHalfRating: false,
            onRatingUpdate: (value) {},
            ratingWidget: RatingWidget(
                full: const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                half: const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                empty: const Icon(
                  Icons.star,
                  color: Colors.grey,
                )),
            itemSize: 36,
            itemPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        )
      ],
    );
  }
}
