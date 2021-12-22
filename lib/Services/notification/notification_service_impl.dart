import 'notification_service.dart';

class NotificationServiceImpl extends NotificationService {
  @override
  void disableNotification() {}

  @override
  void enableNotification() {}

  @override
  void init({
    String? externalUserId,
    required NotificationDelegate notificationDelegate,
  }) {}

  @override
  void setExternalId(String? userId) {}

  @override
  void removeExternalId() {}
}
