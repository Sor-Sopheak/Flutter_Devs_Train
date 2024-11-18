import 'package:ecommerce_dashboard/constants/app_colors.dart';
import 'package:ecommerce_dashboard/views/home/menu_side_bar.dart';
import 'package:ecommerce_dashboard/widgets/constraints/padding_spacing.dart';
import 'package:ecommerce_dashboard/widgets/constraints/sized_box_spacing.dart';
import 'package:ecommerce_dashboard/widgets/dashboard_item/best_sale_product_and_saler.dart';
import 'package:ecommerce_dashboard/widgets/dashboard_item/dashboard_item_display.dart';
import 'package:ecommerce_dashboard/widgets/dashboard_item/donut_and_recent_order.dart';
import 'package:ecommerce_dashboard/widgets/dashboard_item/greeting_and_filter_date.dart';
import 'package:ecommerce_dashboard/widgets/dashboard_item/revenue_and_progress_display.dart';
import 'package:ecommerce_dashboard/widgets/footers/dashboard_footer.dart';
import 'package:ecommerce_dashboard/widgets/navigation_bar/navbar_item.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:sidebarx/sidebarx.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final _controller = SidebarXController(selectedIndex: 0, extended: true);


  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {

      EdgeInsets paddingAll = PaddingAll(sizingInformation.deviceScreenType);
      SizedBox heightSized = HeightSized(sizingInformation.deviceScreenType);

      return Scaffold(
        appBar: const NavbarItem(),
        drawer: MenuSideBar(controller: _controller,),
        body: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Container(
                color: AppColors.backgroundColor,
                padding: paddingAll,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //greeing text
                    const GreetingAndFilterDate(),
                
                    heightSized,
                
                    //dashboard items
                    DashboardItemDisplay(),
                
                    heightSized,
                
                    //revenue and sale progress
                    const RevenueAndProgressDisplay(),
                
                    heightSized,
                
                    //best selling and top seller
                    const BestSaleProductAndSaler(),
                
                    heightSized,
                
                    const DonutAndRecentOrder(),
                
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: DashboardFooter(),
            ),
          ],
        ),
      );
    });
  }
}
