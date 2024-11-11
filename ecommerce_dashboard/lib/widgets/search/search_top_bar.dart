import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SearchTopBar extends StatefulWidget {
  const SearchTopBar({super.key});

  @override
  State<SearchTopBar> createState() => _SearchTopBarState();
}

class _SearchTopBarState extends State<SearchTopBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(4)
        ),
        child: SearchAnchor(
          builder: (BuildContext context, SearchController controller) {
            return SearchBar(
              
                controller: controller,
                padding: const WidgetStatePropertyAll<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 16.0),
                ),
                onTap: () {
                  controller.openView();
                },
                onChanged: (_) {
                  controller.openView();
                },
                leading: const Row(
                  children: [
                    Icon(
                      Icons.search,
                      size: 24,
                      color: AppColors.greyColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "Search...",
                      style: TextStyle(
                        color: AppColors.greyColor,
                        fontWeight: FontWeight.w400
                      ),
                    ),
                  ],
                ));
          },
          suggestionsBuilder:
              (BuildContext context, SearchController controller) {
            return List<ListTile>.generate(
              5,
              (int index) {
                final String item = 'item $index';
                return ListTile(
                  title: Text(item),
                  onTap: () {
                    setState(() {
                      controller.closeView(item);
                    });
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
