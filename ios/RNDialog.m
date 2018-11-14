//
//  QXXRectDialogModule.m
//  QuXueXiTeacherRN
//
//  Created by QuDian on 2018/11/5.
//  Copyright © 2018年 Facebook. All rights reserved.
//

#import "RNDialog.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTEventDispatcher.h>
#import <React/RCTBridgeModule.h>
#import <MBProgressHUD.h>
@interface RNDialog () <RCTBridgeModule>

@end
@implementation RNDialog

RCT_EXPORT_MODULE(@"QXXDialogModule")

- (dispatch_queue_t)methodQueue {
    return dispatch_get_main_queue();
}

+ (BOOL)requiresMainQueueSetup {
    return YES;
}

RCT_EXPORT_METHOD(showLoadingDialog:(NSString*)title)
{
    UIView* view = [RNDialog getCurrentNavTopViewController].view;
    MBProgressHUD* progressHUD = [[MBProgressHUD alloc] initWithFrame:view.bounds];
    progressHUD.mode = MBProgressHUDModeIndeterminate;
    progressHUD.removeFromSuperViewOnHide = YES;
    progressHUD.center = view.center;
    progressHUD.label.text = title;
    [view addSubview:progressHUD];
    [progressHUD showAnimated:YES];
}

RCT_EXPORT_METHOD(hideLoadingDialog)
{
    UIView* view = [RNDialog getCurrentNavTopViewController].view;
    [MBProgressHUD hideAllHUDsForView:view animated:YES];
    
}
RCT_EXPORT_METHOD(showContentDialog:(NSString*)title content:(NSString*)content buttonText:(NSString*)buttonText canBack:(BOOL)canBack canDismiss:(BOOL)canDismiss)
{
    ScottAlertView *alertView = [ScottAlertView alertViewWithTitle:title message:content];
    alertView.buttonDestructiveBgColor = [UIColor whiteColor];
    alertView.buttonDestructiveTextColor = [UIColor grayColor];
    alertView.layer.masksToBounds = YES;
    alertView.layer.cornerRadius = 8.0;
    ScottAlertAction *action = [ScottAlertAction actionWithTitle:buttonText style:ScottAlertActionStyleDestructive handler:nil];
    [alertView addAction:action];
    
    [ScottShowAlertView showAlertViewWithView:alertView backgroundDismissEnable:canDismiss];
    
    
}

+ (UIViewController *)getCurrentNavTopViewController {
    UIWindow *rootWindow = nil;
    // 此处不能通过 keywindow 简单获取, 应取 windows 中有 rootViewController 的
    for (UIWindow *window in [UIApplication sharedApplication].windows) {
        if ([window.rootViewController isKindOfClass:[UITabBarController class]]) {
            // 现有框架是以 tabBarController 作为根控制器的
            rootWindow = window;
            break;
        }
    }
    if ([UIApplication sharedApplication].keyWindow && (rootWindow == nil)) {
        rootWindow = [UIApplication sharedApplication].keyWindow;
        NSAssert(rootWindow != nil, @"获取当前程序window的根控制器出错");
    }
    UIViewController *topViewController = rootWindow.rootViewController;
    if ([topViewController isKindOfClass:[UITabBarController class]]) {
        if ((((UITabBarController *)topViewController).selectedViewController)) {
            topViewController = ((UITabBarController *)topViewController).selectedViewController;
        }
    }
    if ([topViewController isKindOfClass:[UINavigationController class]]) {
        if (((UINavigationController *)topViewController).topViewController) {
            topViewController = ((UINavigationController *)topViewController).topViewController;
        }
    }
    return topViewController;
}
@end
