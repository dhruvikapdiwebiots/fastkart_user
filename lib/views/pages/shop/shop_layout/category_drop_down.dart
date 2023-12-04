import 'package:google_fonts/google_fonts.dart';

import '../../../../config.dart';

class CategoryDropDown extends StatelessWidget {
  const CategoryDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShopController>(
      builder: (shopCtrl) {
        return DropdownButton(
          value: shopCtrl.dropDownVal,
          items:  [
            //add items in the dropdown
            DropdownMenuItem(
              value: "Fresh Fruits& Vegetables",
              child: Text(ShopFont().freshFruitsVegetables),
            ),
            DropdownMenuItem(
                value: "Oils,Refined & Ghee",
                child: Text(ShopFont().oilsRefinedGhee)),
            DropdownMenuItem(
              value: "Rice, Flour & Gains",
              child: Text(ShopFont().riceFlourGains),
            ),
            DropdownMenuItem(
              value: "Food Cupboard",
              child: Text(ShopFont().foodCupboard),
            ),
            DropdownMenuItem(
              value: "Drink& Beverages",
              child: Text(ShopFont().drinkBeverages),
            ),
            DropdownMenuItem(
              value: "Instant Mixes",
              child: Text(ShopFont().instantMixes),
            )
          ],
          onChanged: (value) {
            //get value when changed
            shopCtrl.dropDownVal = value.toString();
            shopCtrl.update();
          },
          icon: Icon(
            Icons.keyboard_arrow_down_outlined,
            color: shopCtrl.appCtrl.appTheme.titleColor,
          ),
          //Icon color
          style: TextStyle(
            //te
              color: shopCtrl.appCtrl.appTheme.titleColor, //Font color
              fontFamily: GoogleFonts.mulish().fontFamily,
              fontSize: AppScreenUtil().fontSize(ShopFontSize
                  .textSizeSMedium) //font size on dropdown button
          ),
          underline: Container(),
          //remove underline
          isExpanded: true, //make true to make width 100%
        );
      }
    );
  }
}
