import 'package:flutter/material.dart';

class ReservationButton extends StatelessWidget {
  const ReservationButton({super.key, required this.title, required this.onpressed});

  final String title;
  final Function() onpressed;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: InkWell(
          onTap: onpressed,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimaryContainer),
            child: Center(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.onPrimary),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
