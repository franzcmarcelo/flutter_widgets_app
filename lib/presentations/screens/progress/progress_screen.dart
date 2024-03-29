import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {

  static const String name = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {

  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text('Circular Progress Indicator'),
            SizedBox(height: 20),
            CircularProgressIndicator(
              strokeWidth: 5,
              backgroundColor: Colors.black12
            ),

            SizedBox(height: 100),
            Text('Linear Progress Indicator'),
            SizedBox(height: 20),
            LinearProgressIndicator(),

            SizedBox(height: 100),
            Text('Linear Progress Indicator with value'),
            SizedBox(height: 20),
            _ProgressIndicatorControlled()
          ],
        ),
      ),
    );
  }
}

class _ProgressIndicatorControlled extends StatelessWidget {

  const _ProgressIndicatorControlled();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 300), (emittedValue) => (emittedValue / 100) // 0.0 - 1.0
        ).takeWhile((formattedEmittedValue) => (formattedEmittedValue <= 1.0)),
      builder: (context, snapshot) {

        final double progressValue = snapshot.data ?? 0.0;

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              value: progressValue,
              backgroundColor: Colors.black12
            ),
            const SizedBox(width: 20),
            // * Wrap with Expanded to fix the width that LinearProgressIndicator will take
            Expanded(
              child: LinearProgressIndicator(
                value: progressValue,
              )
            )
          ],
        );
      }
    );
  }
}