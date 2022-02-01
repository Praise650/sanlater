class APIUrl {
  static const stagingUrl = "https://kings-cards-staging.herokuapp.com/api/v1";
  static const liveUrl = "https://sanlater.herokuapp.com/api/v1";
  static const accessKey =
      "f001718b98882791eb8829139fe277a59fa845ded3bf2302c14d7940f9c542374ed3312f1deb36524506e9bcf1643fe2b9274cf6b45298e519dfaf424def89e8";
  static const adminKey = "SG.sJAaUazCQ6mdtDWajCpzjg.5tSkBle99fkky778";
  //this is to set when url is staging or live mode
  static const baseUrl = liveUrl;
  static const register = "/auth/register";
  static const verify_otp = "/auth/verify-otp";
  static const refresh_token = "/auth/token/refresh";
  static const login = "auth/login";
  static const profile = "/customer";
  static const products = "/products";
  static const category = "$products/category/all";
  static const product_by_id = "$products/$id";
  static const id = "619efe0e6e2e263c2d701b45";
  static const me = "/me";
  
  // static const dashboard = "/user/dashboard";
  // static const verifyEmail = "/user/verify/email";
  // static const fetchBanks = "https://api.paystack.co/bank";
  // static const verifyBankAccount = "/banks/verify";
  // static const createBankAccount = "/user/accounts";
  // static const withdraw = "/user/withdraw";
  // static const tradeGiftCards = "/user/gift-card";
  // static const makeOldAccountDefault = "/user/account/make/default";
  // static const addDefaultAccount = "/user/accounts";
  // static const deleteAccount = "/user/account/";
  // static const sendVerificationCode = "/user/send/verification";
  // static const markAsRead = "/user/read/notifications";
  // static const updateProfile = "/user";
  // static const changePassword = "/user/password/change";
  // static const verifyForgotPasswordEmail = "/user/password/request";
  // static const resetPassword = "/user/password/reset";
}
