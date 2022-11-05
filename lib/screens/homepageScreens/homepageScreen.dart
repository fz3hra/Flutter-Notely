import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gap/gap.dart';
import 'package:notely/blocs/todo_bloc/get_todo_unique_user/get_todo_unique_user_bloc.dart';
import 'package:notely/utils/colors.dart';
import 'package:notely/widgets/common/appbarsCommon.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  late GetTodoUniqueUserBloc getTodoUniqueUserbloc;

  @override
  void initState() {
    getTodoUniqueUserbloc = BlocProvider.of<GetTodoUniqueUserBloc>(context);
    getTodoUniqueUserbloc.add(getTodoUniqueUserLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorsConstant.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(64.0),
          child: AppBarCommon(
            // TODO change to drawer
            leadingIcon: IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            title: "Recent Notes",
            actionIcon: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: BlocBuilder<GetTodoUniqueUserBloc, GetTodoUniqueUserState>(
            builder: (BuildContext newcontext, state) {
              if (state is GetTodoUniqueUserLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetTodoUniqueUserLoaded) {
                var data = state.getTodoUniqueUsers;
                return GridView.custom(
                  gridDelegate: SliverWovenGridDelegate.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    pattern: [
                      const WovenGridTile(1),
                      const WovenGridTile(
                        5 / 7,
                        crossAxisRatio: 0.9,
                        alignment: AlignmentDirectional.centerEnd,
                      ),
                    ],
                  ),
                  childrenDelegate: SliverChildBuilderDelegate(
                    childCount: data.length,
                    (newContext, index) {
                      var datas = data[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xFFFFFDFA),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  datas.title,
                                  style: const TextStyle(
                                    fontFamily: "Titan-One",
                                    fontSize: 16.0,
                                    color: Color(0xFF595550),
                                  ),
                                ),
                                const Gap(8),
                                Text(
                                  datas.description,
                                  style: const TextStyle(
                                    fontFamily: "Nunito-Bold",
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              if (state is GetTodoUniqueUserError) {
                return Text(state.error.toString());
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
