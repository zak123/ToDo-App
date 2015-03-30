//
//  DataHolder.m
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/30/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//


#import "DataHolder.h"

NSString * const kDefaultTitle = @"kTitle1";
NSString * const kDefaultDescription = @"kDescription1";
NSString * const kDefaultPriority = @"kPriority1";

@implementation DataHolder

- (id) init
{
    self = [super init];
    if (self)
    {
        _defaultTitle = nil;
        _defaultDescription = nil;
        _defaultPriority = nil;
    }
    return self;
}

+ (DataHolder *)sharedInstance
{
    static DataHolder *_sharedInstance = nil;
    static dispatch_once_t onceSecurePredicate;
    dispatch_once(&onceSecurePredicate,^
                  {
                      _sharedInstance = [[self alloc] init];
                      
                      NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                      
                      [defaults registerDefaults:@{ kDefaultTitle : @"Default Title", kDefaultDescription : @"Default Description", kDefaultPriority : @"Default Priority" }];
                      
                      [defaults synchronize];
                      
                      [_sharedInstance loadData];
                  });
    
    return _sharedInstance;
}

//in this example you are saving data to NSUserDefault's
//you could save it also to a file or to some more complex
//data structure: depends on what you need, really

-(void)saveData
{
//
    
    [[NSUserDefaults standardUserDefaults]
     setObject:self.defaultTitle forKey:kDefaultTitle];
    NSLog(@"%@", self.defaultTitle);

    [[NSUserDefaults standardUserDefaults]
     setObject:self.defaultDescription forKey:kDefaultDescription];
    NSLog(@"%@", self.defaultDescription);
    
    [[NSUserDefaults standardUserDefaults]
     setObject:self.defaultPriority forKey:kDefaultPriority];
    NSLog(@"%@", self.defaultPriority);
//
    [[NSUserDefaults standardUserDefaults] synchronize];
}

-(void)loadData
{
    
    self.defaultTitle = [[NSUserDefaults standardUserDefaults]
                                    objectForKey:kDefaultTitle];
    
    self.defaultDescription = [[NSUserDefaults standardUserDefaults]
                                        objectForKey:kDefaultDescription];
    
    self.defaultPriority = [[NSUserDefaults standardUserDefaults]
                                     objectForKey:kDefaultPriority];
    
}

@end