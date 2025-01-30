import 'package:flutter/material.dart';

class CategorySection extends StatefulWidget {
  const CategorySection({super.key});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              "Shop By Category",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Column(
                children: [

                  // all
                  Column(
                    children: [
                      Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(100)),
                        child: Center(
                          child: IconButton(
                            iconSize: 30,
                            icon: const Icon(Icons.view_column),
                            onPressed: () {},
                          ),
                        ),
                      ),
                      Text(
                        "All",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              fontWeight: FontWeight.w900,
                              fontSize: 15,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // men
            Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.man),
                      onPressed: () {},
                    ),
                  ),
                ),
                Text(
                  "Men's wear",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                ),
              ],
            ),

            // women
            Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.girl),
                      onPressed: () {},
                    ),
                  ),
                ),
                Text(
                  "Women's Wear",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                ),
              ],
            ),

            // Jewelry

            Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.diamond),
                      onPressed: () {},
                    ),
                  ),
                ),
                Text(
                  "Jewelry",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                ),
              ],
            ),

            // electronic
            Column(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: IconButton(
                      iconSize: 30,
                      icon: const Icon(Icons.tv),
                      onPressed: () {},
                    ),
                  ),
                ),
                Text(
                  "Electronics",
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                      ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
