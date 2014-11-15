//
//  NEGScoreCardQuiz6TableViewController.m
//  Negotiation3
//
//  Created by chermann on 10/5/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGScoreCardQuiz6TableViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface NEGScoreCardQuiz6TableViewController ()

@end

@implementation NEGScoreCardQuiz6TableViewController

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
    
    
}


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submit:(id)sender {
    NSString *str = (NSString *)[self.detailItem valueForKey:@"question12"];
    str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([str isEqualToString:@""] || str == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Negotiation 360"
                                                        message:@"Please enter a response to the question before continuing."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
        return;
        
    }
    
    
    [self performSegueWithIdentifier:@"scorecard_results" sender:self];
}

- (void)textViewDidChange:(UITextView *)textView {
    [self.detailItem setValue:[textView text] forKey:@"question12"];
    // Save the context.
    NSError *error = nil;
    if (![_context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 233;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    UILabel *titleLabel;
    UITextView *textView;
    NSString *val;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"questionTextInput" forIndexPath:indexPath];
    val = (NSString *)[self.detailItem valueForKey:@"question12"];
    titleLabel = (UILabel *)[cell viewWithTag:1];
    textView = (UITextView *)[cell viewWithTag:2];
    titleLabel.numberOfLines = 4;
    titleLabel.text = @"Now, name another specific decision or action — a second one — that you would do differently.";
    textView.text = val;
    textView.delegate = self;
    
    [textView.layer setBackgroundColor: [[UIColor whiteColor] CGColor]];
    [textView.layer setBorderColor: [[UIColor grayColor] CGColor]];
    [textView.layer setBorderWidth: 0.5];
    [textView.layer setCornerRadius: 8.0];
    [textView.layer setMasksToBounds:YES];

    return cell;
}

// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

@end
