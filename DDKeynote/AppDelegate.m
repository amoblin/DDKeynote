//
//  AppDelegate.m
//  DDKeynote
//
//  Created by amoblin on 15/12/14.
//  Copyright © 2015年 marboo. All rights reserved.
//

#import "AppDelegate.h"
#import "DDCoverPage.h"
#import "DDEndPage.h"
#import "DDListPage.h"
#import "DDDetailPage.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    NSArray *dataDictArray = @[
                               @{@"title": @"", @"contentTitle": @"Title", @"subtitle": @"Subtitle", @"layout": @"cover"},
                               @{@"title": @"此处应有标题", @"content": @"这里应有很多字", @"layout": @"detail"},
                               @{@"title": @"此处应有掌声", @"items": @[@"第一项", @"第二项"], @"layout": @"list"},
                               @{@"title": @"", @"contentTitle": @"The End", @"layout": @"end"}];
    
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSDictionary *item in dataDictArray) {
        DDBaseData *data = nil;
        if ([item[@"layout"] isEqualToString:@"cover"]) {
            data = [[DDCoverData alloc] initWithDictionary:item error:nil];
        } else if ([item[@"layout"] isEqualToString:@"end"]) {
            data = [[DDEndData alloc] initWithDictionary:item error:nil];
        } else if ([item[@"layout"] isEqualToString:@"detail"]) {
            data = [[DDDetailData alloc] initWithDictionary:item error:nil];
        } else if ([item[@"layout"] isEqualToString:@"list"]) {
            data = [[DDListData alloc] initWithDictionary:item error:nil];
        } else if ([item[@"layout"] isEqualToString:@""]) {
        }
        if (data != nil) {
            [dataArray addObject:data];
        }
    }
    // Override point for customization after application launch.
    DDCoverPage *page = [[DDCoverPage alloc] initWithDataArray:dataArray];
    page.data = dataArray[0];
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:page];
    self.window.rootViewController = controller;
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
