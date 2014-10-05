//
//  NEGScoreCardQuiz3TableViewController.m
//  Negotiation3
//
//  Created by chermann on 10/5/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGScoreCardQuiz3TableViewController.h"

@interface NEGScoreCardQuiz3TableViewController ()

@end

@implementation NEGScoreCardQuiz3TableViewController

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
    

    _questionTitles = [NSArray arrayWithObjects:@"What specific decision or action worked reasonably well for you in this negotiation?",
                       @"Now, name another specific decision or action—a different one—that also worked reasonably well for you.",
                       @"Name a specific decision or action that you would do differently.",
                       @"Now, name another specific decision or action—a different one—that you would do differently",
                       nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submit:(id)sender {
    [self performSegueWithIdentifier:@"score_card_quiz_3_intro" sender:self];
}


- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    if([text isEqualToString:@"\n"]) {
        UITableViewCell *cell = (UITableViewCell *)textView.superview;

        UILabel *lbl = (UILabel *)[cell viewWithTag:1];
        
        NSIndexPath *ip;
        for (int i = 0; i < [_questionTitles count]; i++) {
            if ([lbl.text isEqualToString:[_questionTitles objectAtIndex:i]]) {
                ip = [NSIndexPath indexPathForRow:(i) inSection:1];
            }
        }
        
        NSString *key = [NSString stringWithFormat:@"question%ld", (9 + ip.row), nil];
        [self.detailItem setValue:[textView text] forKey:key];
        
        // Save the context.
        NSError *error = nil;
        if (![_context save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
        [self.tableView reloadData];
        
        
        
        [textView resignFirstResponder];
        return NO;
    }
    
    return YES;
}

- (IBAction)textFieldFinished:(id)sender
{
    UITextView *textField = (UITextView *)sender;
    UITableViewCell *cell = (UITableViewCell *)textField.superview;
    UILabel *lbl = (UILabel *)[cell viewWithTag:1];
    
    NSIndexPath *ip;
    for (int i = 0; i < [_questionTitles count]; i++) {
        if ([lbl.text isEqualToString:[_questionTitles objectAtIndex:i]]) {
            ip = [NSIndexPath indexPathForRow:(i) inSection:1];
        }
    }
    
    NSString *key = [NSString stringWithFormat:@"question%ld", (9 + ip.row), nil];
    [self.detailItem setValue:[textField text] forKey:key];
    
    // Save the context.
    NSError *error = nil;
    if (![_context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    [self.tableView reloadData];
    
    [textField resignFirstResponder];
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
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {    
    return 233;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    UILabel *titleLabel;
    UITextView *textView;
  
    
    NSString *str;
    NSString *key = [NSString stringWithFormat:@"question%ld", (9 + indexPath.row), nil];
    NSString *val;
    
    cell = [tableView dequeueReusableCellWithIdentifier:@"questionTextInput" forIndexPath:indexPath];
    val = (NSString *)[self.detailItem valueForKey:key];
    str = (NSString *)[_questionTitles objectAtIndex:indexPath.row];
    titleLabel = (UILabel *)[cell viewWithTag:1];
    textView = (UITextView *)[cell viewWithTag:2];
    titleLabel.numberOfLines = 3;
    titleLabel.text = str;
    textView.text = val;
    textView.delegate = self;
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.item) {
        case 1:
            // type_of_negotiation
            //[self performSegueWithIdentifier:@"type_of_negotiation" sender:self];
            //cell = [tableView dequeueReusableCellWithIdentifier:@"typeInput" forIndexPath:indexPath];
            break;
        default:
            break;
    }
    
}

- (void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
}

@end
