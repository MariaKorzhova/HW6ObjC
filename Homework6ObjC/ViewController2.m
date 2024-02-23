//
//  ViewController2.m
//  Homework6ObjC
//
//  Created by mary on 23.02.2024.
//  Copyright © 2024 mary. All rights reserved.
//

#import "ViewController2.h"
#import "Robot.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
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
    
    [self saveRobotFile: (Robot*) robot];
    
    [self getRobotFile: (NSString*) name];
}
// Метод сохранения робота в файл
- (void) saveRobotFile: (Robot*) robot {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *url = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    
    NSURL *newFolderUrl = [url URLByAppendingPathComponent:@"robot"];
    
    NSURL *pathOfData = [newFolderUrl URLByAppendingPathComponent:[robot getName]];
    
// Текст файла
    NSData *textData = [[NSString stringWithFormat: @"x: %i \ny: %i \nname: %@", robot.getX, robot.getY, robot.getName] dataUsingEncoding:kCFStringEncodingUTF8];
    
    if ([fileManager createDirectoryAtURL:newFolderUrl withIntermediateDirectories:YES attributes:NULL error:NULL]) {
        
        if ([fileManager fileExistsAtPath:pathOfData.path]) {
            [fileManager removeItemAtPath:pathOfData.path error:NULL];
        }
        [fileManager createFileAtPath:pathOfData.path contents:textData attributes:NULL];
    }
}
// Метод получения робота из файла
- (void) getRobotFile: (NSString*) name {
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSURL *url = [fileManager URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask].firstObject;
    NSURL *folderUrl = [url URLByAppendingPathComponent:@"robot"];
    
    NSURL *pathOfData = [folderUrl URLByAppendingPathComponent:name];
    
    if ([fileManager fileExistsAtPath:pathOfData.path]) {
        NSData *data = [NSData dataWithContentsOfURL:pathOfData];
        NSString *text = [[NSString alloc] initWithData:data encoding:kCFStringEncodingUTF8];
        
// TextView
        self.textView.text = text;
    }
}

@end
