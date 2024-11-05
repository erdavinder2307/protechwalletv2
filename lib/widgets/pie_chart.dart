import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:protechwalletv2/flutter_flow/flutter_flow_theme.dart';
import 'package:protechwalletv2/widgets/indicators.dart';

class PieChartSample2 extends StatefulWidget {
  const PieChartSample2({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  int touchedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Row(
        children: <Widget>[
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(
                    touchCallback: (FlTouchEvent event, pieTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions ||
                            pieTouchResponse == null ||
                            pieTouchResponse.touchedSection == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = pieTouchResponse
                            .touchedSection!.touchedSectionIndex;
                      });
                    },
                  ),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 5,
                  sections: showingSections(),
                ),
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Indicator(
                color: FlutterFlowTheme.of(context).primary,
                text: 'Category1',
                isSquare: false,
              ),
              SizedBox(
                height: 2,
              ),
              Indicator(
                color: FlutterFlowTheme.of(context).accent1,
                text: 'Category2',
                isSquare: false,
              ),
              SizedBox(
                height: 2,
              ),
              Indicator(
                color: FlutterFlowTheme.of(context).accent2,
                text: 'Category3',
                isSquare: false,
              ),
              SizedBox(
                height: 2,
              ),
              Indicator(
                color: FlutterFlowTheme.of(context).accent3,
                text: 'Category4',
                isSquare: false,
              ),
            ],
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 15.0 : 10.0;
      final radius = isTouched ? 60.0 : 50.0;
      const shadows = [Shadow(color: Colors.black, blurRadius: 2)];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: FlutterFlowTheme.of(context).primary,
            value: 40,
            title: '40%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: FlutterFlowTheme.of(context).primaryBackground,
              shadows: shadows,
            ),
          );
        case 1:
          return PieChartSectionData(
            color: FlutterFlowTheme.of(context).secondary,
            value: 30,
            title: '30%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: FlutterFlowTheme.of(context).secondaryBackground,
              shadows: shadows,
            ),
          );
        case 2:
          return PieChartSectionData(
            color: FlutterFlowTheme.of(context).tertiary,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: FlutterFlowTheme.of(context).primaryBackground,
              shadows: shadows,
            ),
          );
        case 3:
          return PieChartSectionData(
            color: FlutterFlowTheme.of(context).accent2,
            value: 15,
            title: '15%',
            radius: radius,
            titleStyle: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: FlutterFlowTheme.of(context).primaryBackground,
              shadows: shadows,
            ),
          );
        default:
          throw Error();
      }
    });
  }
}
