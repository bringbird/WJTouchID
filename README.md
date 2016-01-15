# WJTouchID
  * An easy way to use TouchID Authorize
  * 用法简单的TouchID验证框架：两行代码搞定。

## 如何使用WJTouchID 
  * 将`WJTouchID`文件夹中的两个文件(`WJTouchID.h``WJTouchID.m`)拖入项目中
  * 导入头文件：`#import "WJTouchID.h"`
```objc
/** 初始化 */
WJTouchID *touchid = [[WJTouchID alloc]init]; 

/** 发起TouchID验证 */
[touchid startWJTouchIDWithMessage:@"自定义信息" fallbackTitle:@"按钮标题" delegate:self];

/** 通过代理方法监听TouchID验证的所有结果 */ 

/** 其中的成功回调和失败回调是必须要实现的，其他的按实际情况各取所需 */
@required
- (void)WJTouchIDAuthorizeSuccess; 
- (void)WJTouchIDAuthorizeFailure; 

@optional
- (void)WJTouchIDIsNotSupport;
- (void)WJTouchIDAuthorizeErrorAppCancel;
- (void)WJTouchIDAuthorizeErrorUserCancel; 
- (void)WJTouchIDAuthorizeErrorUserFallback; 
- (void)WJTouchIDAuthorizeErrorSystemCancel; 
- (void)WJTouchIDAuthorizeErrorPasscodeNotSet; 
- (void)WJTouchIDAuthorizeErrorTouchIDLockout;
- (void)WJTouchIDAuthorizeErrorInvalidContext;
- (void)WJTouchIDAuthorizeErrorTouchIDNotEnrolled; 
- (void)WJTouchIDAuthorizeErrorTouchIDNotAvailable;
```
![image](https://github.com/bringbird/WJTouchID/raw/master/WJTouchID_2.gif)