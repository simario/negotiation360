//
//  NEGScoreCardProfileComparisonViewController.m
//  Negotiation3
//
//  Created by chermann on 10/5/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGScoreCardProfileComparisonViewController.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"

@interface NEGScoreCardProfileComparisonViewController ()

@end

@implementation NEGScoreCardProfileComparisonViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[segue destinationViewController] setDetailItem:_detailItem];
    [[segue destinationViewController] setContext:_context];
}


- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
        
    }
}

- (void)setContext:(id)newContext
{
    if (_context != newContext) {
        _context = newContext;
        
    }
}

- (int)calc:(int)val question:(int)q {
    if (val == 0) {
        return q * 0.5;
    }
    if (val == 1) {
        return q * (1 - 0.25);
    }
    if (val == 2) {
        return q;
    }
    if (val == 3) {
        return (q+((8-q)*0.25));
    }
    if (val == 4) {
        return (q + ((8-q) *0.5));
    }
    return -1;
}

- (void)configureView
{
    NEGAppDelegate *appDelegate = (NEGAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][0];
        
        if ([sectionInfo numberOfObjects] == 0) {
        }
        
        NSManagedObject *object = [self.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        
        
        
        
        
        int profileQuestion1 = [[object valueForKey:@"question1"] intValue];
        int profileQuestion2 = [[object valueForKey:@"question2"] intValue];
        int profileQuestion3 = [[object valueForKey:@"question3"] intValue];
        int profileQuestion4 = [[object valueForKey:@"question4"] intValue];
        
        int scoreCardQuestion5 = [[self.detailItem valueForKey:@"question5"] intValue];
        int scoreCardQuestion6 = [[self.detailItem valueForKey:@"question6"] intValue];
        int scoreCardQuestion7 = [[self.detailItem valueForKey:@"question7"] intValue];
        int scoreCardQuestion8 = [[self.detailItem valueForKey:@"question8"] intValue];
        
        
        
        NSString * val1 = [NSString stringWithFormat:@"%i", profileQuestion1];
        NSString * val2 = [NSString stringWithFormat:@"%i", profileQuestion2];
        NSString * val3 = [NSString stringWithFormat:@"%i", profileQuestion3];
        NSString * val4 = [NSString stringWithFormat:@"%i", profileQuestion4];
        
        /*
        NSString * val5 = [NSString stringWithFormat:@"%i", (profileQuestion1 + (scoreCardQuestion5 / 7))];
        NSString * val6 = [NSString stringWithFormat:@"%i", (profileQuestion2 + (scoreCardQuestion6 / 7))];
        NSString * val7 = [NSString stringWithFormat:@"%i", (profileQuestion3 + (scoreCardQuestion7 / 7))];
        NSString * val8 = [NSString stringWithFormat:@"%i", (profileQuestion4 + (scoreCardQuestion8 / 7))];
         */
        
        
        NSString * val5 = [NSString stringWithFormat:@"%i", [self calc:scoreCardQuestion5 question:profileQuestion1]];
        NSString * val6 = [NSString stringWithFormat:@"%i", [self calc:scoreCardQuestion6 question:profileQuestion2]];
        NSString * val7 = [NSString stringWithFormat:@"%i", [self calc:scoreCardQuestion7 question:profileQuestion3]];
        NSString * val8 = [NSString stringWithFormat:@"%i", [self calc:scoreCardQuestion8 question:profileQuestion4]];
        
        NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"scorecard-profile" ofType:@"html" ]];
        NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
        NSString *finalString = [NSString stringWithFormat:htmlString,
                                 val1,
                                 val3,
                                 val4,
                                 val2,
                                 val5,
                                 val7,
                                 val8,
                                 val6];
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/", [[NSBundle mainBundle] bundlePath]]];
        
        [self.webView loadHTMLString:finalString
                             baseURL:url];
    }
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // May return nil if a tracker has not already been initialized with a
    // property ID.
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker set:kGAIScreenName value:@"Scorecard Compare"];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
    _typeLabels = [NSArray arrayWithObjects:@"Professional, with outside parties (vendors, customers, stakeholders, etc.)",
                   @"Professional, with colleagues within your organization.",
                   @"Personal (such as buying a car or renting an apartment).",
                   @"Community (with neighborhood groups, not-for-profits, etc.)",
                   @"Family (with children, parents, partners, spouses, etc.)",
                   nil];
    
    _agreementLabels = [NSArray arrayWithObjects:@"Yes",
                        @"No",
                        @"Not Yet",
                        nil];
    
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


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
    //aFetchedResultsController.delegate = self;
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


@end
