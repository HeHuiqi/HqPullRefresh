//
//  AppDelegate.m
//  HqPullRefresh
//
//  Created by hqmac on 2018/11/19.
//  Copyright © 2018 solar. All rights reserved.
//

#import "AppDelegate.h"
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import "HqDecimalNumberUtils.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
//    CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc]init];
    
//    CTCarrier *carrier = [info subscriberCellularProvider];
//    NSLog(@"carrier:%@", [carrier description]);
//    NSLog(@"carrierName=%@",carrier.carrierName);
//    NSLog(@"mobileNetworkCode=%@",carrier.mobileNetworkCode);
//    NSLog(@"mobileCountryCode=%@",carrier.mobileCountryCode);
//    NSLog(@"isoCountryCode=%@",carrier.isoCountryCode);
//    NSLog(@"allowsVOIP=%d",carrier.allowsVOIP);
 
    NSLog(@"--------%@",@(@"85.6".doubleValue));
    NSLog(@"--------%f",@"85.6".doubleValue);
    NSString *num = [HqDecimalNumberUtils addNumber1:@"1.6" nummber2:@"2.9"];
    NSString *num1 = [HqDecimalNumberUtils multiplyNumber1:@"2.0" nummber2:@"2.4"];
    NSLog(@"m-%@,m1=%@",num,num1);



    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
