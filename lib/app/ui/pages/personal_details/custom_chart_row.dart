import 'package:flutter/material.dart';

class SimplePercentageRow extends StatefulWidget {
  const SimplePercentageRow({super.key, this.height = 20, this.width = 260, this.indicatorSize = 50});
  final double height;
  final double width;
  final double indicatorSize;

  @override
  _SimplePercentageRowState createState() => _SimplePercentageRowState();
}


class _SimplePercentageRowState extends State<SimplePercentageRow> {

  // Current position of the indicator (percentage)
  double indicatorValue = 0; // value from 0 to 100

  @override
  void initState() {
    super.initState();
    // Initialize the indicator value
    indicatorValueFn(indicatorValue);
  }

  void indicatorValueFn(double value) {
    setState(() {
      indicatorValue = value; // Update the indicator value in real-time
    });
  }

  @override
  Widget build(BuildContext context) {
    // Calculate the actual indicator position based on the total width
    double indicatorPosition = (indicatorValue / 115) * widget.width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: widget.width + 18,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            border: Border.all(color: Colors.black),
          ),
          child: Stack(
            children: [
              Row(
                children: [
                  // Create colored segments
                  Container(
                    width: (25 / 100) * widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(left: Radius.circular(32)),
                      color: Colors.red,
                    ),
                  ),
                  Container(
                    width: (25 / 100) * widget.width,
                    height: widget.height,
                    color: Colors.yellow,
                  ),
                  Container(
                    width: (25 / 100) * widget.width,
                    height: widget.height,
                    color: Colors.greenAccent,
                  ),
                  Container(
                    width: (25 / 100) * widget.width,
                    height: widget.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.horizontal(right: Radius.circular(32)),
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              // Indicator
              Positioned(
                left: indicatorPosition - 8,
                bottom: -19,
                child: Icon(Icons.arrow_drop_up_outlined,size: widget.indicatorSize,),
                ),
            ],
          ),
        ),
        // SizedBox(height: 20), // Space between the row and slider
        // Slider(
        //   value: indicatorValue,
        //   min: 0,
        //   max: 100,
        //   divisions: 100, // Optional: divide the slider into discrete steps
        //   label: indicatorValue.round().toString(),
        //   onChanged: (value) {
        //     indicatorValueFn(value); // Update the indicator value in real-time
        //   },
        // ),
        // SizedBox(height: 20), // Space below the slider
        // Text(
        //   'Indicator Value: ${indicatorValue.toStringAsFixed(0)}%',
        //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        // ),
      ],
    );
  }
}
