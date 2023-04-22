import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:pet_app/theme/color.dart';
import 'package:pet_app/widgets/favorite_box.dart';

import 'custom_image.dart';

class PetItem extends StatelessWidget {
  const PetItem(
      {Key? key,
      required this.data,
      this.width = 350,
      this.height = 400,
      this.radius = 40,
      this.onTap,
      this.onFavoriteTap})
      : super(key: key);
  final data;
  final double width;
  final double height;
  final double radius;
  final GestureTapCallback? onTap;
  final GestureTapCallback? onFavoriteTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Stack(
          children: [
            _buildImage(),
            Positioned(
              bottom: 0,
              child: _buildInfoGlass(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoGlass() {
    return GlassContainer(
      borderRadius: BorderRadius.circular(25),
      blur: 10,
      opacity: 0.15,
      child: Container(
        width: width,
        height: 110,
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: AppColor.shadowColor.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfo(),
            SizedBox(
              height: 5,
            ),
            _buildLocation(),
            SizedBox(
              height: 15,
            ),
            _buildAttributes(),
          ],
        ),
      ),
    );
  }

  Widget _buildLocation() {
    return Text(
      data["location"],
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        color: AppColor.glassLabelColor,
        fontSize: 13,
      ),
    );
  }

  Widget _buildInfo() {
    return Row(
      children: [
        Expanded(
          child: Text(
            data["name"],
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppColor.glassTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        FavoriteBox(
          isFavorited: data["is_favorited"],
          onTap: onFavoriteTap,
        )
      ],
    );
  }

  Widget _buildImage() {
    return CustomImage(
      data["image"],
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(radius),
        bottom: Radius.zero,
      ),
      isShadow: false,
      width: width,
      height: 350,
    );
  }

  Widget _buildAttributes() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _getAttribute(
          Icons.transgender,
          data["sex"],
        ),
        _getAttribute(
          Icons.color_lens_outlined,
          data["color"],
        ),
        _getAttribute(
          Icons.query_builder,
          data["age"],
        ),
      ],
    );
  }

  Widget _getAttribute(IconData icon, String info) {
    return Row(
      children: [
        Icon(
          icon,
          size: 18,
        ),
        SizedBox(
          width: 3,
        ),
        Text(
          info,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: AppColor.textColor, fontSize: 13),
        ),
      ],
    );
  }
}
