import 'package:flutter/material.dart';

import '../../models/indicator_model.dart';
import '../../utils/get_color_checkbox.dart';

class Indicator extends StatefulWidget {
  // final String name;
  final IndicatorModel indicatorModel;

  const Indicator({super.key, required this.indicatorModel});

  @override
  State<Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<Indicator> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.07,
      child: Card(
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Colors.greenAccent,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.007),
                  child: Text(
                    widget.indicatorModel.name,
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ),
              Checkbox(
                fillColor: MaterialStateProperty.resolveWith(getColor),
                onChanged: (bool? value) {
                  setState(() {
                    widget.indicatorModel.isMarked = value ?? false;
                  });
                },
                value: widget.indicatorModel.isMarked,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
