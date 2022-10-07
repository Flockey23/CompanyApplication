import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:myapp/domain/state/home/home_state.dart';
import 'package:myapp/presentation/util/constant_styles.dart';
import 'package:myapp/presentation/ui/pages/Company/show_details.dart';
import 'package:myapp/presentation/ui/pages/Company/update.dart';

class CompanyInformation extends StatelessWidget {
  const CompanyInformation({super.key,required this.homeState});
  final HomeState homeState;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (homeState.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return ListView.builder(
          itemCount: homeState.companies.length,
          itemBuilder: (context, i) {
            final company = homeState.companies[i];
            return Observer(builder: (context) {
              return ListTile(
                tileColor: homeState.selectedCompanies[i].selected == true
                    ? Colors.grey
                    : Colors.black12,
                onTap: () {
                  homeState.setStateSelectedCompanies(index: i);
                },
                onLongPress: () {
                  Navigator.push(context,
                      MaterialPageRoute(
                          builder: (context) => const ShowDetailsCompany(),
                          settings: RouteSettings(arguments: company)));
                },
                shape: const Border(bottom: BorderSide()),
                title: Text("Название:${company.title}"),
                subtitle: Text("Сайт:${company.site}"),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: ConstantStyles.iconSize,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context) => const CompanyUpdate(),
                            settings: RouteSettings(arguments: company)));
                  },
                ),
              );
            });
          });
    });
  }
}