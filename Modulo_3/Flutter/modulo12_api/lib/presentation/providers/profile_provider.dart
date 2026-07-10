import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/api/dio_client.dart';
import '../../domain/model/user_profile.dart';

final profileProvider = FutureProvider<UserProfile?>((ref) async {
  final dio = ref.watch(dioProvider);
  final response = await dio.get('/users/profile/');
  return UserProfile.fromJson(response.data as Map<String, dynamic>);
});
