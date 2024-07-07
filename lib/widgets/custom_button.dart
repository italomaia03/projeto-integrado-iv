import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String caption;
  final VoidCallback onTap;
  final bool loading;

  const CustomButton({
    super.key,
    required this.caption,
    required this.onTap,
    this.loading = false,
    });

  @override
  Widget build(BuildContext context) {
    return  Material(
              color: Colors.blue,
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: InkWell(
                onTap: onTap,
                child: Ink(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 52, 94, 128),
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  height: 60, 
                  child: Center(
                    child: loading 
                    ? const CircularProgressIndicator(
                      color: Colors.white,
                    )
                    : Text(
                      caption, style: const TextStyle(
                      fontSize: 20,color: Colors.white,
                    ),
                    ),
                  ),
                ),
              ),
            );
  }
}