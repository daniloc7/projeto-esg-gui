import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData? icon;
  final String? text;
  final void Function()? onTap;

  const CustomListTile({
    super.key,
    this.icon,
    this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8.0, 0, 8, 0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(color: Colors.grey.shade400),
          ),
        ),
        child: InkWell(
          splashColor: Colors.white70,
          onTap: onTap,
          // ignore: sized_box_for_whitespace
          child: Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Texto
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      icon,
                      color: Colors.black87,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      text.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                // const Icon(Icons.arrow_right),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
