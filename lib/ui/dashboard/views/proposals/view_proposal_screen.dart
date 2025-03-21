import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:how_much_app/core/api/success.dart';
import 'package:how_much_app/core/di/injectable.dart';
import 'package:how_much_app/core/resources/colors_x.dart';
import 'package:how_much_app/core/resources/styles_x.dart';
import 'package:how_much_app/core/routes/routes.gr.dart';
import 'package:how_much_app/features/proposals/cubit/pricing_cubit.dart';
import 'package:how_much_app/ui/widgets/appbar/h_app_bars.dart';
import 'package:how_much_app/ui/widgets/buttons/buttons.dart';
import 'package:how_much_app/ui/widgets/sheet/h_sheets.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class ViewProposalScreen extends StatelessWidget {
  ViewProposalScreen({
    super.key,
    this.proposal
  });

  String? proposal;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PricingCubit, PricingState>(
      builder: (context, state) {
        return Scaffold(
          appBar: HAppBars().mainAppBar(
            bgnColor: Colors.white,
            title: state.genPricingResponseData?.pricing?.id ?? "",
            w: IconButton(
              onPressed: () {
                Clipboard.setData(ClipboardData(text: cleanText(
                          "${proposal ?? state.genPricingResponseData?.invoice}"
                          .replaceAll("**", "")
                          .replaceAll("---", "")
                          .replaceAll("[", "")
                          .replaceAll("(", "")
                          .replaceAll("]", " ")
                          .replaceAll(")", " "),
                        ),)).then((v){
                    handleSuccess(context: si<AppRouter>().navigatorKey.currentContext!, message: "Copied to clipboard!!!");
                  }
                );
              }, 
              icon: const Icon(
                HugeIcons.strokeRoundedCopy01
              )
            )
          ),
          body: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Linkify(
                        onOpen: (link) async {
                          if (await canLaunchUrl(Uri.parse(link.url))) {
                            await launchUrl(Uri.parse(link.url));
                          } else {
                            throw "Could not launch ${link.url}";
                          }
                        },
                        text: cleanText(
                          "${proposal ?? state.genPricingResponseData?.invoice}"
                          .replaceAll("**", "")
                          .replaceAll("---", "")
                          .replaceAll("[", "")
                          .replaceAll("(", "")
                          .replaceAll("]", " ")
                          .replaceAll(")", " "),
                        ),
                        style: getMediumStyle(
                          color: ColorsX.textColor,
                          fontSize: 16
                        ),
                        linkStyle: const TextStyle(color: Colors.blue),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 40, right: 20, top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Estimated Project Cost",
                                  style: getRegularStyle(fontSize: 14, color: ColorsX.textGrey),
                                ),
                                const SizedBox(height: 3,),
                                // Text(
                                //   "${state.genPricingResponseData?.pricing?.currency}${NumberFormat("#,###").format(state.genPricingResponseData?.pricing?.estimatedCost)}",
                                //   style: getBoldStyle(fontSize: 20, color: ColorsX.textColor),
                                // ),
                              ],
                            ),
                            IconButton(
                              onPressed: (){
                                HSheets.showProposalOptions();
                              }, 
                              icon: const Icon(
                                Icons.more_vert,
                              )
                            )
                          ],
                        ),
                        const SizedBox(height: 15,),
                        Buttons.primaryButton(
                          label: "Send proposal", 
                          hasIcon: true,
                          icon: Iconsax.send_1,
                          isIconLeft: true,
                          onTap: (){
                            context.read<PricingCubit>().convertToPdf(
                              cleanText(
                                "${proposal ?? state.genPricingResponseData?.invoice}"
                                .replaceAll("**", "")
                                .replaceAll("---", "")
                                .replaceAll("[", "")
                                .replaceAll("(", "")
                                .replaceAll("]", " ")
                                .replaceAll(")", " "),
                              ),
                            );
                          }
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ).animate().fade(duration: 500.ms),
        );
      },
    );
  }
}

String cleanText(String input) {
  List<String> words = input.split(" ");
  Set<String> seen = {};
  List<String> result = [];

  for (var word in words) {
    if (!seen.contains(word)) {
      seen.add(word);
      result.add(word);
    }
  }

  String cleanedText = result.join(" ");
  
  return cleanedText.replaceAll(RegExp(r'\n{3,}'), '\n\n');
}
