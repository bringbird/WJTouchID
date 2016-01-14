# WJTouchID
* An easy way to use TouchID Authorize
* 用法超简单的TouchID验证，只需几步就可快速集成。
* 更详细的说明请自行进入WJTouchIDExample里查看

## 如何使用WJTouchID 
* 将`WJTouchID`文件夹中的两个文件(`WJTouchID.h``WJTouchID.m`)拽入项目中
* 导入头文件：`#import "WJTouchID.h"`

* 这里只是简单介绍怎么使用

/** 初始化 */
WJTouchID *touchid = [[WJTouchID alloc]init]; 
touchid.delegate = self;  
touchid.WJTouchIDFallbackTitle = WJNotice(@"自定义按钮标题", @"The Custom Fallback Title");
/** 发起TouchID验证 */
[touchid startWJTouchIDWithMessage:WJNotice(@"自定义提示语", @"The Custom Message")];

/** 通过代理方法监听TouchID验证的结果 */ 
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