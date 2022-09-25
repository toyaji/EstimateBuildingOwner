import 'package:flutter/material.dart';

class ReviewAddress extends StatelessWidget {
  const ReviewAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    )
  },

    Widget AddressText() {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _addressAPI(); // 카카오 주소 API
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('주소', style: TextStyle(fontSize: 15, color: Colors.blueGrey)),
          TextFormField(
            enabled: false,
            decoration: InputDecoration(
              isDense: false,
            ),
            controller: _AddressController,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }

  _addressAPI() async {
    KopoModel model = await Navigator.push(
      context,
      CupertinoPageRoute(
        builder: (context) => RemediKopo(),
      ),
    );
    _AddressController.text =
        '${model.zonecode!} ${model.address!} ${model.buildingName!}';
  }
}
