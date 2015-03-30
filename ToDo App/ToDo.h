//
//  ToDo.h
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/25/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject <NSCoding>

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *titleDescription;
@property (nonatomic, copy) NSString *priority;
@property (assign) BOOL isCompleted;


@end
