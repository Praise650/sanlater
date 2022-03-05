abstract class ProfileService {
Future getUserProfile();
Future updateProfile({String? firstName,String? lastName,String? phoneNumber});
Future addAvatar({String? imgUrl});
Future fetchUserById({String? userId});
}