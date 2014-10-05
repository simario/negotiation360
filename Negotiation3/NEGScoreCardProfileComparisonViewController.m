//
//  NEGScoreCardProfileComparisonViewController.m
//  Negotiation3
//
//  Created by chermann on 10/5/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGScoreCardProfileComparisonViewController.h"

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
        NSLog(@"setting detail item");
    }
}

- (void)setContext:(id)newContext
{
    if (_context != newContext) {
        _context = newContext;
        NSLog(@"setting context");
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.detailItem) {
        
        NSString * val1 = (NSString *)[self.detailItem valueForKey:@"question1"];
        NSString * val2 = (NSString *)[self.detailItem valueForKey:@"question2"];
        NSString * val3 = (NSString *)[self.detailItem valueForKey:@"question3"];
        NSString * val4 = (NSString *)[self.detailItem valueForKey:@"question4"];
        NSString * val5 = (NSString *)[self.detailItem valueForKey:@"question5"];
        NSString * val6 = (NSString *)[self.detailItem valueForKey:@"question6"];
        NSString * val7 = (NSString *)[self.detailItem valueForKey:@"question7"];
        NSString * val8 = (NSString *)[self.detailItem valueForKey:@"question8"];
        
        NSString *typeOfNeg = (NSString *)[_typeLabels objectAtIndex:[[self.detailItem valueForKey:@"question1"]intValue]];
        NSString *reachAgreement = (NSString *)[_agreementLabels objectAtIndex:[[self.detailItem valueForKey:@"question3"]intValue]];

        
        
        NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"scorecard-profile" ofType:@"html" ]];
        NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
        NSString *finalString = [NSString stringWithFormat:htmlString,
                                 val1,
                                 val2,
                                 val3,
                                 val4,
                                 val5,
                                 val6,
                                 val7,
                                 val8];
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

@end
