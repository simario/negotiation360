//
//  NEGQuiz2ViewController.m
//  Negotiation3
//
//  Created by chermann on 3/23/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGQuiz2ViewController.h"

@interface NEGQuiz2ViewController ()

@end

@implementation NEGQuiz2ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[segue destinationViewController] setDetailItem:_detailItem];
    [[segue destinationViewController] setContext:_context];
}

- (IBAction)valueChanged:(UISlider *)sender {
    [self saveData];
    [self updateValues];
    
}



- (void)updateValues {
    int val5 = (int)[self.slider value];
    
    
    NSString *label = @"";
    
    if (val5 > 0 && val5 <20) {
        label = [NSString stringWithFormat:@"%@", @"Much Worse"];
    } else if (val5 > 19 && val5 < 40) {
        label = [NSString stringWithFormat:@"%@", @"Worse"];
    } else if (val5 > 39 && val5 < 60) {
        label = [NSString stringWithFormat:@"%@", @"Average"];
    } else if (val5 > 59 && val5 < 80) {
        label = [NSString stringWithFormat:@"%@", @"Better"];
    } else if (val5 > 79) {
        label = [NSString stringWithFormat:@"%@", @"Much Better"];
    }
    

    
    
    [self.questionValueLabel5 setText:[NSString stringWithFormat:@"%@ (%d)", label, val5]];
}


- (void)saveData {
    int val5 = (int)[self.slider value];
   
    [self.detailItem setValue:[NSNumber numberWithInt:val5] forKey:@"question5"];
    [self.detailItem setValue:@YES forKey:@"complete"];

    
    // Save the context.
    NSError *error = nil;
    if (![_context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

#pragma mark - Managing the detail item

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
    
   
    NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test2" ofType:@"html" ]];
    NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/", [[NSBundle mainBundle] bundlePath]]];
    
    [self.webView loadHTMLString:htmlString
                         baseURL:url];
    
    
    [self.slider setValue:[[self.detailItem valueForKey:@"question5"] doubleValue]];

    
    [self updateValues];
    
    
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
