
import 'package:exlpore_egypt/appcubit/cubit.dart';
import 'package:exlpore_egypt/appcubit/state.dart';
import 'package:exlpore_egypt/shared/reuable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../details_screen/place_details.dart';

class Places extends StatelessWidget {
  const Places({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = AppCubit.get(context).places;
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: list.isNotEmpty
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) => listItem(
                            model: list[index],
                            onTap: () {
                              goTo(
                                screen: PlaceDetails(list[index]),
                                context: context,
                              );
                              return null;
                            }),
                        separatorBuilder: (context, index) => Container(
                          height: 7,
                        ),
                        itemCount: list.length,
                      )
                    : const Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Colors.black,
                          ),
                        ),
                      ),
              ),
            ],
          ),
        );
      },
    );
  }
}
