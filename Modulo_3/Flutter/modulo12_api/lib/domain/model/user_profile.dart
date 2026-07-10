class UserProfile {
  final int     id;
  final String  username;
  final String  email;
  final String  firstName;
  final String  lastName;
  final bool    isStaff;
  final bool    isActive;
  final String? avatarUrl;

  const UserProfile({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.isStaff,
    required this.isActive,
    this.avatarUrl,
  });

  factory UserProfile.fromJson(Map<String, dynamic> j) => UserProfile(
    id:        j['id']          as int,
    username:  j['username']    as String,
    email:     j['email']       as String,
    firstName: j['first_name']  as String,
    lastName:  j['last_name']   as String,
    isStaff:   j['is_staff']    as bool,
    isActive:  j['is_active']   as bool,
    avatarUrl: j['avatar_url']  as String?,
  );
}
