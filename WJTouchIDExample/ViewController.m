//
//  ViewController.m
//  WJTouchIDExample
//
//  Created by bringbird on 16/1/13.
//  Copyright © 2016年 韦明杰 All rights reserved.

//  QQ:6799400 Email:bringbird@163.com.


#import "ViewController.h"
#import "WJTouchID.h"

@interface ViewController ()<WJTouchIDDelegate>
@property (weak, nonatomic) IBOutlet UILabel *Notice;
@property (nonatomic, strong) WJTouchID *touchID;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    WJTouchID *touchid = [[WJTouchID alloc]init];
    
    [touchid startWJTouchIDWithMessage:WJNotice(@"自定义信息", @"The Custom Message") fallbackTitle:WJNotice(@"按钮标题", @"Fallback Title") delegate:self];
    
    self.touchID = touchid;
    
}
- (IBAction)StartWJTouchID {
    [self.touchID startWJTouchIDWithMessage:WJNotice(@"这里可以自定义", @"The Custom Message") fallbackTitle:WJNotice(@"按钮标题", @"Fallback Title") delegate:self];
}
/**
 *  TouchID验证成功
 *
 *  (English Comments) Authentication Successul  Authorize Success
 */
- (void) WJTouchIDAuthorizeSuccess {
    self.Notice.text = WJNotice(@"TouchID验证成功", @"Authorize Success");
}

/**
 *  TouchID验证失败
 *
 *  (English Comments) Authentication Failure
 */
- (void) WJTouchIDAuthorizeFailure {
    self.Notice.text = WJNotice(@"TouchID验证失败", @"Authorize Failure");
}
/**
 *  取消TouchID验证 (用户点击了取消)
 *
 *  (English Comments) Authentication was canceled by user (e.g. tapped Cancel button).
 */
- (void) WJTouchIDAuthorizeErrorUserCancel {
    
    self.Notice.text = WJNotice(@"取消TouchID验证 (用户点击了取消)", @"Authorize Error User Cancel");
}

/**
 *  在TouchID对话框中点击输入密码按钮
 *
 *  (English Comments) User tapped the fallback button
 */
- (void) WJTouchIDAuthorizeErrorUserFallback {
    self.Notice.text = WJNotice(@"在TouchID对话框中点击输入密码按钮", @"Authorize Error User Fallback ");
}

/**
 *  在验证的TouchID的过程中被系统取消 例如突然来电话、按了Home键、锁屏...
 *
 *  (English Comments) Authentication was canceled by system (e.g. another application went to foreground).
 */
- (void) WJTouchIDAuthorizeErrorSystemCancel {
    self.Notice.text = WJNotice(@"在验证的TouchID的过程中被系统取消 ", @"Authorize Error System Cancel");
}

/**
 *  无法启用TouchID,设备没有设置密码
 *
 *  (English Comments) Authentication could not start, because passcode is not set on the device.
 */
- (void) WJTouchIDAuthorizeErrorPasscodeNotSet {
    self.Notice.text = WJNotice(@"无法启用TouchID,设备没有设置密码", @"Authorize Error Passcode Not Set");
}

/**
 *  设备没有录入TouchID,无法启用TouchID
 *
 *  (English Comments) Authentication could not start, because Touch ID has no enrolled fingers
 */
- (void) WJTouchIDAuthorizeErrorTouchIDNotEnrolled {
    self.Notice.text = WJNotice(@"设备没有录入TouchID,无法启用TouchID", @"Authorize Error TouchID Not Enrolled");
}

/**
 *  该设备的TouchID无效
 *
 *  (English Comments) Authentication could not start, because Touch ID is not available on the device.
 */
- (void) WJTouchIDAuthorizeErrorTouchIDNotAvailable {
    self.Notice.text = WJNotice(@"该设备的TouchID无效", @"Authorize Error TouchID Not Available");
}

/**
 *  多次连续使用Touch ID失败，Touch ID被锁，需要用户输入密码解锁
 *
 *  (English Comments) Authentication was not successful, because there were too many failed Touch ID attempts and Touch ID is now locked. Passcode is required to unlock Touch ID, e.g. evaluating LAPolicyDeviceOwnerAuthenticationWithBiometrics will ask for passcode as a prerequisite.
 *
 */
- (void) WJTouchIDAuthorizeLAErrorTouchIDLockout {
    self.Notice.text = WJNotice(@"多次连续使用Touch ID失败，Touch ID被锁，需要用户输入密码解锁", @"Authorize LAError TouchID Lockout");
}

/**
 *  当前软件被挂起取消了授权(如突然来了电话,应用进入前台)
 *
 *  (English Comments) Authentication was canceled by application (e.g. invalidate was called while authentication was inprogress).
 *
 */
- (void) WJTouchIDAuthorizeLAErrorAppCancel {
    self.Notice.text = WJNotice(@"当前软件被挂起取消了授权", @"Authorize LAError AppCancel");
}

/**
 *  当前软件被挂起取消了授权 (授权过程中,LAContext对象被释)
 *
 *  (English Comments) LAContext passed to this call has been previously invalidated.
 */
- (void) WJTouchIDAuthorizeLAErrorInvalidContext {
    self.Notice.text = WJNotice(@"当前软件被挂起取消了授权", @"Authorize LAError Invalid Context");
}
/**
 *  当前设备不支持指纹识别
 *
 *  (English Comments) The current device does not support fingerprint identification
 */
-(void)WJTouchIDIsNotSupport {
    self.Notice.text = WJNotice(@"当前设备不支持指纹识别", @"The Current Device Does Not Support");
}
@end
//



