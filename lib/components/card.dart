import 'package:flutter/material.dart';
import '../constants/colors.dart';
import 'circular_progress_indicator.dart';

class TheCard extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  final Function onClick;

  TheCard.categories({
    this.title,
    this.description,
    this.image,
    @required this.onClick,
  });

  TheCard.meals({
    this.title,
    this.description = '',
    this.image,
    @required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 10, left: 12, right: 12),
      elevation: 10,
      shape: RoundedRectangleBorder(
        borderRadius: _buildBorderRadius(),
      ),
      child: GestureDetector(
        onTap: onClick,
        child: Container(
          width: double.maxFinite,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: _buildBorderRadius(),
            color: eternity,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 23,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, right: 16, left: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          title.length > 40
                              ? '${title.substring(0, 40)}...'
                              : title,
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.start),
                      Padding(
                        padding: const EdgeInsets.only(top: 16),
                        child: Text(
                          description.length > 100
                              ? '${description.substring(0, 100)}...'
                              : description,
                          style: Theme.of(context).textTheme.bodyText2,
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 16,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(
                    image,
                    loadingBuilder: (context, child, loadingProgress) {
                      return loadingProgress == null
                          ? child
                          : TheCircularProgressIndicator();
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BorderRadius _buildBorderRadius() {
    return BorderRadius.only(
        topRight: Radius.circular(20), bottomLeft: Radius.circular(20));
  }
}
