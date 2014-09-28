//
//  NEGMasterViewController.m
//  Negotiation3
//
//  Created by chermann on 2/22/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGMasterViewController.h"

#import "NEGDetailViewController.h"

#import "GAI.h"
#import "GAIFields.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"

@interface NEGMasterViewController ()
- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath;


@end

@implementation NEGMasterViewController

- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setToolbarHidden:YES animated:NO];
    NSIndexPath *tableSelection = [self.tableView indexPathForSelectedRow];
    [self.tableView deselectRowAtIndexPath:tableSelection animated:NO];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NEGAppDelegate *appDelegate = (NEGAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
	// Do any additional setup after loading the view, typically from a nib.
    //self.navigationItem.leftBarButtonItem = self.editButtonItem;
    _negType = [[NEGType alloc] init];
    
    

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = (NEGDetailViewController *)[[self.splitViewController.viewControllers lastObject] topViewController];
    
    
    // Create the data model
    _pageTitles = @[@"Negotiation 360°", @"Self-Assessment", @"Negotiation Dilemmas", @"Negotiation Scorecard", @"Negotiation Review", @"Best Practices", @"Skill Building Tips", @""];
    _pageImages = @[@"page-1.png", @"page-2.png", @"page-3.png", @"page-4.png", @"page-5.png", @"page-6.png", @"page-7.png", @""];
    
    _pageSubTexts = @[@"Swipe left to learn more", @"Assess your general negotiation skills", @"Learn about fundamental tensions in negotiation strategy", @"Review your performance after each negotiation", @"Identify what worked well and what you would do differently", @"Prepare for negotiations by deploying you personal best practices", @"Review tips for enhancing your strategic and interpersonal skills", @""];
    
    // Create page view controller
    self.wtPageController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageViewController"];
    self.wtPageController.dataSource = self;
    
    NEGWalkthroughViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.wtPageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    

    
    //[self addChildViewController:_wtPageController];
    //[self.view addSubview:_wtPageController.view];
    
    if ([self respondsToSelector:@selector(presentViewController:animated:completion:)]){
        id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][0];
        
        if ([sectionInfo numberOfObjects] == 0) {
            [self presentViewController:self.wtPageController animated:YES completion:^(){
                UIImage *overlay = [UIImage imageNamed:@"overlayTextOnly.png"];
                self.overlayView = [[UIImageView alloc] initWithImage:overlay];
                self.overlayView.frame = CGRectMake(0, 0, 320, 568);
                [self.navigationController.view addSubview:self.overlayView];
                [self.navigationController.view bringSubviewToFront:self.overlayView];
            }];
        }
        
        
    }
    
    
    
    // May return nil if a tracker has not already been initialized with a
    // property ID.
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker set:kGAIScreenName value:@"Negotiation 360 Home Screen"];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (self.overlayView) {
        [self.overlayView removeFromSuperview];
    }
    _fromNew = YES;
    
    
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][0];
    // create new profile
    if ([sectionInfo numberOfObjects] == 0) {
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        NSEntityDescription *entity = [[self.fetchedResultsController fetchRequest] entity];
        NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
        
        // If appropriate, configure the new managed object.
        // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
        [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
        [newManagedObject setValue:[NSNumber numberWithInt:1] forKey:@"question1"];
        [newManagedObject setValue:[NSNumber numberWithInt:1] forKey:@"question2"];
        [newManagedObject setValue:[NSNumber numberWithInt:1] forKey:@"question3"];
        [newManagedObject setValue:[NSNumber numberWithInt:1] forKey:@"question4"];
        
        // Save the context.
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
        [self performSegueWithIdentifier:@"showDetail" sender:self];
    } else {
        NSManagedObjectContext *context = [self.scFetchedResultsController managedObjectContext];
        NSEntityDescription *entity = [[self.scFetchedResultsController fetchRequest] entity];
        NSManagedObject *newManagedObject = [NSEntityDescription insertNewObjectForEntityForName:[entity name] inManagedObjectContext:context];
        
        // If appropriate, configure the new managed object.
        // Normally you should use accessor methods, but using KVC here avoids the need to add a custom class to the template.
        [newManagedObject setValue:[NSDate date] forKey:@"timeStamp"];
        //[newManagedObject setValue:[NSNumber numberWithInt:1] forKey:@"question1"];
        //[newManagedObject setValue:[NSNumber numberWithInt:1] forKey:@"question2"];
        //[newManagedObject setValue:[NSNumber numberWithInt:1] forKey:@"question3"];
        //[newManagedObject setValue:[NSNumber numberWithInt:1] forKey:@"question4"];
        
        // Save the context.
        NSError *error = nil;
        if (![context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        
    }
    
    
    
    _fromNew = NO;
}

#pragma mark - Page Controller

- (IBAction)startWalkthrough:(id)sender {
    NEGWalkthroughViewController *startingViewController = [self viewControllerAtIndex:0];
    NSArray *viewControllers = @[startingViewController];
    [self.wtPageController setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
}

- (NEGWalkthroughViewController *)viewControllerAtIndex:(NSUInteger)index
{
    if (([self.pageTitles count] == 0) || (index >= [self.pageTitles count])) {
        return nil;
    }
    
    // Create a new view controller and pass suitable data.
    NEGWalkthroughViewController *pageContentViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"PageContentViewController"];
    
    
    pageContentViewController.goButtonHidden = YES;
    NSString *imagePath = [NSString stringWithString:self.pageImages[index]];
    if (![imagePath isEqualToString:@""]) {
        pageContentViewController.imageFile = self.pageImages[index];
    } else {
        pageContentViewController.goButtonHidden = NO;
    }
    
    pageContentViewController.titleText = self.pageTitles[index];
    pageContentViewController.pageIndex = index;
    pageContentViewController.subText = self.pageSubTexts[index];
    
    return pageContentViewController;
}

#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = ((NEGWalkthroughViewController*) viewController).pageIndex;
    
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    index--;
    return [self viewControllerAtIndex:index];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = ((NEGWalkthroughViewController*) viewController).pageIndex;
    
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.pageTitles count]) {
        return nil;
    }
    return [self viewControllerAtIndex:index];
}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    return [self.pageTitles count];
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    
    return [[self.fetchedResultsController sections] count] + [[self.scFetchedResultsController sections] count];
    //return 2;

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return @"Your Profile";
    } else if (section == 1) {
        return @"Your Negotiations";
    }
    return @"";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][0];
        return [sectionInfo numberOfObjects];
    } else {
        id <NSFetchedResultsSectionInfo> sectionInfo = [self.scFetchedResultsController sections][0];
        return [sectionInfo numberOfObjects];
        
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    if (indexPath.section == 0) {
        [self configureCell:cell atIndexPath:indexPath];
    } else if (indexPath.section == 1) {
        [self configureCell:cell atIndexPath:indexPath];
    }
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    
    if (indexPath.section > 0) {
        return YES;
    }
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
            [context deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
            
            NSError *error = nil;
            if (![context save:&error]) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                abort();
            }
        }
    } else if (indexPath.section == 1) {
        if (editingStyle == UITableViewCellEditingStyleDelete) {
            
            NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
            NSManagedObjectContext *context = [self.scFetchedResultsController managedObjectContext];
            [context deleteObject:[self.scFetchedResultsController objectAtIndexPath:newIndexPath]];
            
            NSError *error = nil;
            if (![context save:&error]) {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                abort();
            }
        }
    }
    
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // The table view should not be re-orderable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSManagedObject *object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
            self.detailViewController.detailItem = object;
        }
        
        bool isComplete = [[object valueForKey:@"complete"] boolValue];
        
        if (isComplete) {
            [self performSegueWithIdentifier:@"results_from_main" sender:self];
        } else {
            [self performSegueWithIdentifier:@"showDetail" sender:self];
        }
    } else if (indexPath.section == 1) {
        NSIndexPath *ip = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        NSManagedObject *object = [[self scFetchedResultsController] objectAtIndexPath:ip];
        bool isComplete = [[object valueForKey:@"complete"] boolValue];
        
        if (isComplete) {
            //[self performSegueWithIdentifier:@"results_from_main" sender:self];
        } else {
            [self performSegueWithIdentifier:@"scorecardIntro" sender:self];
        }
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"] || [[segue identifier] isEqualToString:@"results_from_main"]) {
        NSManagedObject *object;
        if (_fromNew) {
            object = [[self fetchedResultsController] objectAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
        } else {
            NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
            object = [[self fetchedResultsController] objectAtIndexPath:indexPath];
        }
        
        NSManagedObjectContext *context = [self.fetchedResultsController managedObjectContext];
        [[segue destinationViewController] setDetailItem:object];
        [[segue destinationViewController] setContext:context];
    } else if ([[segue identifier] isEqualToString:@"scorecardIntro"]) {
        NSManagedObject *object;

        NSIndexPath *indexPath =  [NSIndexPath indexPathForRow:[[self.tableView indexPathForSelectedRow] row] inSection:0];
        object = [[self scFetchedResultsController] objectAtIndexPath:indexPath];

        
        NSManagedObjectContext *context = [self.scFetchedResultsController managedObjectContext];
        [[segue destinationViewController] setDetailItem:object];
        [[segue destinationViewController] setContext:context];
    }
}



#pragma mark - Scorecard Fetched results controller





- (NSFetchedResultsController *)scFetchedResultsController
{
    if (_scFetchedResultsController != nil) {
        return _scFetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Scorecard" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.scFetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.scFetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _scFetchedResultsController;
}


#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Event" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
	     // Replace this implementation with code to handle the error appropriately.
	     // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
}    

- (void)controllerWillChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView beginUpdates];
}

- (void)controller:(NSFetchedResultsController *)controller didChangeSection:(id <NSFetchedResultsSectionInfo>)sectionInfo
           atIndex:(NSUInteger)sectionIndex forChangeType:(NSFetchedResultsChangeType)type
{
    
    switch(type) {
        case NSFetchedResultsChangeInsert:
            [self.tableView insertSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [self.tableView deleteSections:[NSIndexSet indexSetWithIndex:sectionIndex] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controller:(NSFetchedResultsController *)controller didChangeObject:(id)anObject
       atIndexPath:(NSIndexPath *)indexPath forChangeType:(NSFetchedResultsChangeType)type
      newIndexPath:(NSIndexPath *)newIndexPath
{
    UITableView *tableView = self.tableView;
    NSIndexPath *t = [NSIndexPath indexPathForRow:indexPath.row inSection:1];
    switch(type) {
        case NSFetchedResultsChangeInsert:
            
            [tableView insertRowsAtIndexPaths:@[t] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeDelete:
            [tableView deleteRowsAtIndexPaths:@[t] withRowAnimation:UITableViewRowAnimationFade];
            break;
            
        case NSFetchedResultsChangeUpdate:
            [self configureCell:[tableView cellForRowAtIndexPath:indexPath] atIndexPath:indexPath];
            break;
            
        case NSFetchedResultsChangeMove:
            [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
            [tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationFade];
            break;
    }
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView endUpdates];
}

/*
// Implementing the above methods to update the table view in response to individual changes may have performance implications if a large number of changes are made simultaneously. If this proves to be an issue, you can instead just implement controllerDidChangeContent: which notifies the delegate that all section and object changes have been processed. 
 
 - (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    // In the simplest, most efficient, case, reload the table view.
    [self.tableView reloadData];
}
 */

- (void)configureCell:(UITableViewCell *)cell atIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:indexPath];
        NSDate *ts = [object valueForKey:@"timeStamp"];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"M/d/yy"];
        NSString *dateString = [format stringFromDate:ts];
        
        
        NSString *t = [NSString stringWithFormat:@"Self Profile, %@", dateString];
        NSString *s = @"";
        
        bool isComplete = [[object valueForKey:@"complete"] boolValue];
        
        if (isComplete) {
            NSMutableDictionary *d = [_negType getType:object];
            NSMutableDictionary *n = [d objectForKey:@"nearest"];
            if (n) {
                s = [NSString stringWithFormat:@"%@", [n objectForKey:@"label"], nil];
            }
        } else {
            s = @"In Progress. Tap to Complete.";
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", t];
        cell.detailTextLabel.text = s;
    } else if(indexPath.section == 1) {
        NSIndexPath *ip = [NSIndexPath indexPathForRow:indexPath.row inSection:0];
        NSManagedObject *object = [self.scFetchedResultsController objectAtIndexPath:ip];
        NSDate *ts = [object valueForKey:@"timeStamp"];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"M/d/yy"];
        NSString *dateString = [format stringFromDate:ts];
        
        UIImageView *imv = (UIImageView *)[cell viewWithTag:1972];
        
        [imv setImage:[UIImage imageNamed:@"Compass-32.png"]];
        NSString *t = [NSString stringWithFormat:@"My Negotiation, %@", dateString];
        NSString *s = @"";
        
        bool isComplete = [[object valueForKey:@"complete"] boolValue];
        
        if (isComplete) {
            NSMutableDictionary *d = [_negType getType:object];
            NSMutableDictionary *n = [d objectForKey:@"nearest"];
            if (n) {
                s = [NSString stringWithFormat:@"%@", [n objectForKey:@"label"], nil];
            }
        } else {
            s = @"In Progress. Tap to Complete.";
        }
        
        cell.textLabel.text = [NSString stringWithFormat:@"%@", t];
        cell.detailTextLabel.text = s;
    }

}

@end
