//
//  NEGAboutViewController.m
//  Negotiation3
//
//  Created by chermann on 3/23/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGAboutViewController.h"
#import "NEGAppDelegate.h"

@interface NEGAboutViewController ()

@end

@implementation NEGAboutViewController


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
        
        NEGType *t = [[NEGType alloc] init];
        NSMutableDictionary *resultType = [t getType:self.detailItem];
        
        NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"yourprofile" ofType:@"html" ]];
        NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
        
        NSMutableDictionary *nearest = [resultType objectForKey:@"nearest"];
        NSString *nearestLabel = [nearest objectForKey:@"label"];
        NSString *string1 = [nearest objectForKey:@"string1"];
        NSString *string2 = [nearest objectForKey:@"string2"];
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
        
        
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/", [[NSBundle mainBundle] bundlePath]]];
        
        NSString *str = [NSString stringWithFormat:htmlString, nearestLabel, string1, furthestLabel, string2, create, empathy, claim, assert, nearestLabel, nCreate, nEmpathy, nClaim, nAssert];
        
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
    self.screenName = @"Your Personal Profile";

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
