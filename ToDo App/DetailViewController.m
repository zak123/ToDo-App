//
//  DetailViewController.m
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/25/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(ToDo *)newDetailItem {
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
            
        // Update the view.
        [self configureView];
    }
}

- (void)configureView {
    // Update the user interface for the detail item.
    if (self.detailItem) {
        
        self.detailDescriptionLabel.text = [self.detailItem titleDescription];
        self.title = [self.detailItem title];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.detailDescriptionLabel.text = _detailItem.titleDescription;
    // Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
