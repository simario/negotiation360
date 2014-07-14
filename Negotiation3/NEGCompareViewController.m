//
//  NEGCompareViewController.m
//  Negotiation3
//
//  Created by chermann on 7/2/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGCompareViewController.h"
#import "NEGAppDelegate.h"

@interface NEGCompareViewController ()

@end

@implementation NEGCompareViewController

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
        
        /*
        NEGType *t = [[NEGType alloc] init];
        NSMutableDictionary *resultType = [t getType:self.detailItem];
        */
        NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"compare" ofType:@"html" ]];
        NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
        /*
        NSMutableDictionary *nearest = [resultType objectForKey:@"nearest"];
        NSString *nearestLabel = [nearest objectForKey:@"label"];
        NSMutableDictionary *furthest = [resultType objectForKey:@"furthest"];
        NSString *furthestLabel = [furthest objectForKey:@"label"];
        
        
        NSNumber *nCreate = [nearest objectForKey:@"create"];
        NSNumber *nAssert = [nearest objectForKey:@"assert"];
        NSNumber *nEmpathy = [nearest objectForKey:@"empathy"];
        NSNumber *nClaim = [nearest objectForKey:@"claim"];
        
        
        NSNumber *create = [resultType objectForKey:@"create"];
        NSNumber *assert = [resultType objectForKey:@"assert"];
        NSNumber *empathy = [resultType objectForKey:@"empathy"];
        NSNumber *claim = [resultType objectForKey:@"claim"];
        */
        
        NSString *val1 = [[self.detailItem valueForKey:@"question1"] stringValue];;
        NSString *val2 = [[self.detailItem valueForKey:@"question2"] stringValue];;
        NSString *val3 = [[self.detailItem valueForKey:@"question3"] stringValue];;
        NSString *val4 = [[self.detailItem valueForKey:@"question4"] stringValue];;
        
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/", [[NSBundle mainBundle] bundlePath]]];
        
        NSString *str = [NSString stringWithFormat:htmlString, val1, val2, val3, val4];
        
        [self.webView loadHTMLString:str
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
    
    // Set screen name.
    self.screenName = @"How You Compare";

    // Do any additional setup after loading the view.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
