import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/configs/constants/app_routes.dart';
import '../../../../core/injection/injection_container.dart';
import '../../../../core/presentation/pages/widgets/simple_button.dart';
import '../../../../core/services/navigation_service.dart';
import '../bloc/add_publication_cubit/add_publication_cubit.dart';
import '../widgets/add_card_button.dart';
import '../widgets/card_item.dart';

class CardsPage extends StatelessWidget {
  const CardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddPublicationCubit, AddPublicationState>(builder: (context, state) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return index == 2
                      ? Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 51),
                              child: AddCardButton(
                                onTap: () => sl<NavigatorService>().pushNamed(AppRoutes.addNewCardPage),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 255, bottom: 40),
                              child: SimpleButton(
                                text: 'Next Step',
                                onTap: () {
                                  context.read<AddPublicationCubit>().incrementStep();
                                },
                              ),
                            ),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: GestureDetector(
                            onTap: () => context.read<AddPublicationCubit>().selectCard(index),
                            child: CardItem(
                              isSelected: state.selectedCardId == index,
                            ),
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      );
    });
  }
}
