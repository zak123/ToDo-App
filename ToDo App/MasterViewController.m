//
//  MasterViewController.m
//  ToDo App
//
//  Created by Zachary Mallicoat on 3/25/15.
//  Copyright (c) 2015 cghcapital. All rights reserved.
//

#import "MasterViewController.h"
#import "ToDo.h"
#import "ToDoTableViewCell.h"

@interface MasterViewController ()

@end

@implementation MasterViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) toDoController:(AddToDoTableViewController *)controller createdTask:(ToDo *)todo {
    
    
    [_taskList addObject:todo];
    
    [self.tableView reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _taskList = [[NSMutableArray alloc] init];
    
    ToDo *task = [[ToDo alloc] init];
    task.title = @"Take out the trash";
    task.titleDescription = @"trash day is wednesday";
    task.priority = @"Most Important";
    
    [_taskList addObject:task];
    
    task = [[ToDo alloc] init];
    
    task.title = @"Go get groceries";
    task.titleDescription = @"bread, meat, fruit, drinks";
    task.priority = @"Important";
    
    [_taskList addObject:task];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showDetail"]) {
        
        
        DetailViewController *detailVC = (DetailViewController *)segue.destinationViewController;
        
        
        // we need to get the corresponding item to touch
        // which is the tableview selected item
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        // then i have the indexPath, so i get the object in the list based on it
        ToDo *selectedToDo = _taskList[indexPath.row];
        // i'm able to set the detailVC.detailItem
        detailVC.detailItem = selectedToDo;
    } else if ([segue.identifier isEqualToString:@"addToDoSegue"]) {
        
        UINavigationController *navController = segue.destinationViewController;
        AddToDoTableViewController *addController = [navController.viewControllers firstObject];
        
        addController.delegate = self;
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
numberOfRowsInSection:(NSInteger)section
{
    return [self.taskList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ToDoTableViewCell *cell = (ToDoTableViewCell *)[tableView
                                      dequeueReusableCellWithIdentifier:@"TaskCell"];
    ToDo *task = [self.taskList objectAtIndex:indexPath.row];
    
//    [cell configureWithTask:task];
    
    cell.taskNameLabel.text = task.title;
    cell.taskDescriptionLabel.text = task.titleDescription;
    
    if (task.isCompleted) {
        
        NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:cell.taskNameLabel.text];
        [attributeString addAttribute:NSStrikethroughStyleAttributeName
                                value:@1
                                range:NSMakeRange(0, [attributeString length])];
        
        [attributeString addAttribute:NSStrikethroughColorAttributeName
                                value:[UIColor blackColor]
                                range:NSMakeRange(0, [attributeString length])];
        
        cell.taskNameLabel.attributedText = attributeString;
    } else {
        cell.taskNameLabel.textColor = [UIColor blackColor];
        cell.taskDescriptionLabel.textColor = [UIColor blackColor];
    }

    return cell;
}




-(NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    
    
    UITableViewRowAction *completeAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Completed" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        // translate from index path to task object
        ToDo *task = [self.taskList objectAtIndex:indexPath.row];
        
        
        
        
        // update the task object completed flag
        task.isCompleted = YES;
        
        
        
        
        // tell the tableview to reload.
        [self.tableView reloadData];
        
        
    }];
    
    UITableViewRowAction *unCompleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"Incomplete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        // translate from index path to task object
        ToDo *task = [self.taskList objectAtIndex:indexPath.row];
        
        
        
        
        // update the task object completed flag
        task.isCompleted = NO;
        
        
        
        
        // tell the tableview to reload.
        [self.tableView reloadData];
        
        
    }];
    
    UITableViewRowAction *deleteAction = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"Delete" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        ToDo *task = [self.taskList objectAtIndex:indexPath.row];
        [self.taskList removeObject:task];
        [self.tableView reloadData];
    }];

    ToDo *task = [self.taskList objectAtIndex:indexPath.row];
    
    if (task.isCompleted == YES) {
    return @[deleteAction, unCompleteAction];
    }
    else {
        return @[deleteAction, completeAction];
    }
}

//-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
//    return YES;
//}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (editingStyle == UITableViewCellEditingStyleDelete)
//    {
//        [self.taskList removeObjectAtIndex:indexPath.row];
//        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
//    }
}


-(void)swipeGesture:(UISwipeGestureRecognizer *)swipeGesture {
    // get the position of the gesture in my view.
    
    
    
    
    // ask the tableview which index is at that x,y positioon.
    
    // use that index to get the right object out of the taskList array.
    
    // modify that object.
    
    // reload data
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */

//- (void)playerDetailsViewControllerDidCancel:
//(PlayerDetailsViewController *)controller
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//
//- (void)playerDetailsViewControllerDidSave:
//(PlayerDetailsViewController *)controller
//{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}
//
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    if ([segue.identifier isEqualToString:@"AddPlayer"])
//    {
//        UINavigationController *navigationController =
//        segue.destinationViewController;
//        PlayerDetailsViewController
//        *playerDetailsViewController =
//        [[navigationController viewControllers]
//         objectAtIndex:0];
//        playerDetailsViewController.delegate = self;
//    }
//}
//
//- (void)playerDetailsViewController:
//(PlayerDetailsViewController *)controller
//didAddPlayer:(Player *)player
//{
//    [self.players addObject:player];
//    NSIndexPath *indexPath =
//    [NSIndexPath indexPathForRow:[self.players count] - 1
//                       inSection:0];
//    [self.tableView insertRowsAtIndexPaths:
//     [NSArray arrayWithObject:indexPath]
//                          withRowAnimation:UITableViewRowAnimationAutomatic];
//    [self dismissViewControllerAnimated:YES completion:nil];
//}



@end