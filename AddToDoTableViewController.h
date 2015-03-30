//
//  AddToDoTableViewController.h
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/25/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"
#import "DataHolder.h"


@class DetailViewController;

@class AddToDoTableViewController;

@protocol AddToDoViewControllerDelegate <NSObject>

-(void)toDoController:(AddToDoTableViewController *)controller createdTask:(ToDo *)todo;

@end



@interface AddToDoTableViewController : UITableViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *titleInput;
@property (strong, nonatomic) IBOutlet UITextField *descriptionInput;
@property (strong, nonatomic) IBOutlet UITextField *priorityInput;


@property (weak, nonatomic) id<AddToDoViewControllerDelegate> delegate;


@property (strong, nonatomic) IBOutlet UIBarButtonItem *cancel;
@property (strong, nonatomic) IBOutlet UIBarButtonItem *done;




@end
