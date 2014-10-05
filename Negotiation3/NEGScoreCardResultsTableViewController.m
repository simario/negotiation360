//
//  NEGScoreCardResultsTableViewController.m
//  Negotiation3
//
//  Created by chermann on 10/5/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGScoreCardResultsTableViewController.h"

@interface NEGScoreCardResultsTableViewController ()

@end

@implementation NEGScoreCardResultsTableViewController

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
    
    
    _linkTitles = [NSArray arrayWithObjects:@"What specific decision or action worked reasonably well for you in this negotiation?",
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


- (void)configureGraph:(UITableViewCell *)cell {
    id create = [self.detailItem valueForKey:@"question1"];
    id assert = [self.detailItem valueForKey:@"question2"];
    id empathy = [self.detailItem valueForKey:@"question3"];
    id claim = [self.detailItem valueForKey:@"question4"];
    
    
    NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"overview" ofType:@"html" ]];
    NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    
    NSString *js = [NSString stringWithFormat:@"%@, %@, %@, %@", create, empathy, claim, assert];
    
    
    
    htmlString = [NSString stringWithFormat:htmlString, js];
    NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/", [[NSBundle mainBundle] bundlePath]]];
    
    UIWebView *webView = (UIWebView *)[cell viewWithTag:999];
    
    [webView loadHTMLString:htmlString
                    baseURL:url];
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
    CGFloat h = 44;
    if (indexPath.item == 0) {
        h = 56;
    }
    if (indexPath.item == 1) {
        h = 224;
    }
    return h;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    NSString *title = @"My Negotiation";
    NSString *storedTitle = (NSString *)[self.detailItem valueForKey:@"name"];
    NSDate *ts = [self.detailItem valueForKey:@"timeStamp"];
    
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"M/d/yy"];
    NSString *dateString = [format stringFromDate:ts];
    
    if (indexPath.item == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"resultsTypeCell" forIndexPath:indexPath];
    } else if (indexPath.item == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"resultsGraphCell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ResultsCell" forIndexPath:indexPath];
    }
    
    switch (indexPath.item) {
        case 0:
            if (storedTitle && ![storedTitle isEqualToString:@""]) {
                title = storedTitle;
            }
            title = [NSString stringWithFormat:@"%@, %@", title, dateString];
            cell.textLabel.text = title;
            cell.detailTextLabel.text = @"placeholder";
            break;
        case 1:
            
            
            [self configureGraph:cell];
            
            break;
            
        case 2:
            cell.textLabel.text = @"Profile Comparison";
            cell.imageView.image = [UIImage imageNamed:@"one-green.png"];
            break;
            
        case 3:
            cell.textLabel.text = @"Lessons Learned";
            cell.imageView.image = [UIImage imageNamed:@"two-green.png"];
            break;
            
        case 4:
            cell.textLabel.text = @"Scorecard Summary";
            cell.imageView.image = [UIImage imageNamed:@"three-green.png"];
            break;
            
        default:
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
