//
//  AppDelegate.m
//  partTimeJob
//
//  Created by mac on 17/8/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "Loan.h"
#import "Banner.h"
#import "Jobs.h"
#import "CustomTabBarController.h"
#import <IQKeyboardManager/IQKeyboardManager.h>
#import "WelcomeViewController.h"
@interface AppDelegate ()<WelcomeDelegate>
{
    UINavigationController *nav;

}
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
   
    [NSThread sleepForTimeInterval:1];

    [AVOSCloud setApplicationId:@"9tlnEWXoWAi9gyLIMKT6Ki7H-gzGzoHsz" clientKey:@"xlNTpMbmuTcIrdEykmXAmyeo"];
    [Loan registerSubclass];
    [Banner registerSubclass];
    [Jobs registerSubclass];
    self.window=[[UIWindow alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor=[UIColor whiteColor];

    CustomTabBarController *tabBarView=[[CustomTabBarController alloc]init];
    nav=[[UINavigationController alloc]initWithRootViewController:tabBarView];
    NSString *isfirstLoad=[[NSUserDefaults standardUserDefaults]objectForKey:@"GUIDE"];
    if([isfirstLoad isEqualToString:@"guide"])
    {
        self.window.rootViewController=nav;

    }
    else
    {
        [self showWelcomeViewcontroller];
    }

    
    [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)showWelcomeViewcontroller{

    [[NSUserDefaults standardUserDefaults]setObject:@"guide" forKey:@"GUIDE"];
    WelcomeViewController *welcomeView=[[WelcomeViewController alloc]init];
    welcomeView.delegate=self;
    self.window.rootViewController=welcomeView;
    
}
- (void)hideWelcomeController{
    
    self.window.rootViewController=nav;
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
