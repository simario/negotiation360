//
//  NEGBestPracticesWWWViewController.m
//  Negotiation3
//
//  Created by chermann on 10/27/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGBestPracticesWWWViewController.h"
#import "NEGAppDelegate.h"

@interface NEGBestPracticesWWWViewController ()

@end

@implementation NEGBestPracticesWWWViewController

- (void)configureView
{
    
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
    
    NEGAppDelegate *appDelegate = (NEGAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][0];
    int len = (int)[sectionInfo numberOfObjects];
    NSString *str = @"";
    for (int i = 0; i < len; i++) {
        
        id detailItem = [self.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        
        NSString *name = (NSString *)[detailItem valueForKey:@"name"];
 

        NSDate *ts = [detailItem valueForKey:@"timeStamp"];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"M/d"];
        NSString *dateString = [format stringFromDate:ts];
        
        NSString *reachAgreement = (NSString *)[_agreementLabels objectAtIndex:[[detailItem valueForKey:@"question3"]intValue]];
        

        NSString *q9 = (NSString *)[detailItem valueForKey:@"question9"];
        NSString *q10 = (NSString *)[detailItem valueForKey:@"question10"];
        str = [NSString stringWithFormat:@"%@<section class='card'><p style='font-size: 14px; text-align: left'><strong>Negotiation Name</strong> %@<br><strong>Date</strong> %@<br><strong>Agreement Reached?</strong> %@</p>", str, name, dateString, reachAgreement, nil];
        str = [NSString stringWithFormat:@"%@<ul class='list-group'><li class='list-group-item' style='font-size: 14px; text-align: left'>&ldquo; %@ &rdquo;</li>", str, q9, nil];
        str = [NSString stringWithFormat:@"%@<li class='list-group-item' style='font-size: 14px; text-align: left'>&ldquo; %@ &rdquo;</li></ul></section>", str, q10, nil];
        
        
        
        
    }

    NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"practices-www" ofType:@"html" ]];
    NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    
    htmlString = [NSString stringWithFormat:htmlString, str];
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/", [[NSBundle mainBundle] bundlePath]]];
    
    [self.webView loadHTMLString:htmlString
                         baseURL:url];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
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
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Scorecard" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"complete == YES"]];
    
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
