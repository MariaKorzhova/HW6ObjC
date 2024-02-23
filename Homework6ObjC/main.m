//
//  main.m
//  Homework6ObjC
//
//  Created by mary on 21.02.2024.
//  Copyright © 2024 mary. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    NSString * appDelegateClassName;
    @autoreleasepool {
        appDelegateClassName = NSStringFromClass([AppDelegate class]);
    }
    return UIApplicationMain(argc, argv, nil, appDelegateClassName);
}

        
//        [robot start:^NSString *{
//            return @"up";
//        }];
//
//        [robot start:^NSString *{
//            return @"left";
//        }];
//
//        [robot start:^NSString *{
//            return @"down";
//        }];
//
//        [robot start:^NSString *{
//            return @"right";
//        }];
