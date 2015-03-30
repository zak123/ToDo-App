//
//  OptionsViewController.h
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/30/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataHolder.h"

@interface OptionsViewController : UITableViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *defaultTitleInput;
@property (strong, nonatomic) IBOutlet UITextField *defaultDescriptionText;
@property (strong, nonatomic) IBOutlet UITextField *defaultPriorityInput;

@end
