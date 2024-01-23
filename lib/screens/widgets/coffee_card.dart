import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:week6_tast_two/screens/check_out_screen.dart';
import 'package:week6_tast_two/utils/implementation/api_service.dart';
import 'package:week6_tast_two/utils/model.dart';

class CoffeeCard extends StatefulWidget {
  final CoffeeType coffeeType;

  const CoffeeCard({
    Key? key,
    required this.coffeeType,
  }) : super(key: key);

  @override
  State<CoffeeCard> createState() => _CoffeeCardState();
}

class _CoffeeCardState extends State<CoffeeCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CheckOutScreen(
              coffeeType: widget.coffeeType,
            ),
          ),
        );
        getCoffeeType();
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                      //shape: BoxShape.circle,
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.transparent),
                  clipBehavior: Clip.antiAlias,
                  child: Image(
                    image: NetworkImage(widget.coffeeType.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Gap(12),
              Text(
                widget.coffeeType.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Colors.brown,
                ),
              ),
              Text(
                widget.coffeeType.description,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                  color: Colors.brown,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
