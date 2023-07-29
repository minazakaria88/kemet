import 'package:exlpore_egypt/appcubit/cubit.dart';
import 'package:exlpore_egypt/appcubit/state.dart';
import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../details_screen/event_details.dart';

class Events extends StatelessWidget {
  const Events({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).events;
        return Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
            right: 8,
            bottom: 8,
            top: 1,
          ),
          child: list.isNotEmpty
              ? ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) => listItem(
                    onTap: () {
                      goTo(
                        context: context,
                        screen: EventDetails(list[index]),
                      );
                      return null;
                    },
                    model: list[index],
                  ),
                  separatorBuilder: (context, index) => Container(
                    height: 2,
                  ),
                  itemCount: list.length,
                )
              : const Center(
                  child: CircularProgressIndicator(
                  color: Colors.black,
                )),
        );
      },
    );
  }
}
