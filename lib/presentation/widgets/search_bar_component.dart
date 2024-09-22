import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../app/app_constants/color_constants.dart';
import '../../app/app_constants/font_constants.dart';
import 'meta_textStyle.dart';

class SearchBarComponent extends StatefulWidget {
  final double barHeight;
  final String? hintText;
  final TextEditingController searchController;
  final Function(String)? onSubmitted;
  final Function? onClear;
  final bool showText;
  final Function(String)? onChange;

  const SearchBarComponent(
      {this.barHeight = 40,
      this.hintText,
      required this.searchController,
      this.onSubmitted,
      this.onClear,
      this.onChange,
      this.showText = false});

  @override
  _SearchBarComponentState createState() => _SearchBarComponentState();
}

class _SearchBarComponentState extends State<SearchBarComponent> {
  bool _editing = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.barHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: TextField(
                textInputAction: TextInputAction.search,
                autofocus: false,
                onSubmitted: (value) {
                  widget.onSubmitted!(widget.searchController.text);
                },
                onChanged: (text) {
                  if (text.isNotEmpty) {
                    setState(() {
                      _editing = true;
                    });
                    if (widget.onChange != null) {
                      widget.onChange!(widget.searchController.text);
                    }
                  }
                },
                controller: widget.searchController,
                style: MetaStyle(
                        fontSize: 16,
                        fontColor: AppColors.blackColor,
                        fontFamily: INTER_MEDIUM)
                    .getStyle(),
                decoration: InputDecoration(
                  hintStyle: MetaStyle(
                          fontSize: 16,
                          fontColor: AppColors.blackColor,
                          fontFamily: INTER_MEDIUM)
                      .getStyle(),
                  hintText: widget.hintText,
                  contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  prefixIconConstraints: BoxConstraints(
                    minWidth: 24, // Adjust this value to decrease the spacing
                  ),
                  prefixIcon: InkWell(
                    onTap: () {
                      widget.onSubmitted!(widget.searchController.text);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/search_icon.svg',
                    ),
                  ),
                  suffixIcon: _editing
                      ? InkWell(
                          onTap: () {
                            widget.searchController.text = "";
                            setState(() {
                              _editing = false;
                              widget.onClear!();
                            });
                          },
                          child: Icon(
                            Icons.close,
                            size: 16,
                            color: Colors.grey,
                          ),
                        )
                      : SizedBox(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
