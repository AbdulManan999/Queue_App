import 'dart:math' as math;
import 'package:engage_app/common/widget/global_variables_methods.dart';
import 'package:engage_app/common/widget/shadow_tags.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class ExpandableContainer extends StatefulWidget {
  final String headerTitle;
  final Color headerTitleColor;
  final Widget expandedBodyWidget;
  final ExpandableController controller;

  final Color headerContainerColor;
  final Color headerIconColor;
  final Function onPressed;
  final IconData leadingIcon;
  final bool showLeadingIcon;

  ExpandableContainer({
    this.headerTitle,
    this.headerTitleColor,
    this.expandedBodyWidget,
    this.controller,
    this.headerContainerColor,
    this.headerIconColor,
    this.onPressed,
    this.leadingIcon,
    this.showLeadingIcon,
  });

  @override
  _ExpandableContainerState createState() => _ExpandableContainerState();
}

class _ExpandableContainerState extends State<ExpandableContainer> {
  @override
  Widget build(BuildContext context) {
    return ExpandableNotifier(
        controller: widget.controller,
        child: Padding(
          padding: EdgeInsets.only(
            bottom: 0,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(0),
            ),
            clipBehavior: Clip.antiAlias,
            child: ScrollOnExpand(
              scrollOnExpand: true,
              scrollOnCollapse: false,
              child: ExpandablePanel(
                controller: widget.controller,
                theme: ExpandableThemeData(
                  hasIcon: false,
                  headerAlignment: ExpandablePanelHeaderAlignment.center,
                  tapBodyToCollapse: false,
                ),
                header: InkWell(
                  onTap: widget.onPressed,
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 8,
                      bottom: 8,
                      left: 10,
                      right: 10,
                    ),
                    color: widget.headerContainerColor,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: widget.showLeadingIcon,
                          child: Container(
                            child: Row(
                              children: [
                                Icon(
                                  widget.leadingIcon,
                                  color: /*isSelected ? Color(0xFF5A8DEE) :*/ Color(
                                      0xFF475F7B),
                                  size: 25,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.05,
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.headerTitle,
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  color: widget.headerTitleColor,
                                ),

                                // style: TextStyle(
                                //   fontSize: 16,
                                //   color: /*isSelected ? Color(0xFF5A8DEE) :*/ Color(
                                //       0xFF475F7B),
                                // ),
                              ),
                              Text(
                                "5:59 AM",
                                style: TextStyle(
                                  // color: Provider.of<ThemeProvider>(context)
                                  //         .getTheme()
                                  //     ? darkTextColor
                                  //     : textColor,
                                  color: textColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Text(
                        //
                        //   style: Theme.of(context).textTheme.bodyText1.copyWith(
                        //         fontSize: 18,
                        //         color: widget.headerTitleColor,
                        //         fontWeight: FontWeight.w500,
                        //       ),
                        // ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ShadowTags(
                                colorScheme: "012",
                                title: "Open",
                              ),
                            ],
                          ),
                        ),
                        ExpandableIcon(
                          theme: ExpandableThemeData(
                            expandIcon: Icons.keyboard_arrow_up,
                            collapseIcon: Icons.keyboard_arrow_up,
                            // iconColor:
                            //     Provider.of<ThemeProvider>(context).getTheme()
                            //         ? darkTextColor
                            //         : textColor,
                            iconColor: textColor,
                            iconSize: 26.0,
                            iconRotationAngle: math.pi,
                            iconPadding: EdgeInsets.all(10),
                            hasIcon: false,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                expanded: widget.expandedBodyWidget,
                builder: (_, collapsed, expanded) {
                  return Expandable(
                    collapsed: collapsed,
                    expanded: expanded,
                    theme: const ExpandableThemeData(crossFadePoint: 0),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
