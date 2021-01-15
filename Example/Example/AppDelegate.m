//
//  AppDelegate.m
//  Example
//
//  Created by gaokun on 2021/1/14.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = ViewController.new;
    [self.window makeKeyAndVisible];
    return YES;
}

@end
