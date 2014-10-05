//
//  NEGQuiz3IntroViewController.m
//  Negotiation3
//
//  Created by chermann on 10/5/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGQuiz3IntroViewController.h"

@interface NEGQuiz3IntroViewController ()

@end

@implementation NEGQuiz3IntroViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[segue destinationViewController] setDetailItem:_detailItem];
    [[segue destinationViewController] setContext:_context];
}


#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }
    
    /*
     if (self.masterPopoverController != nil) {
     [self.masterPopoverController dismissPopoverAnimated:YES];
     }*/
}


- (void)setContext:(id)newContext
{
    if (_context != newContext) {
        _context = newContext;
    }
}

- (void)configureView
{
    
    
    if (self.detailItem) {
        
        NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"scorecard-lessons" ofType:@"html" ]];
        NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
        
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/", [[NSBundle mainBundle] bundlePath]]];
        
        [self.webView loadHTMLString:htmlString
                             baseURL:url];
    }
}

// score_card_quiz_2
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
