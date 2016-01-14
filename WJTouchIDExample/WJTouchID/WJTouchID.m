//
//  WJTouchID2.m
//  WJTouchIDExample
//
//  Created by bringbird on 16/1/13.
//  Copyright © 2016年 韦明杰 All rights reserved.

//  QQ:6799400 Email:bringbird@163.com.


#import "WJTouchID.h"



@implementation WJTouchID
- (void) startWJTouchIDWithMessage:(NSString *)message {
    
    LAContext *context = [[LAContext alloc]init];
    
    context.localizedFallbackTitle = self.WJTouchIDFallbackTitle;
    
    NSError *error = nil;
    
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        /// @param localizedReason 不可为空或者空字符串，否则无法发起TouchID验证,导致崩溃并抛出
        ///                        NSInvalidArgumentException 信息
        
        /// @param localizedReason This parameter is mandatory and the call will throw
        ///                        NSInvalidArgumentException if nil or empty string is specified
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:message == nil ? WJNotice(@"默认提示信息", @"The Default Message") : message reply:^(BOOL success, NSError * _Nullable error) {

            self.WJTouchIDErroMessge = error;
            
            if (success) {
                
                if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeSuccess)]) {
                    
                        [self.delegate WJTouchIDAuthorizeSuccess];
                }
            } else if (error) {
                
                switch (error.code) {
                        
                    case LAErrorAuthenticationFailed: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeFailure)]) {
                            
                                [self.delegate WJTouchIDAuthorizeFailure];
                        }
                    }
                        break;
                        
                    case LAErrorUserCancel: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorUserCancel)]) {
                            
                                [self.delegate WJTouchIDAuthorizeErrorUserCancel];
                        }
                    }
                        break;
                        
                    case LAErrorUserFallback: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorUserFallback)]) {
                            
                                [self.delegate WJTouchIDAuthorizeErrorUserFallback];
                        }
                    }
                        break;
                        
                    case LAErrorSystemCancel:{
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorSystemCancel)]) {
                            
                                [self.delegate WJTouchIDAuthorizeErrorSystemCancel];
                        }
                    }
                        break;
                        
                    case LAErrorTouchIDNotEnrolled: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorTouchIDNotEnrolled)]) {
                            
                                [self.delegate WJTouchIDAuthorizeErrorTouchIDNotEnrolled];
                        }
                    }
                        break;
                        
                    case LAErrorPasscodeNotSet: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorPasscodeNotSet)]) {
                            
                                [self.delegate WJTouchIDAuthorizeErrorPasscodeNotSet];
                        }
                    }
                        break;
                        
                    case LAErrorTouchIDNotAvailable: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorTouchIDNotAvailable)]) {
                            
                            [self.delegate WJTouchIDAuthorizeErrorTouchIDNotAvailable];
                        }
                    }
                        break;
                        
                    case LAErrorTouchIDLockout: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorTouchIDLockout)]) {
                            
                            [self.delegate WJTouchIDAuthorizeErrorTouchIDLockout];
                        }
                    }
                        break;
                        
                    case LAErrorAppCancel:  {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorAppCancel)]) {
                            
                            [self.delegate WJTouchIDAuthorizeErrorAppCancel];
                        }
                    }
                        break;
                        
                    case LAErrorInvalidContext: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorInvalidContext)]) {
                            
                            [self.delegate WJTouchIDAuthorizeErrorInvalidContext];
                        }
                    }
                        break;
                }
            }
        }];
        
    } else {
        
        if ([self.delegate respondsToSelector:@selector(WJTouchIDIsNotSupport)]) {
            
            [self.delegate WJTouchIDIsNotSupport];
        }
    }
}
 
@end
