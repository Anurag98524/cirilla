import 'package:cirilla/mixins/mixins.dart';
import 'package:cirilla/models/models.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:awesome_icons/awesome_icons.dart';
import 'package:share/share.dart';

class ProductAction extends StatefulWidget {
  final Product? product;
  final String? align;

  const ProductAction({Key? key, this.product, this.align = 'left'}) : super(key: key);

  @override
  State<ProductAction> createState() => _ProductActionState();
}

class _ProductActionState extends State<ProductAction> with NavigationMixin, WishListMixin {
  @override
  Widget build(BuildContext context) {
    WrapAlignment wrapAlignment = widget.align == 'right'
        ? WrapAlignment.end
        : widget.align == 'center'
            ? WrapAlignment.center
            : WrapAlignment.start;
    return Wrap(
      spacing: 24,
      alignment: wrapAlignment,
      children: [
        InkWell(
          onTap: () => Share.share(widget.product!.permalink!, subject: widget.product!.name),
          child: const Icon(FeatherIcons.share2, size: 20),
        ),
        InkWell(
          onTap: () {
            addWishList(productId: widget.product!.id);
          },
          child: Icon(
            existWishList(productId: widget.product!.id) ? FontAwesomeIcons.solidHeart : FontAwesomeIcons.heart,
            size: 20,
          ),
        ),
      ],
    );
  }
}
