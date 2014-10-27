//
//  NEGResultsOverviewViewController.m
//  Negotiation3
//
//  Created by chermann on 3/22/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGResultsOverviewViewController.h"
#import "NEGAppDelegate.h"

#import "GAITracker.h"
#import "GAI.h" 
#import "GAIDictionaryBuilder.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface NEGResultsOverviewViewController ()

@end

@implementation NEGResultsOverviewViewController

#pragma mark - Managing the detail item

- (IBAction)compose:(UIBarButtonItem *)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor], NSForegroundColorAttributeName, nil]];

        MFMailComposeViewController *mailer = [[MFMailComposeViewController alloc] init];
        
        mailer.mailComposeDelegate = self;
        
        [mailer setSubject:@"My Negotiation 360° Results"];
        
        /*
         NSArray *toRecipients = [NSArray arrayWithObjects:@"fisrtMail@example.com", @"secondMail@example.com", nil];
         [mailer setToRecipients:toRecipients];
         
         UIImage *myImage = [UIImage imageNamed:@"mobiletuts-logo.png"];
         NSData *imageData = UIImagePNGRepresentation(myImage);
         [mailer addAttachmentData:imageData mimeType:@"image/png" fileName:@"mobiletutsImage"];
         */
        
        // May return nil if a tracker has not already been initialized with a property
        // ID.
        id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
        
        [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"ui_action"     // Event category (required)
                                                              action:@"button_press"  // Event action (required)
                                                               label:@"Email Results" // Event label
                                                               value:nil] build]];    // Event value
        
        NSString *create = [NSString stringWithFormat:@"Creating Value: %@\n", [self.detailItem valueForKey:@"question1"]];
        NSString *assert = [NSString stringWithFormat:@"Assertiveness: %@\n", [self.detailItem valueForKey:@"question2"]];
        NSString *empathy = [NSString stringWithFormat:@"Empathy: %@\n", [self.detailItem valueForKey:@"question3"]];
        NSString *claim = [NSString stringWithFormat:@"Claiming Value: %@\n", [self.detailItem valueForKey:@"question4"]];
        NSString *comparedEffect = [NSString stringWithFormat:@"Compared Effectiveness: %@\n", [self.detailItem valueForKey:@"question5"]];
        
        NEGType *t = [[NEGType alloc] init];
        NSMutableDictionary *type = [t getType:self.detailItem];
        NSMutableDictionary *nearest = [type objectForKey:@"nearest"];
        
        NSString *resultType = [NSString stringWithFormat:@"My Type: %@\n", [nearest objectForKey:@"label"]];
        
        
        
        NSString *emailBody = [NSString stringWithFormat:@"%@%@%@%@%@%@", create, assert, empathy, claim, comparedEffect, resultType];
        [mailer setMessageBody:emailBody isHTML:NO];

        [self presentViewController:mailer animated:YES completion:nil];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the sending mail"
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        [alert show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    switch (result)
    {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail cancelled: you cancelled the operation and no email message was queued.");
            break;
        case MFMailComposeResultSaved:
            NSLog(@"Mail saved: you saved the email message in the drafts folder.");
            break;
        case MFMailComposeResultSent:
            NSLog(@"Mail send: the email message is queued in the outbox. It is ready to send.");
            break;
        case MFMailComposeResultFailed:
            NSLog(@"Mail failed: the email message was not saved or queued, possibly due to an error.");
            break;
        default:
            NSLog(@"Mail not sent.");
            break;
    }
    
    // Remove the mail view
    [self dismissViewControllerAnimated:YES completion:nil];
    [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0x34aadc)];
    [[UINavigationBar appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, nil]];

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

- (void)configureType:(UITableViewCell *)cell {
    NEGType *t = [[NEGType alloc] init];
    NSMutableDictionary *type = [t getType:self.detailItem];
    NSDate *ts = [self.detailItem valueForKey:@"timeStamp"];
    NSDateFormatter *format = [[NSDateFormatter alloc] init];
    [format setDateFormat:@"M/d/yy"];
    NSString *dateString = [format stringFromDate:ts];
    NSMutableDictionary *nearest = [type objectForKey:@"nearest"];

    cell.textLabel.text = [NSString stringWithFormat:@"Self Profile, %@", dateString];
    cell.detailTextLabel.text = (NSString *)[nearest objectForKey:@"label"];
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    if (indexPath.item == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"resultsTypeCell" forIndexPath:indexPath];
    } else if (indexPath.item == 1) {
        cell = [tableView dequeueReusableCellWithIdentifier:@"resultsGraphCell" forIndexPath:indexPath];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ResultsCell" forIndexPath:indexPath];
    }
    
    switch (indexPath.item) {
        case 0:
            //cell.textLabel.text = @"Type";
            [self configureType:cell];
            break;
        case 1:
            
            
            [self configureGraph:cell];
            
            break;
        
        case 2:
            cell.textLabel.text = @"Negotiation Dilemmas";
            cell.imageView.image = [UIImage imageNamed:@"one-blue.png"];
            break;
        
        case 3:
            cell.textLabel.text = @"Bargaining Styles";
            cell.imageView.image = [UIImage imageNamed:@"two-blue.png"];
            break;
        
        case 4:
            cell.textLabel.text = @"Your Personal Profile";
            cell.imageView.image = [UIImage imageNamed:@"three-blue.png"];
            break;
            
        case 5:
            cell.textLabel.text = @"Skill-Building Tips";
            cell.imageView.image = [UIImage imageNamed:@"four-blue.png"];
            break;
            
        default:
            break;
    }
    
    return cell;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.item) {
        
        case 2:
            [self performSegueWithIdentifier:@"delimas" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"profiles" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"your_profile" sender:self];
            break;
        case 5:
            [self performSegueWithIdentifier:@"skills" sender:self];
            break;
            
        default:
            break;
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
   // NSLog([segue identifier]);
    if (![[segue identifier] isEqualToString:@"back_to_main"]) {
        [[segue destinationViewController] setDetailItem:_detailItem];
        [[segue destinationViewController] setContext:_context];
    }
    
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
        NSLog(@"setting context");
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.
    /*
     if (self.detailItem) {
     
     NEGType *t = [[NEGType alloc] init];
     NSString *resultType = [t getType:self.detailItem];
     
     //[self.typeLabel setText:[NSString stringWithFormat:@"      Type %@", resultType]];
     
     
     
     }*/
    
    if (self.detailItem) {
        
        bool isComplete = [[self.detailItem valueForKey:@"complete"] boolValue];
        if (!isComplete) {
            [self.detailItem setValue:[NSNumber numberWithBool:YES] forKey:@"complete"];
            NSError *error = nil;
            if (_context) {
                if (![_context save:&error]) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
                    abort();
                }
            }
        }
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
    self.screenName = @"Feedback & Analysis";

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
