//
//  MasterViewController.h
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/25/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DetailViewController.h"
#import "AddToDoTableViewController.h"

@interface MasterViewController : UITableViewController <AddToDoViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) NSMutableArray *taskList;


@end

