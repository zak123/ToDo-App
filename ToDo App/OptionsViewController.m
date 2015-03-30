//
//  OptionsViewController.m
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/30/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "OptionsViewController.h"

@interface OptionsViewController ()

@end

@implementation OptionsViewController

-(void)viewWillAppear:(BOOL)animated {
    DataHolder *dataHolder = [DataHolder sharedInstance];
    
    [dataHolder loadData];
    
    _defaultTitleInput.text = [NSString stringWithFormat:@"%@", dataHolder.defaultTitle];
    
    _defaultDescriptionText.text = [NSString stringWithFormat:@"%@", dataHolder.defaultDescription];
    
    _defaultPriorityInput.text = [NSString stringWithFormat:@"%@", dataHolder.defaultPriority];
    
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if ([textField isEqual:self.defaultTitleInput]) {
        
        NSLog(@"%@", textField.text);
        [DataHolder sharedInstance].defaultTitle = _defaultTitleInput.text;
    }
    else if ([textField isEqual:self.defaultDescriptionText]) {
        
        NSLog(@"%@", textField.text);
        [DataHolder sharedInstance].defaultDescription = _defaultDescriptionText.text;

    }
    else if ([textField isEqual:self.defaultPriorityInput]) {
        
        NSLog(@"%@", textField.text);
        [DataHolder sharedInstance].defaultPriority = _defaultPriorityInput.text;
        

    }
    
    [self justSave];
    
    return YES;
    
}

- (IBAction)titleChanged:(id)sender {
    
    [DataHolder sharedInstance].defaultTitle = _defaultTitleInput.text;
    [self justSave];
}

- (IBAction)descriptionChanged:(id)sender {
        [DataHolder sharedInstance].defaultDescription = _defaultDescriptionText.text;
    [self justSave];
}
- (IBAction)priorityChanged:(id)sender {
        [DataHolder sharedInstance].defaultPriority = _defaultPriorityInput.text;
    [self justSave];
}
- (IBAction)cancelPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)donePressed:(id)sender {
    [self justSave];
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(void) justSave {
    
    
    [[DataHolder sharedInstance] saveData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
