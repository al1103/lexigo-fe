# Firebase Notifications Setup Guide

## ✅ Đã hoàn thành:

### 1. **Firebase Configuration**

- ✅ Cập nhật `firebase_options.dart` với config thật từ `google-services.json`
- ✅ Project ID: `lexigo-d1bfb`
- ✅ Package name: `com.zilong.lexigo`
- ✅ API Key: `AIzaSyCMx7fir8CPontFP5yWHdiDPzqiNwJQUL8`

### 2. **Android Setup**

- ✅ Cập nhật `AndroidManifest.xml` với permissions:
  - `POST_NOTIFICATIONS` (Android 13+)
  - `VIBRATE`, `WAKE_LOCK`, `RECEIVE_BOOT_COMPLETED`
  - Firebase C2DM permissions
- ✅ Thêm Firebase Messaging Service configuration
- ✅ Tạo `colors.xml` với notification colors
- ✅ File `google-services.json` đã có sẵn

### 3. **Flutter Code**

- ✅ `NotificationService` hoàn chỉnh với:
  - Token management và refresh
  - Topic subscription/unsubscription
  - Error handling
  - Background/foreground/terminated handling
- ✅ Enhanced `app.dart` với Firebase integration
- ✅ Stylized notification UI

## 🚀 Test Notifications:

### 1. **Firebase Console Test**

1. Mở [Firebase Console](https://console.firebase.google.com)
2. Chọn project `lexigo-d1bfb`
3. Vào **Cloud Messaging**
4. Nhấn **Send your first message**
5. Nhập title, body
6. Chọn app target: `com.zilong.lexigo`
7. Send test message

### 2. **Test Scenarios**

- **Foreground**: App mở → Notification hiện SnackBar
- **Background**: App ở background → System notification → Tap vào
- **Terminated**: App đóng → System notification → Tap mở app

### 3. **Debug Console**

Kiểm tra logs trong VS Code debug console:

```
[log] FCM Token: [your-token]
[log] Notification permission: AuthorizationStatus.authorized
[log] Subscribed to topic: lexigo_users
```

## 📱 Notification Features:

### **Current Features:**

- ✅ **Permission handling**: Auto request + status check
- ✅ **Token management**: Get, refresh, delete
- ✅ **Topic subscription**: Subscribe/unsubscribe to topics
- ✅ **Foreground display**: Beautiful SnackBar with icon
- ✅ **Background handling**: System notifications
- ✅ **Navigation**: Route based on notification data
- ✅ **Error handling**: Try-catch với meaningful logs

### **Notification Data Format:**

```json
{
  "notification": {
    "title": "Lexigo Reminder",
    "body": "Time for your daily English practice!"
  },
  "data": {
    "type": "lesson",
    "action": "lesson_reminder",
    "lesson_id": "123"
  }
}
```

### **Routing Logic:**

- `type: "lesson"` → Navigate to lesson screen
- `type: "speaking"` → Navigate to speaking screen
- `type: "quiz"` → Navigate to quiz screen
- `type: "profile"` → Navigate to profile screen

## 🔧 Next Steps:

### **Server Integration:**

1. **Send FCM token to server** (in `_sendTokenToServer()`)
2. **API endpoint** để update user FCM token
3. **Server-side** notification sending logic

### **iOS Setup** (if needed):

1. Add `GoogleService-Info.plist` to iOS project
2. Configure iOS capabilities for notifications
3. Test on iOS device

### **Advanced Features:**

- Scheduled notifications
- Rich notifications với images
- Action buttons trong notifications
- Badge count management

## 🐛 Troubleshooting:

### **Common Issues:**

1. **No FCM token**: Check internet connection + permissions
2. **Notifications not showing**: Verify `google-services.json` placement
3. **Background not working**: Check `AndroidManifest.xml` service config
4. **Permission denied**: Manually enable in device settings

### **Debug Commands:**

```bash
# Check Firebase project connection
flutter pub deps
flutter clean && flutter pub get

# Verify Android setup
cd android && ./gradlew clean
```

## 🔄 Build Variants Configuration:

### **Tình trạng hiện tại:**

- ✅ Development build sử dụng package name: `com.zilong.lexigo` (cùng với production)
- ⚠️ Staging build sử dụng package name: `com.zilong.lexigo.stg` (cần setup Firebase client)

### **Để setup hoàn chỉnh cho tất cả environments:**

1. **Truy cập Firebase Console:**

   - Mở: https://console.firebase.google.com/project/lexigo-d1bfb
   - Click "Add app" → chọn Android icon

2. **Thêm Android app cho Staging:**

   - Package name: `com.zilong.lexigo.stg`
   - App nickname: "Lexigo Staging"
   - Download `google-services.json`

3. **Cấu hình multiple google-services.json:**

   ```
   android/app/src/
   ├── main/google-services.json (production + development)
   └── staging/google-services.json (staging)
   ```

4. **Nếu muốn tách development riêng:**
   - Tạo client với package: `com.zilong.lexigo.dev`
   - Restore `applicationIdSuffix ".dev"` trong `build.gradle`

## 📊 Status: READY FOR TESTING 🎯

Firebase notifications đã được setup hoàn chỉnh và sẵn sàng để test!
