// ignore_for_file: constant_identifier_names

import "package:get/get.dart";

class AppTranslation extends Translations {
  @override
  Map<String, Map<String, String>> get keys {
    return <String, Map<String, String>>{
      AppKey.en_US.name: <String, String>{
        AppKey.appTitle.name: "Wallet Online",
        AppKey.labelHome.name: "Home",
        AppKey.labelCategories.name: "Categories",
        AppKey.labelStatistic.name: "Statistic",
        AppKey.labelSettings.name: "Settings",
        AppKey.balance.name: "Balance",
        AppKey.incomes.name: "Incomes",
        AppKey.expenses.name: "Expenses",
        AppKey.newIncome.name: "New Income",
        AppKey.newExpenses.name: "New Expense",
        AppKey.typeNewIncome.name: "Type New Income...",
        AppKey.typeNewExpenses.name: "Type New Expense...",
        AppKey.labelCategory.name: "Category",
        AppKey.labelSave.name: "Save",
        AppKey.labelAdd.name: "Add",
        AppKey.labelUpdate.name: "Update",
        AppKey.messageUpdate.name: "Updated Successfully",
        AppKey.typeMessage.name: "Type Something...",
        AppKey.labelYesterday.name: "Yesterday",
        AppKey.labelToday.name: "Today",
        AppKey.labelTomorrow.name: "Tomorrow",
        AppKey.noDataFound.name: "No Data Found",
        AppKey.currencyLabel.name: "Currency",
        AppKey.languageLabel.name: "Language",
        AppKey.amount.name: "200",
        AppKey.errorTitle.name: "Error",
        AppKey.errorMessage.name: "Something Went Wrong",
      },
    };
  }
}

enum AppKey {
  en_US,
  fr_FR,

  appTitle,
  labelHome,
  labelCategories,
  labelStatistic,
  labelSettings,
  balance,
  incomes,
  expenses,
  newIncome,
  newExpenses,
  typeNewIncome,
  typeNewExpenses,
  labelCategory,
  labelSave,
  labelAdd,
  labelUpdate,
  messageUpdate,
  typeMessage,
  labelYesterday,
  labelToday,
  labelTomorrow,
  noDataFound,
  currencyLabel,
  languageLabel,
  amount,
  errorTitle,
  errorMessage,
}
