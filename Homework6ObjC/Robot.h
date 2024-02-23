//
//  Robot.h
//  Homework6ObjC
//
//  Created by mary on 21.02.2024.
//  Copyright © 2024 mary. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Robot : NSObject<NSCoding>

@property (nonatomic) NSInteger x;
@property (nonatomic) NSInteger y;
@property (nonatomic) NSString *name;

- (instancetype) initWithName: (NSString*) name initWithDataX: (NSInteger) x initWithDataY: (NSInteger) y;
- (NSInteger) getX;
- (NSInteger) getY;
- (NSString*) getName;

@end

NS_ASSUME_NONNULL_END
