//
//  AppDelegate.m
//  DogsC
//
//  Created by Zebadiah Watson on 10/9/19.
//  Copyright © 2019 Zebadiah Watson. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [[ZWWBreedController sharedController] fetchBreeds:^(NSArray<ZWWBreed *> * _Nonnull breeds) {
        NSLog(@"%@", breeds);
        ZWWBreed *breed = breeds[0];
        ZWWSubBreeds *subbreed = breed.subbreeds[0];
        [ZWWBreedController.sharedController fetchSubBreedImageUrl:subbreed breed:breed completion:^(NSArray * _Nonnull array) {
            
        }];
        for (ZWWBreed *dog in breeds)
        {
            NSLog(@"%@", dog.name);
        }
    }];
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
