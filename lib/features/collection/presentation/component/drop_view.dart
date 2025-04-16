import 'package:flutter/material.dart';
import 'package:pixelfield/utils/images/images_utils.dart';

class DropView extends StatelessWidget {
  const DropView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Theme.of(context).cardColor,
      height: 40,
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(ImagesUtils.genuineIconImage),
          const SizedBox(
            width: 8,
          ),
          Text(
            "Genuine Bottle (Unopened)",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Image.asset(ImagesUtils.downImage),
              ))
        ],
      ),
    );
  }
}
