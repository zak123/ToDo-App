//
//  DetailViewController.h
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/25/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ToDo.h"

@class DetailViewController;

@protocol PlayerDetailsViewControllerDelegate <NSObject>
- (void)playerDetailsViewControllerDidCancel:
(DetailViewController *)controller;
- (void)playerDetailsViewController:
(DetailViewController *)controller
                       didAddTask:(ToDo *)task;
@end


@interface DetailViewController : UIViewController

@property (strong, nonatomic) ToDo *detailItem;
@property (strong, nonatomic) IBOutlet UILabel *detailTitleLabel;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

// Need a delegate here for picker screen to initiate new task


@end

