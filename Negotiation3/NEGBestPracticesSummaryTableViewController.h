//
//  NEGBestPracticesSummaryTableViewController.h
//  Negotiation3
//
//  Created by chermann on 10/27/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "GAITrackedViewController.h"
#import <CoreData/CoreData.h>

@interface NEGBestPracticesSummaryTableViewController : GAITrackedViewController <MFMailComposeViewControllerDelegate>

@property (weak, nonatomic) IBOutlet UIBarButtonItem *composeButton;

- (IBAction)compose:(UIBarButtonItem *)sender;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
