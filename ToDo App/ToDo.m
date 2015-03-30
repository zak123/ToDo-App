//
//  ToDo.m
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/25/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (instancetype)initWithCoder:(NSCoder *)decoder
{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.title = [decoder decodeObjectForKey:@"title"];
    self.titleDescription = [decoder decodeObjectForKey:@"titleDescription"];
    
    return self;
}


-(void) encodeWithCoder:(NSCoder *)encoder {
    [encoder encodeObject:self.title forKey:@"title"];
    [encoder encodeObject:self.titleDescription forKey:@"titleDescription"];
}



@end
