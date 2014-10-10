//
//  NEGScoreCardQuiz1TableViewController.m
//  Negotiation3
//
//  Created by chermann on 9/28/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGScoreCardQuiz2TableViewController.h"

@interface NEGScoreCardQuiz2TableViewController ()

@end

@implementation NEGScoreCardQuiz2TableViewController

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
    
    _questionTitles = [NSArray arrayWithObjects:@"",
                       @"Recognizing and capitalizing on opportunities to create value.",
                       @"Asserting your interests and point of view.",
                       @"Understanding the motivations and feelings of other parties.",
                       @"Getting the maximum possible in the agreement.",
                     nil];
    
    _sliderTitles = [NSArray arrayWithObjects:@"Much worse than usual",
                   @"Somewhat worse than usual",
                   @"Same as usual",
                   @"Somewhat better than usual",
                   @"Much better than usual",
                   nil];
    
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)submit:(id)sender {
    
    for (int i = 0; i < [_questionTitles count]; i++) {
        NSString *key = [NSString stringWithFormat:@"question%ld", (4 + i), nil];
        int val = [[self.detailItem valueForKey:key] intValue];
        if (val == -1) {
            NSString *message = [NSString stringWithFormat:@"You must select a reponse for the question '%@'", (NSString *)[_questionTitles objectAtIndex:i]];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Negotiation 360"
                                                            message:message
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles: nil];
            [alert show];

            return;
        }
    }
    
    [self performSegueWithIdentifier:@"score_card_quiz_3_intro" sender:self];
}

- (IBAction)questionValueChanged:(UISegmentedControl *)sender {
    
    UITableViewCell *cell = (UITableViewCell *)sender.superview;
    UILabel *lbl = (UILabel *)[cell viewWithTag:1];

    NSIndexPath *ip;
    for (int i = 0; i < [_questionTitles count]; i++) {
        if ([lbl.text isEqualToString:[_questionTitles objectAtIndex:i]]) {
            ip = [NSIndexPath indexPathForRow:(i) inSection:1];
        }
    }
    
    NSString *key = [NSString stringWithFormat:@"question%ld", (4 + ip.row), nil];
    [self.detailItem setValue:[NSNumber numberWithInt:(int)sender.selectedSegmentIndex] forKey:key];
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
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat h = 125;
    switch (indexPath.item) {
            
        case 0:
            h = 115;
            break;
        default:
            h = 125;
            break;
    }
    return h;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    UILabel *titleLabel;
    UISegmentedControl *seg;

    NSString *str;
    NSString *key = [NSString stringWithFormat:@"question%ld", (4 + indexPath.row), nil];
    int val = 0;
    
    switch (indexPath.item) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"instructions" forIndexPath:indexPath];
            break;
        default:
            cell = [tableView dequeueReusableCellWithIdentifier:@"sliderInput" forIndexPath:indexPath];
            val = [[self.detailItem valueForKey:key] intValue];
            str = (NSString *)[_questionTitles objectAtIndex:indexPath.row];
            titleLabel = (UILabel *)[cell viewWithTag:1];
            seg = (UISegmentedControl *)[cell viewWithTag:2];
            titleLabel.numberOfLines = 3;
            titleLabel.text = str;
            [seg setSelectedSegmentIndex:val];
            [seg addTarget:self action:@selector(questionValueChanged:) forControlEvents:UIControlEventValueChanged];
            
            break;
    }
    
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
