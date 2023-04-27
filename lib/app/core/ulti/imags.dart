class _ImageProvider {
  static String png(String img) {
    return "assets/images/$img.png";
  }

  static String svg(String img) {
    return "assets/svg/$img.svg";
  }

  static String json(String img) {
    return "assets/json/$img.json";
  }
}

class _SvgImages {
  final String logo = _ImageProvider.svg("logo");
  final String whiteLogo = _ImageProvider.svg("white_logo");
  final String finger = _ImageProvider.svg("finger");
  final String eye = _ImageProvider.svg("eye");
  final String notification = _ImageProvider.svg("notification");
  final String deleteCode = _ImageProvider.svg("delete_code");
  final String fourGBill = _ImageProvider.svg("4g_bill");
  final String aboutUs = _ImageProvider.svg("about_us");
  final String account = _ImageProvider.svg("account");
  final String balancePayment1 = _ImageProvider.svg("balance_payment_1");
  final String call = _ImageProvider.svg("call");
  final String cashWithdrawal = _ImageProvider.svg("cash_withdrawal");
  final String cashWithdrawalFromAgents =
      _ImageProvider.svg("cash_withdrawal_from_agents");
  final String cashWithdrawalFromTheAtm =
      _ImageProvider.svg("cash_withdrawal_from_the_atm");
  final String detailsBottomSheet = _ImageProvider.svg("details_bottom_sheet");
  final String electricityBill = _ImageProvider.svg("electricity_bill");
  final String fav = _ImageProvider.svg("fav");
  final String help = _ImageProvider.svg("help");
  final String home = _ImageProvider.svg("home");
  final String landlineBill = _ImageProvider.svg("landline_bill");
  final String logout = _ImageProvider.svg("logout");
  final String moneyRequest = _ImageProvider.svg("money_request");
  final String packages = _ImageProvider.svg("packages");
  final String payments = _ImageProvider.svg("payments");
  final String phoneQrCode = _ImageProvider.svg("phone_qr_code");
  final String balancePayment2 = _ImageProvider.svg("balance_payment_2");
  final String purchases = _ImageProvider.svg("purchases");
  final String qrCode = _ImageProvider.svg("qr_code");
  final String reports = _ImageProvider.svg("reports");
  final String sadFace = _ImageProvider.svg("sad_face");
  final String settings = _ImageProvider.svg("setteings");
  final String share = _ImageProvider.svg("share");
  final String successBottomSheet = _ImageProvider.svg("success_bottom_sheet");
  final String transaction = _ImageProvider.svg("transaction");
  final String transferWithdrawal = _ImageProvider.svg("transfer_withdrawal");
  final String transfers = _ImageProvider.svg("transfers");
  final String usagePolicy = _ImageProvider.svg("usage_policy");
  final String waterBill = _ImageProvider.svg("water_bill");
  final String wifiBill = _ImageProvider.svg("wifi_bill");
  final String boarding3 = _ImageProvider.svg("boarding_3");
  final String boarding2 = _ImageProvider.svg("boarding_2");
  final String boarding1 = _ImageProvider.svg("boarding_1");
  final String search = _ImageProvider.svg("search");
  final String sharIcon = _ImageProvider.svg("shar_icon");
  final String infoIcon = _ImageProvider.svg("info_icon");
  final String helpIcon = _ImageProvider.svg("help_icon");
  final String logoutIcon = _ImageProvider.svg("logout_icon");
  final String profileInfoIcon = _ImageProvider.svg("profile_info_icon");
  final String settingIcon = _ImageProvider.svg("setting_icon");
  final String privacyIcon = _ImageProvider.svg("privacy_icon");
  final String aboutUsIcon = _ImageProvider.svg("about_us_icon");
  final String iconBottomSheet = _ImageProvider.svg("icon_bottom_sheet");
}

class _JsonImages {
  final String noInternet = _ImageProvider.json("no_internet");
  final String onEmpty = _ImageProvider.json("on_empty");
  final String onError = _ImageProvider.json("on_error");
}

class _PngImages {
  final String logo = _ImageProvider.png("logo");
  final String boarding1 = _ImageProvider.png("boarding_1");
  final String boarding2 = _ImageProvider.png("boarding_2");
  final String boarding3 = _ImageProvider.png("boarding_3");
  final String slider = _ImageProvider.png("slider");
  final String test = _ImageProvider.png("test");
}

class AppImages {
  final svg = _SvgImages();
  final png = _PngImages();
  final json = _JsonImages();
}
