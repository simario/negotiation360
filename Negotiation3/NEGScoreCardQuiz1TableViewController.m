//
//  NEGScoreCardQuiz1TableViewController.m
//  Negotiation3
//
//  Created by chermann on 9/28/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGScoreCardQuiz1TableViewController.h"
#import "GAI.h"
#import "GAIFields.h"
#import "GAITracker.h"
#import "GAIDictionaryBuilder.h"

@interface NEGScoreCardQuiz1TableViewController ()

@end

@implementation NEGScoreCardQuiz1TableViewController

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
    
    // May return nil if a tracker has not already been initialized with a
    // property ID.
    id tracker = [[GAI sharedInstance] defaultTracker];
    
    // This screen name value will remain set on the tracker and sent with
    // hits until it is set to a new value or to nil.
    [tracker set:kGAIScreenName value:@"Scorecard Quiz 1"];
    
    [tracker send:[[GAIDictionaryBuilder createAppView] build]];
    
    _typeLabels = [NSArray arrayWithObjects:@"Professional, with outside parties (vendors, customers, stakeholders, etc.)",
                   @"Professional, with colleagues within your organization.",
                   @"Personal (such as buying a car or renting an apartment).",
                   @"Community (with neighborhood groups, not-for-profits, etc.)",
                   @"Family (with children, parents, partners, spouses, etc.)",
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


- (IBAction)textFieldFinished:(id)sender
{

    UITextField *tf = (UITextField *)sender;
    [self.detailItem setValue:[tf text] forKey:@"name"];
    
    // Save the context.
    NSError *error = nil;
    if (![_context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    [self.tableView reloadData];
    
    [sender resignFirstResponder];
}

- (IBAction)nameChanged:(id)sender {
    UITextField *tf = (UITextField *)sender;
    [self.detailItem setValue:[tf text] forKey:@"name"];
    
    // Save the context.
    NSError *error = nil;
    if (![_context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (IBAction)question2ValueChanged:(UISlider *)sender {

    [self.detailItem setValue:[NSNumber numberWithInt:(int)sender.value] forKey:@"question2"];
    [self updateQuestion2Label:sender];
    // Save the context.
    NSError *error = nil;
    if (![_context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (IBAction)question3ValueChanged:(UISegmentedControl *)sender {
    
    [self.detailItem setValue:[NSNumber numberWithInt:(int)sender.selectedSegmentIndex] forKey:@"question3"];
    
    // Save the context.
    NSError *error = nil;
    if (![_context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (IBAction)question4ValueChanged:(UISlider *)sender {
    
    [self.detailItem setValue:[NSNumber numberWithInt:(int)sender.value] forKey:@"question4"];
    [self updateQuestion4Label:sender];
    // Save the context.
    NSError *error = nil;
    if (![_context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}


- (void)updateQuestion2Label:(UISlider *)slider {
    int val = (int)[slider value];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:3 inSection:0]];
    if (cell) {
        UILabel *lbl = (UILabel *)[cell viewWithTag:559];
        [self updateLabel:lbl value:val];
    }
}

- (void)updateQuestion4Label:(UISlider *)slider {

    int val = (int)[slider value];
    UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:5 inSection:0]];
    if (cell) {
        UILabel *lbl = (UILabel *)[cell viewWithTag:559];
        [self updateLabel:lbl value:val];
    }
}

- (void)updateLabel:(UILabel *)lbl value:(int)val {
    NSString *label = @"";
    
    if (val > 0 && val <34) {
        label = [NSString stringWithFormat:@"%@", @"Not very"];
    } else if (val > 33 && val < 67) {
        label = [NSString stringWithFormat:@"%@", @"Somewhat"];
    } else if (val > 66 && val < 100) {
        label = [NSString stringWithFormat:@"%@", @"Very"];
    }
    
    [lbl setText:[NSString stringWithFormat:@"%@: %d", label, val]];
}

- (IBAction)submit:(id)sender {
    
    NSString *name = (NSString *)[self.detailItem valueForKey:@"name"];
    name = [name stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([name isEqualToString:@""] || name == nil) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Negotiation 360°"
                                                        message:@"You must enter a name for your negotiation scorecard."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
        return;

    }
    
    
    int typeNeg = [[self.detailItem valueForKey:@"question1"] intValue];
    if (typeNeg == -1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Negotiation 360°"
                                                        message:@"You must pick a negotiation type for your scorecard."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
        return;
        
    }
    
    int agreement = [[self.detailItem valueForKey:@"question3"] intValue];
    if (agreement == -1) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Negotiation 360°"
                                                        message:@"You must select a reponse for whether or not you reached an agreement."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles: nil];
        [alert show];
        return;
        
    }
    
    
    
    [self performSegueWithIdentifier:@"score_card_quiz_2" sender:self];
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
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat h = 85;
    switch (indexPath.item) {
            
        case 0:
            h = 85;
            break;
        case 1:
            h = 45;
            break;
        case 2:
            h = 40;
            break;
        case 3:
            h = 110;
            break;
        case 4:
            h = 85;
            break;
        case 5:
            h = 110;
            break;
        default:
            break;
    }
    return h;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    UITextField *tf;
    UISlider *slider;
    UISegmentedControl *segCtrl;
    NSString *str;
    UILabel *lbl;
    int index = 0;
    id val;
    
    switch (indexPath.item) {
            
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:@"nameInput" forIndexPath:indexPath];
            tf = (UITextField *)[cell viewWithTag:567];
            tf.text = [self.detailItem valueForKey:@"name"];
            [tf addTarget:self action:@selector(nameChanged:) forControlEvents:UIControlEventValueChanged];

            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"typeInput" forIndexPath:indexPath];
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:@"typeValue" forIndexPath:indexPath];
            index = [[self.detailItem valueForKey:@"question1"] intValue];
            if (index != -1) {;
                str = (NSString *)[_typeLabels objectAtIndex:index];
                cell.textLabel.text = str;
            }
            break;
        case 3:
            
            cell = [tableView dequeueReusableCellWithIdentifier:@"importanceInput" forIndexPath:indexPath];
            slider = (UISlider *)[cell viewWithTag:568];
            val = [self.detailItem valueForKey:@"question2"];
            //NSLog([NSString stringWithFormat:@"%@", val]);
            [slider setValue:[[self.detailItem valueForKey:@"question2"] doubleValue]];
            [slider addTarget:self action:@selector(question2ValueChanged:) forControlEvents:UIControlEventValueChanged];
            lbl = (UILabel *)[cell viewWithTag:559];
            [self updateLabel:lbl value:[[self.detailItem valueForKey:@"question2"] intValue]];
            
            break;
        case 4:
            cell = [tableView dequeueReusableCellWithIdentifier:@"agreementInput" forIndexPath:indexPath];
            segCtrl = (UISegmentedControl *)[cell viewWithTag:569];
            [segCtrl setSelectedSegmentIndex:[[self.detailItem valueForKey:@"question3"] integerValue]];
            [segCtrl addTarget:self action:@selector(question3ValueChanged:) forControlEvents:UIControlEventValueChanged];
            break;
        case 5:
            cell = [tableView dequeueReusableCellWithIdentifier:@"satisfiedInput" forIndexPath:indexPath];
            slider = (UISlider *)[cell viewWithTag:570];
            [slider setValue:[[self.detailItem valueForKey:@"question4"] doubleValue]];
            
            [slider addTarget:self action:@selector(question4ValueChanged:) forControlEvents:UIControlEventValueChanged];
            //[self updateQuestion4Label:slider];
            lbl = (UILabel *)[cell viewWithTag:559];
            [self updateLabel:lbl value:[[self.detailItem valueForKey:@"question4"] intValue]];
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

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
