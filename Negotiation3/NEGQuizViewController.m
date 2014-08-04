//
//  NEGQuizViewController.m
//  Negotiation3
//
//  Created by chermann on 2/22/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGQuizViewController.h"

#import "GAI.h"
#import "GAIFields.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"

@interface NEGQuizViewController ()
@property (strong, nonatomic) UIPopoverController *masterPopoverController;
- (void)configureView;
@end

@implementation NEGQuizViewController


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    [[segue destinationViewController] setDetailItem:_detailItem];
    [[segue destinationViewController] setContext:_context];
}

- (IBAction)question1ValueChanged:(UIStepper *)sender {
    [self saveData:sender forQuestion:@"question1"];
}

- (IBAction)question2ValueChanged:(UIStepper *)sender {
    [self saveData:sender forQuestion:@"question2"];
}

- (IBAction)question3ValueChanged:(UIStepper *)sender {
    [self saveData:sender forQuestion:@"question3"];
}


- (IBAction)question4ValueChanged:(UIStepper *)sender {
    [self saveData:sender forQuestion:@"question4"];
}

- (IBAction)nextButtonPressed:(id)sender {

    
    if (self.total == 16) {
        [self performSegueWithIdentifier:@"toQuestion5" sender:self];
    } else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                        message:@"Please distribute numbers to equal 16."
                                                       delegate:self
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
        
    }
}

- (void)updateValues {
    
    int val1 = (int)[[self.detailItem valueForKey:@"question1"] doubleValue];;
    int val2 = (int)[[self.detailItem valueForKey:@"question2"] doubleValue];;
    int val3 = (int)[[self.detailItem valueForKey:@"question3"] doubleValue];;
    int val4 = (int)[[self.detailItem valueForKey:@"question4"] doubleValue];;
    
    self.total = val1 + val2 + val3 + val4;
    
    if (self.total == 16) {
        [self.nextButton setTitle:@"Next"];
    } else if (self.total < 16) {
        int diff = 16 - self.total;
        [self.nextButton setTitle:[NSString stringWithFormat:@"+ %d", diff]];
    } else {
        int diff = self.total - 16;
        [self.nextButton setTitle:[NSString stringWithFormat:@"- %d", diff]];
    }
    
    
}


- (void)saveData:(UIStepper *)stepper forQuestion:(NSString *)question {
    int val = (int)[stepper value];
   
    [self.detailItem setValue:[NSNumber numberWithInt:val] forKey:question];

    
    // Save the context.
    NSError *error = nil;
    if (![_context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    [self.tableView reloadData];
    [self updateValues];
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    
    
    
    
    if (indexPath.item == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"quizHeader" forIndexPath:indexPath];
        UIWebView *webView = (UIWebView *)[cell viewWithTag:999];
        NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"test1" ofType:@"html" ]];
        NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
        
        NSURL *url = [NSURL fileURLWithPath:[NSString stringWithFormat:@"%@/", [[NSBundle mainBundle] bundlePath]]];
        
        [webView loadHTMLString:htmlString
                             baseURL:url];
        
        
        return cell;
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"quizCell" forIndexPath:indexPath];
    }
    

    
    NSString *questionLabel = [_questionLabels objectAtIndex:indexPath.item - 1];
    UILabel *label = (UILabel *)[cell viewWithTag:900];
    UILabel *value = (UILabel *)[cell viewWithTag:901];
    UIStepper *stepper = (UIStepper *)[cell viewWithTag:902];
    
    
    
    
    
    double questionValue = 0;
    switch (indexPath.item) {
        case 1:
            [stepper addTarget:self action:@selector(question1ValueChanged:) forControlEvents:UIControlEventValueChanged];
            questionValue = [[self.detailItem valueForKey:@"question1"] doubleValue];
            break;
        case 2:
            [stepper addTarget:self action:@selector(question2ValueChanged:) forControlEvents:UIControlEventValueChanged];
            questionValue = [[self.detailItem valueForKey:@"question2"] doubleValue];
            break;
        case 3:
            [stepper addTarget:self action:@selector(question3ValueChanged:) forControlEvents:UIControlEventValueChanged];
            questionValue = [[self.detailItem valueForKey:@"question3"] doubleValue];
            break;
        case 4:
            [stepper addTarget:self action:@selector(question4ValueChanged:) forControlEvents:UIControlEventValueChanged];
            questionValue = [[self.detailItem valueForKey:@"question4"] doubleValue];
            break;
            
        default:
            break;
    }
    
    [label setText:questionLabel];
    [value setText:[NSString stringWithFormat:@"%d", (int)questionValue]];
    [stepper setValue:questionValue];
    
    return cell;
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat h = 85;
    if (indexPath.item == 0) {
        h = 390;
    }
    return h;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

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
    
    if (self.detailItem) {
        self.detailDescriptionLabel.text = [[self.detailItem valueForKey:@"timeStamp"] description];
        
    }
    
    
    [self.stepper1 setValue:[[self.detailItem valueForKey:@"question1"] doubleValue]];
    [self.stepper2 setValue:[[self.detailItem valueForKey:@"question2"] doubleValue]];
    [self.stepper3 setValue:[[self.detailItem valueForKey:@"question3"] doubleValue]];
    [self.stepper4 setValue:[[self.detailItem valueForKey:@"question4"] doubleValue]];
    
    
    [self updateValues];
    
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // May return nil if a tracker has not already been initialized with a
    // property ID.
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker set:kGAIScreenName value:@"Test Part A"];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];

    
    _questionLabels = [NSArray arrayWithObjects:@"Recognizing and capitalizing on opportunities to create value. (1 - 7 Points)",
                       @"Asserting your interests and point of view. (1 - 7 Points)",
                       @"Understanding the motivations and feelings of other parties. (1 - 7 Points)",
                       @"Getting the maximum possible in the agreement.   (1 - 7 Points)",
                       nil];
    
    
    
	// Do any additional setup after loading the view, typically from a nib.
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Split view

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController
{
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
    [self.navigationItem setLeftBarButtonItem:barButtonItem animated:YES];
    self.masterPopoverController = popoverController;
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
    self.masterPopoverController = nil;
}

@end
