//
//  NEGBestPracticesSummaryTableViewController.m
//  Negotiation3
//
//  Created by chermann on 10/27/14.
//  Copyright (c) 2014 Negotiation 3.0. All rights reserved.
//

#import "NEGBestPracticesSummaryTableViewController.h"

#import "NEGAppDelegate.h"

#import "GAITracker.h"
#import "GAI.h"
#import "GAIDictionaryBuilder.h"


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@interface NEGBestPracticesSummaryTableViewController ()

@end

@implementation NEGBestPracticesSummaryTableViewController

- (IBAction)compose:(UIBarButtonItem *)sender {
    if ([MFMailComposeViewController canSendMail])
    {
        
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
        

        
        
        NSString *emailBody = [NSString stringWithFormat:@"%@%@%@%@%@%@", @"", @"", @"", @"", @"", @""];
        [mailer setMessageBody:emailBody isHTML:NO];
        
        [self presentViewController:mailer animated:YES completion:nil];
        
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Failure"
                                                        message:@"Your device doesn't support the sending of mail"
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
    
}

- (void)configureGraph:(UITableViewCell *)cell {
    
    NEGAppDelegate *appDelegate = (NEGAppDelegate *)[[UIApplication sharedApplication] delegate];
    self.managedObjectContext = appDelegate.managedObjectContext;
    
    id <NSFetchedResultsSectionInfo> sectionInfo = [self.fetchedResultsController sections][0];
    int len = (int)[sectionInfo numberOfObjects];
    int yesCount = 0;
    int noCount = 0;
    int notYetCount = 0;
    for (int i = 0; i < len; i++) {
        
        id detailItem = [self.fetchedResultsController objectAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        
        int val = [[detailItem valueForKey:@"question3"] intValue];
        
        switch (val) {
            case 0:
                yesCount++;
                break;
            case 1:
                noCount++;
                break;
            case 2:
                notYetCount++;
                break;
                
            default:
                break;
        }
    }
    
    NSString *htmlFile = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"practices-summary" ofType:@"html" ]];
    NSString *htmlString = [NSString stringWithContentsOfFile:htmlFile encoding:NSUTF8StringEncoding error:nil];
    
    
    
    
    
    htmlString = [NSString stringWithFormat:htmlString, (long)yesCount, (long)noCount, (long)notYetCount];
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
    return 7;
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
            cell.textLabel.text = @"My Best Practices";
            cell.detailTextLabel.text = @"Consult before your next negotiation";
            break;
        case 1:
            
            
            [self configureGraph:cell];
            
            break;
            
        case 2:
            cell.textLabel.text = @"What Worked Well?";
            //cell.imageView.image = [UIImage imageNamed:@"purple-one.png"];
            break;
            
        case 3:
            cell.textLabel.text = @"What Would I Do Differently?";
            //cell.imageView.image = [UIImage imageNamed:@"purple-two.png"];
            break;
            
        case 4:
            cell.textLabel.text = @"Negotiation Performance";
            //cell.imageView.image = [UIImage imageNamed:@"purple-three.png"];
            break;
            
        case 5:
            cell.textLabel.text = @"Negotiation Notes";
            //cell.imageView.image = [UIImage imageNamed:@"purple-four.png"];
            break;
        case 6:
            cell.textLabel.text = @"Skill-Building Tips";
            //cell.imageView.image = [UIImage imageNamed:@"purple-five.png"];
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
            [self performSegueWithIdentifier:@"best_practices_www" sender:self];
            break;
        case 3:
            [self performSegueWithIdentifier:@"best_practices_wwid" sender:self];
            break;
        case 4:
            [self performSegueWithIdentifier:@"best_practices_performance" sender:self];
            break;
        case 5:
            [self performSegueWithIdentifier:@"best_practices_notes" sender:self];
            break;
        case 6:
            [self performSegueWithIdentifier:@"best_practices_skills" sender:self];
            break;
            
        default:
            break;
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
    

}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    // Edit the entity name as appropriate.
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Scorecard" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    // Set the batch size to a suitable number.
    [fetchRequest setFetchBatchSize:20];
    
    // Edit the sort key as appropriate.
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"timeStamp" ascending:NO];
    NSArray *sortDescriptors = @[sortDescriptor];
    
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    [fetchRequest setPredicate:[NSPredicate predicateWithFormat:@"complete == YES"]];
    
    // Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
//    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:@"Master"];
    
    NSFetchedResultsController *aFetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    //aFetchedResultsController.delegate = self;
    self.fetchedResultsController = aFetchedResultsController;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	    abort();
	}
    
    return _fetchedResultsController;
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
    self.screenName = @"Best Practices Main Screen";
    
    // Do any additional setup after loading the view.
    [self configureView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
