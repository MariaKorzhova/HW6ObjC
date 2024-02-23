//
//  Robot.m
//  Homework6ObjC
//
//  Created by mary on 21.02.2024.
//  Copyright © 2024 mary. All rights reserved.
//

#import "Robot.h"

@implementation Robot

- (instancetype) initWithName: (NSString*) name initWithDataX: (NSInteger) x initWithDataY: (NSInteger) y {
    self = [super init];
    if (self) {
        self.name = name;
        self.x = x;
        self.y = y;
    }
    return self;
}

- (NSInteger) getX {
    return self.x;
}
- (NSInteger) getY {
    return self.y;
}

- (NSString*) getName {
    return self.name;
}

- (instancetype)initWithCoder:(NSCoder *)coder {
    self = [super init];
    if (self) {
        self.x = [coder decodeIntegerForKey:@"x"];
        self.y = [coder decodeIntegerForKey:@"y"];
        self.name = [coder decodeObjectForKey:@"name"];
        
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [coder encodeInteger:self.x forKey:@"x"];
    [coder encodeInteger:self.y forKey:@"y"];
    [coder encodeObject:self.name forKey:@"name"];
}

@end
