//
//  NEGScoreCardLessonsLearnedViewController.m
//  Negotiation3
//
//  Created by chermann on 10/5/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGScoreCardLessonsLearnedViewController.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"

@interface NEGScoreCardLessonsLearnedViewController ()

@end

@implementation NEGScoreCardLessonsLearnedViewController

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

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        
        NSString * val1 = (NSString *)[self.detailItem valueForKey:@"name"];
        NSDate *ts = [self.detailItem valueForKey:@"timeStamp"];
        NSString * val3 = (NSString *)[self.detailItem valueForKey:@"question9"];
        NSString * val4 = (NSString *)[self.detailItem valueForKey:@"question10"];
        NSString * val5 = (NSString *)[self.detailItem valueForKey:@"question11"];
        NSString * val6 = (NSString *)[self.detailItem valueForKey:@"question12"];

        NSDateFormatter *format = [[NSDateFormatter alloc] init];
        [format setDateFormat:@"M/d/yy"];
        NSString *val2 = [format stringFromDate:ts];
        
        NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"scorecard-lessons2" ofType:@"html" ]];
        NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
        NSString *finalString = [NSString stringWithFormat:htmlString,
                                 val1,
                                 val2,
                                 val3,
                                 val4,
                                 val5,
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
    [tracker set:kGAIScreenName value:@"Scorecard Lessons Learned View"];
    
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
