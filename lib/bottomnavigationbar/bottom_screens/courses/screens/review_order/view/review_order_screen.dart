import 'package:edgrow_app/widget/loader/loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../../../../commons/common_colors.dart';
import '../../../../../../commons/common_widgets.dart';
import '../../../widgets/review_order_widgets.dart';
import '../../payment/view/payment_successfully_screen.dart';
import '../view_model/review_order_controller.dart';

class ReviewOrderScreen extends StatelessWidget {
  final ReviewOrderController _controller= Get.put(ReviewOrderController());

   ReviewOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Loader.screenLoader(
         loading:_controller.screenLoader.value,
         myWidget: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: const Color(0xFFFFFFFF),
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whitecolor,
            leading: InkWell(
              onTap: () {
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: SvgPicture.asset('assets/icons/arrowback.svg'),
              ),
            ),
            elevation: 0,
            title: const LatoCommonTextWidget(
              title: 'Review Order',
              textColor: normalblack,
              textSize: 16,
              textweight: FontWeight.w600,
            ),
            titleSpacing: -3,
          ),
          body: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            children: [
              ReviewCardWidget(
                imagepic: '${_controller.reviewOrderModel?.courseImage}',
                titlejob: '${_controller.reviewOrderModel?.courseTitle}',
                starrating: '${_controller.reviewOrderModel?.rating}',
                staramount: '${_controller.reviewOrderModel?.ratingCount}',
                amount: '${_controller.reviewOrderModel?.grandTotal}',
                tagtype: '${_controller.reviewOrderModel?.tagName}',
              ),
              const SizedBox(
                height: 10,
              ),
              const DividerLine(lineHeight: 0.6, dividercolor: dividerlinecolor),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset('assets/icons/coupon.svg'),
                      const SizedBox(
                        width: 5,
                      ),
                      const LatoCommonTextWidget(
                          title: 'Coupons and Offers',
                          textColor: normalblack,
                          textSize: 14,
                          textweight: FontWeight.w600),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        LatoCommonTextWidget(
                            title: 'View More Coupons',
                            textColor: normalblack,
                            textSize: 10,
                            textweight: FontWeight.w500),
                        SizedBox(
                          width: 5,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 3),
                          child: Icon(
                            Icons.arrow_forward_ios_outlined,
                            size: 10,
                            color: normalblack,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const DividerLine(lineHeight: 0.6, dividercolor: dividerlinecolor),
              const SizedBox(
                height: 10,
              ),
              const LatoCommonTextWidget(
                  title: 'Price Details',
                  textColor: normalblack,
                  textSize: 16,
                  textweight: FontWeight.w700),
              const SizedBox(
                height: 6,
              ),
              //total mrp
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LatoCommonTextWidget(
                      title: 'Total MRP',
                      textColor: normalblack,
                      textSize: 12,
                      textweight: FontWeight.w500),
                  LatoCommonTextWidget(
                      title: '₹${_controller.reviewOrderModel?.subTotal}',
                      textColor: normalblack,
                      textSize: 14,
                      textweight: FontWeight.w700),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              //discount on mrp
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LatoCommonTextWidget(
                      title: 'Discount on MRP',
                      textColor: normalblack,
                      textSize: 12,
                      textweight: FontWeight.w500),
                  LatoCommonTextWidget(
                      title: '₹${_controller.reviewOrderModel?.discount}',
                      textColor: normalblack,
                      textSize: 14,
                      textweight: FontWeight.w700),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LatoCommonTextWidget(
                      title: 'Coupons',
                      textColor: normalblack,
                      textSize: 12,
                      textweight: FontWeight.w500),
                  InkWell(
                    onTap: () {},
                    child: const LatoCommonTextWidget(
                        title: 'Apply Coupons',
                        textColor: appThemecolor,
                        textSize: 14,
                        textweight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const DividerLine(lineHeight: 0.6, dividercolor: dividerlinecolor),
              const SizedBox(
                height: 10,
              ),
              //discount on mrp
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const LatoCommonTextWidget(
                      title: 'Total',
                      textColor: normalblack,
                      textSize: 16,
                      textweight: FontWeight.w600),
                  LatoCommonTextWidget(
                      title: '₹${_controller.reviewOrderModel?.grandTotal}',
                      textColor: normalblack,
                      textSize: 14,
                      textweight: FontWeight.w700),
                ],
              )
            ],
          ),
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.height * 0.11,
            color: const Color(0xFFFFFFFF),
            child: Column(
              children: [
                DividerLine(lineHeight: 1, dividercolor: Colors.grey.shade300),
                Commonbutton(
                    button: 'Place Order',
                    ontapped: () {
                      Get.to(() => const PaymentDoneSuccessfulScreen(),
                          transition: Transition.cupertino);
                    },
                    horizontalpadding: 15,
                    verticalPadding: 10,
                    bgcolor: appThemecolor,
                    borderwidth: 0,
                    bordercolor: appThemecolor,
                    textclr: whitecolor,
                    txtweight: FontWeight.w500),
              ],
            ),
          ),
               ),
       ),
    );
  }
}
