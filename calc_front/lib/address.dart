import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:remedi_kopo/remedi_kopo.dart';

class ReviewAddress extends StatefulWidget {
  const ReviewAddress({super.key, required this.title});

  final String title;

  @override
  State<ReviewAddress> createState() => _ReviewAddressState();
}

class _ReviewAddressState extends State<ReviewAddress> {
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(padding: EdgeInsets.only(top: 10)),
                  addressText()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget addressText() {
    return GestureDetector(
      onTap: () {
        HapticFeedback.mediumImpact();
        _addressAPI(); // 카카오 주소 API
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('주소',
              style: TextStyle(fontSize: 15, color: Colors.blueGrey)),
          TextFormField(
            enabled: false,
            decoration: const InputDecoration(
              isDense: false,
            ),
            controller: _addressController,
            style: const TextStyle(fontSize: 20),
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
    _addressController.text =
        '${model.zonecode!} ${model.address!} ${model.buildingName!}';
  }
}
