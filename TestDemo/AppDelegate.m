//
//  AppDelegate.m
//  TestDemo
//
//  Created by MacBook on 2021/2/25.
//

#import "AppDelegate.h"
#import "../Lionu-SDK/LionuSDK.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor blackColor];
    UIStoryboard * mainStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    ViewController * VC = [mainStoryBoard instantiateInitialViewController];
    self.window.rootViewController = VC;
    [self.window makeKeyAndVisible];
    
    //SDK初始化
    [[LionuDeviceInfoSDK shareInstance] initSDKWithHostUrl:@"https://testapi.digitalevers.com" APPID:@"50"];

    //配置SDK是否打印上报参数
    [LionuDeviceInfoSDK shareInstance].configModel.isLog = YES;
    //配置SDK是否对uuid 和 idfa开启md5
    [LionuDeviceInfoSDK shareInstance].configModel.isMD5 = YES;
    ///配置SDK是否开启AES加密
    [LionuDeviceInfoSDK shareInstance].configModel.isAES = YES;
    ///配置SDK base64 aes key
    [LionuDeviceInfoSDK shareInstance].configModel.base64AesKey = @"aIlPkPRHwHpmuJj2qCkbCRw6N4+KRcHYpf2VwU33lvU=";
    
    //启动上报
    [[LionuDeviceInfoSDK shareInstance] startLaunchEvent];

    return YES;
}



@end
