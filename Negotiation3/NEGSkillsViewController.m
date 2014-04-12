//
//  NEGSkillsViewController.m
//  Negotiation3
//
//  Created by chermann on 3/23/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGSkillsViewController.h"

@interface NEGSkillsViewController ()

@end

@implementation NEGSkillsViewController

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
        
        int val = (int)[[self.detailItem valueForKey:@"question5"] doubleValue];
        
        NSString *label = @"";
        
        if (val > 0 && val <20) {
            label = [NSString stringWithFormat:@"%@", @"Much Worse"];
        } else if (val > 19 && val < 40) {
            label = [NSString stringWithFormat:@"%@", @"Worse"];
        } else if (val > 39 && val < 60) {
            label = [NSString stringWithFormat:@"%@", @"Average"];
        } else if (val > 59 && val < 80) {
            label = [NSString stringWithFormat:@"%@", @"Better"];
        } else if (val > 79) {
            label = [NSString stringWithFormat:@"%@", @"Much Better"];
        }
        
        
        NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"skills" ofType:@"html" ]];
        NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
        
        htmlString = [NSString stringWithFormat:htmlString, label];
        
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/", [[NSBundle mainBundle] bundlePath]]];
        
        [self.webView loadHTMLString:htmlString
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
