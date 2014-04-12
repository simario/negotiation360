//
//  NEGMasterViewController.h
//  Negotiation3
//
//  Created by chermann on 2/22/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NEGDetailViewController;

#import <CoreData/CoreData.h>
#import "NEGWalkthroughViewController.h"

@interface NEGMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate,UIPageViewControllerDataSource>

@property (strong, nonatomic) NEGDetailViewController *detailViewController;
@property (strong, nonatomic) UIPageViewController *wtPageController;
@property (weak, nonatomic) IBOutlet NEGWalkthroughViewController *wtViewController;


@property (strong, nonatomic) NSArray *pageTitles;
@property (strong, nonatomic) NSArray *pageSubTexts;
@property (strong, nonatomic) NSArray *pageImages;



@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property bool fromNew;

- (IBAction)startWalkthrough:(id)sender;

@end
