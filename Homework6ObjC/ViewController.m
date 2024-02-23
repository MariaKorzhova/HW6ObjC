//
//  ViewController.m
//  Homework6ObjC
//
//  Created by mary on 21.02.2024.
//  Copyright © 2024 mary. All rights reserved.
//

#import "ViewController.h"
#import "Robot.h"

@interface ViewController ()

@end

@implementation ViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    
// Действие кнопки
    [self.button addTarget:self action:@selector(tap) forControlEvents:UIControlEventTouchUpInside];
}
// Метод нажатия кнопки
- (void) tap {
// Информация из TextField
    int x = [self.x.text intValue ];
    int y = [self.y.text intValue];
    NSString *name = self.name.text;
    
// Экземпляр робота
    Robot *robot = [[Robot alloc] initWithName:name initWithDataX: (NSInteger) x initWithDataY: (NSInteger) y];
    
    [self saveRobotUserDefaults: (Robot*) robot];
    
    [self getRobotUserDefaults: (NSString*) name];
}
// Метод сохранения робота в UserDefaults
- (void) saveRobotUserDefaults: (Robot*) robot {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:robot requiringSecureCoding:NO error:NULL];
    
    [userDefaults setObject:data forKey:[robot getName]];
}
// Метод получения робота из UserDefaults
- (void) getRobotUserDefaults: (NSString*) name {
    
    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    
    NSData *data = [userDefaults objectForKey:name];
    
    Robot *robot = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    
// TextView
    self.textView.text = [NSString stringWithFormat: @"x: %i \ny: %i \nname: %@", robot.getX, robot.getY, robot.getName];
}

@end
