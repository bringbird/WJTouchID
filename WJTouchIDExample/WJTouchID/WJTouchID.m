//
//  WJTouchID2.m
//  WJTouchIDExample
//
//  Created by bringbird on 16/1/13.
//  Copyright © 2016年 韦明杰 All rights reserved.

//  QQ:6799400 Email:bringbird@163.com.


#import "WJTouchID.h"
#import <LocalAuthentication/LocalAuthentication.h>

@interface WJTouchID ()

@end

@implementation WJTouchID

static WJTouchID *touchID;

+ (instancetype)touchID {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        touchID = [[self alloc]init];
    });
    return touchID;
}

- (void)startWJTouchIDWithMessage:(NSString *)message
                    fallbackTitle:(NSString *)fallbackTitle
                         delegate:(id<WJTouchIDDelegate>)delegate {
    
    LAContext *context = [[LAContext alloc]init];
    
    context.localizedFallbackTitle = fallbackTitle == nil ? WJNotice(@"按钮标题", @"Fallback Title") : fallbackTitle;
    
    NSError *error = nil;
    
    self.delegate = delegate;
    
    NSAssert(self.delegate != nil, WJNotice(@"WJTouchIDDelegate 不能为空", @"WJTouchIDDelegate must be non-nil"));
    
    if ([context canEvaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics error:&error]) {
        
        [context evaluatePolicy:LAPolicyDeviceOwnerAuthenticationWithBiometrics localizedReason:message == nil ? WJNotice(@"自定义信息", @"The Custom Message") : message reply:^(BOOL success, NSError * _Nullable error) {
            
            if (success) {
                
                if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeSuccess)]) {
                    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                        [self.delegate WJTouchIDAuthorizeSuccess];
                    }];
                    
                }
            } else if (error) {
                
                switch (error.code) {
                        
                    case LAErrorAuthenticationFailed: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeFailure)]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                [self.delegate WJTouchIDAuthorizeFailure];
                            }];
                        }
                    }
                        break;
                        
                    case LAErrorUserCancel: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorUserCancel)]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                [self.delegate WJTouchIDAuthorizeErrorUserCancel];
                            }];
                        }
                    }
                        break;
                        
                    case LAErrorUserFallback: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorUserFallback)]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                [self.delegate WJTouchIDAuthorizeErrorUserFallback];
                            }];
                        }
                    }
                        break;
                        
                    case LAErrorSystemCancel:{
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorSystemCancel)]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                [self.delegate WJTouchIDAuthorizeErrorSystemCancel];
                            }];
                        }
                    }
                        break;
                        
                    case LAErrorTouchIDNotEnrolled: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorTouchIDNotEnrolled)]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                [self.delegate WJTouchIDAuthorizeErrorTouchIDNotEnrolled];
                            }];
                        }
                    }
                        break;
                        
                    case LAErrorPasscodeNotSet: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorPasscodeNotSet)]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                [self.delegate WJTouchIDAuthorizeErrorPasscodeNotSet];
                            }];
                        }
                    }
                        break;
                        
                    case LAErrorTouchIDNotAvailable: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorTouchIDNotAvailable)]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                [self.delegate WJTouchIDAuthorizeErrorTouchIDNotAvailable];
                            }];
                        }
                    }
                        break;
                        
                    case LAErrorTouchIDLockout: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorTouchIDLockout)]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                [self.delegate WJTouchIDAuthorizeErrorTouchIDLockout];
                            }];
                        }
                    }
                        break;
                        
                    case LAErrorAppCancel:  {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorAppCancel)]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                [self.delegate WJTouchIDAuthorizeErrorAppCancel];
                            }];
                        }
                    }
                        break;
                        
                    case LAErrorInvalidContext: {
                        
                        if ([self.delegate respondsToSelector:@selector(WJTouchIDAuthorizeErrorInvalidContext)]) {
                            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                                [self.delegate WJTouchIDAuthorizeErrorInvalidContext];
                            }];
                        }
                    }
                        break;
                }
            }
        }];
        
    } else {
        if ([self.delegate respondsToSelector:@selector(WJTouchIDIsNotSupport)]) {
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.delegate WJTouchIDIsNotSupport];
            }];
        }
    }
}
 
@end
