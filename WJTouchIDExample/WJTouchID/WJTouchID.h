//
//  WJTouchID2.h
//  WJTouchIDExample
//
//  Created by bringbird on 16/1/13.
//  Copyright © 2016年 韦明杰 All rights reserved.

//  QQ:6799400 Email:bringbird@163.com.

#import <Foundation/Foundation.h> 

#define WJNotice(Chinese,English) [[[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] objectAtIndex:0] containsString:@"zh-Hans"] ? Chinese : English 

@protocol WJTouchIDDelegate <NSObject>

@required

/**
 *  TouchID验证成功
 *
 *  Authentication Successul
 */
- (void)WJTouchIDAuthorizeSuccess;

/** 
 *  TouchID验证失败
 *
 *  Authentication Failure
 */
- (void)WJTouchIDAuthorizeFailure;

@optional
/**
 *  取消TouchID验证 (用户点击了取消)
 *
 *  Authentication was canceled by user (e.g. tapped Cancel button).
 */
- (void)WJTouchIDAuthorizeErrorUserCancel;

/**
 *  在TouchID对话框中点击输入密码按钮
 *
 *  User tapped the fallback button
 */
- (void)WJTouchIDAuthorizeErrorUserFallback;

/** 
 *  在验证的TouchID的过程中被系统取消 例如突然来电话、按了Home键、锁屏...
 *
 *  Authentication was canceled by system (e.g. another application went to foreground).
 */
- (void)WJTouchIDAuthorizeErrorSystemCancel;

/** 
 *  无法启用TouchID,设备没有设置密码
 *
 *  Authentication could not start, because passcode is not set on the device.
 */
- (void)WJTouchIDAuthorizeErrorPasscodeNotSet;

/**
 *  设备没有录入TouchID,无法启用TouchID
 *
 *  Authentication could not start, because Touch ID has no enrolled fingers
 */
- (void)WJTouchIDAuthorizeErrorTouchIDNotEnrolled;

/**
 *  该设备的TouchID无效
 *
 *  Authentication could not start, because Touch ID is not available on the device.
 */
- (void)WJTouchIDAuthorizeErrorTouchIDNotAvailable;

/** 
 *  多次连续使用Touch ID失败，Touch ID被锁，需要用户输入密码解锁
 *
 *  Authentication was not successful, because there were too many failed Touch ID attempts and Touch ID is now locked. Passcode is required to unlock Touch ID, e.g. evaluating LAPolicyDeviceOwnerAuthenticationWithBiometrics will ask for passcode as a prerequisite.
 *
 */
- (void)WJTouchIDAuthorizeErrorTouchIDLockout;

/**
 *  当前软件被挂起取消了授权(如突然来了电话,应用进入前台)
 *
 *  Authentication was canceled by application (e.g. invalidate was called while authentication was inprogress).
 *
 */
- (void)WJTouchIDAuthorizeErrorAppCancel;

/** 
 *  当前软件被挂起取消了授权 (授权过程中,LAContext对象被释)
 *
 *  LAContext passed to this call has been previously invalidated.
 */
- (void)WJTouchIDAuthorizeErrorInvalidContext;

/**
 *  当前设备不支持指纹识别
 *
 *  The current device does not support fingerprint identification
 */
-(void)WJTouchIDIsNotSupport;

@end

@interface WJTouchID : NSObject

@property (nonatomic, weak) id<WJTouchIDDelegate> delegate;

+ (instancetype)touchID;

/**
 *  发起TouchID验证 (Initiate TouchID validation)
 *
 *  @param message       自定义提示信息 (The custom message)
 *  @param fallbackTitle 按钮标题      (Fallback Title)
 *  @param delegate      delegate
 */
- (void)startWJTouchIDWithMessage:(NSString *)message
                    fallbackTitle:(NSString *)fallbackTitle
                         delegate:(id<WJTouchIDDelegate>)delegate;

@end