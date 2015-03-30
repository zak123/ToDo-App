//
//  DataHolder.h
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/30/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataHolder : NSObject


+ (DataHolder *)sharedInstance;

@property (assign) NSString *defaultTitle;
@property (assign) NSString *defaultDescription;
@property (assign) NSString *defaultPriority;

-(void) saveData;
-(void) loadData;

@end


