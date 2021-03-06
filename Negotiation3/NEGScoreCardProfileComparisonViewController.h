//
//  NEGScoreCardProfileComparisonViewController.h
//  Negotiation3
//
//  Created by chermann on 10/5/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NEGAppDelegate.h"

@interface NEGScoreCardProfileComparisonViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic) id context;

@property (strong, nonatomic) NSArray *typeLabels;
@property (strong, nonatomic) NSArray *agreementLabels;

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
