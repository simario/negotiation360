//
//  NEGBestPracticesPerformanceViewController.m
//  Negotiation3
//
//  Created by chermann on 10/27/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGBestPracticesPerformanceViewController.h"
#import "NEGAppDelegate.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"

@interface NEGBestPracticesPerformanceViewController ()

@end

@implementation NEGBestPracticesPerformanceViewController

- (void)configureView
{
    
    NEGAppDelegate *appDelegate = (NEGAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][0];
    int len = (int)[sectionInfo numberOfObjects];
    int yesCount = 0;
    int noCount = 0;
    int notYetCount = 0;
    
    int proOutsidePartiesCount = 0;
    int proColleaguesCount = 0;
    int personalCount = 0;
    int communityCount = 0;
    int familyCount = 0;
    NSString *dates = @"[";
    NSString *importance = @"[";
    NSString *satisfaction = @"[";
    NSString *names = @"[";
    
    int scorecardsUsed = 0;
    double averageCreatingValue = 0.0;
    double averageEmpathy = 0.0;
    double averageClaimingValue = 0.0;
    double averageAssert = 0.0;
    
    
    int creatingValueTotal = 0;
    int empathyTotal = 0;
    int claimingValueTotal = 0;
    int assertTotal = 0;

    
    
     
    int createMuchWorse = 0;
    int createSomewhatWorse = 0;
    int createSameUsual = 0;
    int createSomewhatBetter = 0;
    int createMuchBetter = 0;


    int assertMuchWorse = 0;
    int assertSomewhatWorse = 0;
    int assertSameUsual = 0;
    int assertSomewhatBetter = 0;
    int assertMuchBetter = 0;

    int empathyMuchWorse = 0;
    int empathySomewhatWorse = 0;
    int empathySameUsual = 0;
    int empathySomewhatBetter = 0;
    int empathyMuchBetter = 0;

    int claimMuchWorse = 0;
    int claimSomewhatWorse = 0;
    int claimSameUsual = 0;
    int claimSomewhatBetter = 0;
    int claimMuchBetter = 0;
     
    
    
    
    if (len > 5) {
        len = 5;
    }
    
    for (int i = 0; i < len; i++) {
        
        id detailItem = [self.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        NSString *comma = @"";
        if (i < len - 1) {
            comma = @",";
        }
        
        creatingValueTotal += ([[detailItem valueForKey:@"question5"] intValue] + 1);
        empathyTotal += ([[detailItem valueForKey:@"question6"] intValue] + 1);
        claimingValueTotal += ([[detailItem valueForKey:@"question7"] intValue] + 1);
        assertTotal += ([[detailItem valueForKey:@"question8"] intValue] + 1);
        
        NSDate *ts = [detailItem valueForKey:@"timeStamp"];
        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"M/d"];
        NSString *dateString = [format stringFromDate:ts];
        
        dates = [NSString stringWithFormat:@"%@ \"%@\"%@", dates, dateString, comma, nil];
        importance = [NSString stringWithFormat:@"%@ %li%@", importance, (long)[[detailItem valueForKey:@"question2"] intValue], comma, nil];
        satisfaction = [NSString stringWithFormat:@"%@ %li%@", satisfaction, (long)[[detailItem valueForKey:@"question4"] intValue], comma, nil];
        names = [NSString stringWithFormat:@"%@ '%@'%@", names, [detailItem valueForKey:@"name"], comma, nil];
        
        int val = [[detailItem valueForKey:@"question1"] intValue];
        
        switch (val) {
            case 0:
                proOutsidePartiesCount++;
                break;
            case 1:
                proColleaguesCount++;
                break;
            case 2:
                personalCount++;
                break;
            case 3:
                communityCount++;
                break;
            case 4:
                familyCount++;
                break;
                
            default:
                break;
        }
        
        
        int val2 = [[detailItem valueForKey:@"question3"] intValue];
        
        switch (val2) {
            case 0:
                yesCount++;
                break;
            case 1:
                noCount++;
                break;
            case 2:
                notYetCount++;
                break;
                
            default:
                break;
        }
        
        
        
        for (int j = 0; j < 4; j++) {
            
            
            int muchWorse = 0;
            int somewhatWorse = 0;
            int sameUsual = 0;
            int somewhatBetter = 0;
            int muchBetter = 0;
            

            NSString *key = [NSString stringWithFormat:@"question%i", (j + 5)];
            int val = [[detailItem valueForKey:key] intValue];
            switch (val) {
                case 0:
                    muchWorse = 1;
                    break;
                case 1:
                    somewhatWorse = 1;
                    break;
                case 2:
                    sameUsual = 1;
                    break;
                case 3:
                    somewhatBetter = 1;
                    break;
                case 4:
                    muchBetter = 1;
                    break;
                default:
                    break;
            }

            
            
            
            switch (j) {
                case 0:
                    createMuchWorse += muchWorse;
                    createSomewhatWorse += somewhatWorse;
                    createSameUsual += sameUsual;
                    createSomewhatBetter += somewhatBetter;
                    createMuchBetter += muchBetter;
                    break;
                case 1:
                    assertMuchWorse += muchWorse;
                    assertSomewhatWorse += somewhatWorse;
                    assertSameUsual += sameUsual;
                    assertSomewhatBetter += somewhatBetter;
                    assertMuchBetter += muchBetter;
                    break;
                case 2:
            
                    empathyMuchWorse += muchWorse;
                    empathySomewhatWorse += somewhatWorse;
                    empathySameUsual += sameUsual;
                    empathySomewhatBetter += somewhatBetter;
                    empathyMuchBetter += muchBetter;
                    
                    break;
                case 3:

                    claimMuchWorse += muchWorse;
                    claimSomewhatWorse += somewhatWorse;
                    claimSameUsual += sameUsual;
                    claimSomewhatBetter += somewhatBetter;
                    claimMuchBetter += muchBetter;
                    
                    break;
                    
                default:
                    break;
            }
        }
    }
    
    averageCreatingValue = creatingValueTotal / len;
    averageEmpathy = empathyTotal / len;
    averageClaimingValue = claimingValueTotal / len;
    averageAssert = assertTotal / len;
    
    dates = [NSString stringWithFormat:@"%@]", dates, nil];
    importance = [NSString stringWithFormat:@"%@]", importance, nil];
    satisfaction = [NSString stringWithFormat:@"%@]", satisfaction, nil];
    names = [NSString stringWithFormat:@"%@]", names, nil];
    
    NSString *numScorecardsStr = [NSString stringWithFormat:@"var numScorecards = %li;", (long)len,nil];
    NSString *yesCountStr = [NSString stringWithFormat:@"var yesCount = %li;", (long)yesCount,nil];
    NSString *noCountStr = [NSString stringWithFormat:@"var noCount = %li;", (long)noCount,nil];
    NSString *notYetCountStr = [NSString stringWithFormat:@"var notYetCount = %li;", (long)notYetCount,nil];
    NSString *proOutsidePartiesCountStr = [NSString stringWithFormat:@"var proOutsidePartiesCount = %li;", (long)proOutsidePartiesCount,nil];
    NSString *proColleaguesCountStr = [NSString stringWithFormat:@"var proColleaguesCount = %li;", (long)proColleaguesCount,nil];
    NSString *personalCountStr = [NSString stringWithFormat:@"var personalCount = %li;", (long)personalCount,nil];
    NSString *communityCountStr = [NSString stringWithFormat:@"var communityCount = %li;", (long)communityCount,nil];
    NSString *familyCountStr = [NSString stringWithFormat:@"var familyCount = %li;", (long)familyCount,nil];
    NSString *datesStr = [NSString stringWithFormat:@"var dates = %@;", dates, nil];
    NSString *importanceStr = [NSString stringWithFormat:@"var importance = %@;", importance, nil];
    NSString *satisfactionStr = [NSString stringWithFormat:@"var satisfaction = %@;", satisfaction, nil];
    NSString *namesStr = [NSString stringWithFormat:@"var names = %@;", names, nil];
    
    NSString *scorecardsUsedStr = [NSString stringWithFormat:@"var scorecardsUsed = %li;", (long)scorecardsUsed, nil];
    NSString *averageCreatingValueStr = [NSString stringWithFormat:@"var averageCreatingValue = %f;", averageCreatingValue, nil];
    NSString *averageEmpathyStr = [NSString stringWithFormat:@"var averageEmpathy = %f;", averageEmpathy, nil];
    NSString *averageClaimingValueStr = [NSString stringWithFormat:@"var averageClaimingValue = %f;", averageClaimingValue, nil];
    NSString *averageAssertStr = [NSString stringWithFormat:@"var averageAssert = %f;", averageAssert, nil];
    
    
    
    
    
    NSString *createMuchWorseStr = [NSString stringWithFormat:@"var createMuchWorse = %li;", (long)createMuchWorse, nil];;
    NSString *createSomewhatWorseStr = [NSString stringWithFormat:@"var createSomewhatWorse = %li;", (long)createSomewhatWorse, nil];;
    NSString *createSameUsualStr = [NSString stringWithFormat:@"var createSameUsual = %li;", (long)createSameUsual, nil];;
    NSString *createSomewhatBetterStr = [NSString stringWithFormat:@"var createSomewhatBetter = %li;", (long)createSomewhatBetter, nil];;
    NSString *createMuchBetterStr = [NSString stringWithFormat:@"var createMuchBetter = %li;", (long)createMuchBetter, nil];;
    
    
    NSString *assertMuchWorseStr = [NSString stringWithFormat:@"var assertMuchWorse = %li;", (long)assertMuchWorse, nil];;
    NSString *assertSomewhatWorseStr = [NSString stringWithFormat:@"var assertSomewhatWorse = %li;", (long)assertSomewhatWorse, nil];;
    NSString *assertSameUsualStr = [NSString stringWithFormat:@"var assertSameUsual = %li;", (long)assertSameUsual, nil];;
    NSString *assertSomewhatBetterStr = [NSString stringWithFormat:@"var assertSomewhatBetter = %li;", (long)assertSomewhatBetter, nil];;
    NSString *assertMuchBetterStr = [NSString stringWithFormat:@"var assertMuchBetter = %li;", (long)assertMuchBetter, nil];;
    
    NSString *empathyMuchWorseStr = [NSString stringWithFormat:@"var empathyMuchWorse = %li;", (long)empathyMuchWorse, nil];;
    NSString *empathySomewhatWorseStr = [NSString stringWithFormat:@"var empathySomewhatWorse = %li;", (long)empathySomewhatWorse, nil];;
    NSString *empathySameUsualStr = [NSString stringWithFormat:@"var empathySameUsual = %li;", (long)empathySameUsual, nil];;
    NSString *empathySomewhatBetterStr = [NSString stringWithFormat:@"var empathySomewhatBetter = %li;", (long)empathySomewhatBetter, nil];;
    NSString *empathyMuchBetterStr = [NSString stringWithFormat:@"var empathyMuchBetter = %li;", (long)empathyMuchBetter, nil];;
    
    NSString *claimMuchWorseStr = [NSString stringWithFormat:@"var claimMuchWorse = %li;", (long)claimMuchWorse, nil];;
    NSString *claimSomewhatWorseStr = [NSString stringWithFormat:@"var claimSomewhatWorse = %li;", (long)claimSomewhatWorse, nil];;
    NSString *claimSameUsualStr = [NSString stringWithFormat:@"var claimSameUsual = %li;", (long)claimSameUsual, nil];;
    NSString *claimSomewhatBetterStr = [NSString stringWithFormat:@"var claimSomewhatBetter = %li;", (long)claimSomewhatBetter, nil];;
    NSString *claimMuchBetterStr = [NSString stringWithFormat:@"var claimMuchBetter = %li;", (long)claimMuchBetter, nil];;
    
    NSString *q529str = [NSString stringWithFormat:@"\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@",
                         createMuchWorseStr,
                         createSomewhatWorseStr,
                         createSameUsualStr,
                         createSomewhatBetterStr,
                         createMuchBetterStr,
                         assertMuchWorseStr,
                         assertSomewhatWorseStr,
                         assertSameUsualStr,
                         assertSomewhatBetterStr,
                         assertMuchBetterStr,
                         empathyMuchWorseStr,
                         empathySomewhatWorseStr,
                         empathySameUsualStr,
                         empathySomewhatBetterStr,
                         empathyMuchBetterStr,
                         claimMuchWorseStr,
                         claimSomewhatWorseStr,
                         claimSameUsualStr,
                         claimSomewhatBetterStr,
                         claimMuchBetterStr
                         ];
    
    
    
    
    
    
    
    
    
    
    
    NSString *output = [NSString stringWithFormat:@"\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n%@\n",
                        numScorecardsStr,
                        yesCountStr,
                        noCountStr,
                        notYetCountStr,
                        proOutsidePartiesCountStr,
                        proColleaguesCountStr,
                        personalCountStr,
                        communityCountStr,
                        familyCountStr,
                        datesStr,
                        importanceStr,
                        satisfactionStr,
                        namesStr,
                        scorecardsUsedStr,
                        averageCreatingValueStr,
                        averageEmpathyStr,
                        averageClaimingValueStr,
                        averageAssertStr,
                        q529str,
                        nil];
    NSLog(output);

    NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"practices-performance" ofType:@"html" ]];
    NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    
    htmlString = [NSString stringWithFormat:htmlString, output];
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/", [[NSBundle mainBundle] bundlePath]]];
    
    [self.webView loadHTMLString:htmlString
                    baseURL:url];
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
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
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


- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // May return nil if a tracker has not already been initialized with a
    // property ID.
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker set:kGAIScreenName value:@"Best Practices Performance"];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
    
    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
