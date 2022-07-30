import 'package:auth_api/auth_api.dart';
import 'package:auth_repository/auth_repository.dart';
import 'package:client/app/modules/dashboard/bloc/dashboard_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_repository/products_repository.dart';
import 'components/body.dart';

class DashBoardWrapperScreen extends StatelessWidget {
  const DashBoardWrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardBloc(
          context.read<ProductsRepository>(), context.read<AuthRepository>())
        ..add(const DashboardEvent.started()),
      child: const DashBoardScreen(),
    );
  }
}

class DashBoardScreen extends StatelessWidget {
  static const String routeName = "/home";

  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("DashBoard Create");
    return BlocBuilder<DashboardBloc, DashboardState>(
      builder: (context, state) {
        return Scaffold(
          body: RefreshIndicator(
              onRefresh: () async {
                context
                    .read<DashboardBloc>()
                    .add(const DashboardEvent.started());
              },
              child: Body()),
        );
      },
    );
  }
}
