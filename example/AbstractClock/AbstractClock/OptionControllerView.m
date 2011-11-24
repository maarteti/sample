//
//  OptionControllerView.m
//  AbstractClock
//
//  Created by jinwoo choi on 11. 9. 12..
//  Copyright 2011년 __MyCompanyName__. All rights reserved.
//
#import "OptionControllerView.h"
#import "AbstractClockAppDelegate.h"

@implementation OptionControllerView

@synthesize delegate;
@synthesize listOfItems;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        CGRect bounds = [[UIScreen mainScreen] bounds];
        
        UIView *view = [[UIView alloc] initWithFrame:bounds];
        view.backgroundColor = [UIColor whiteColor];
        [self setView:view];
        [view release];
        
        UINavigationBar *navigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0.0, 0.0, 320.0, 40.0)];
        [view addSubview:navigationBar];
        [navigationBar release];
        
        UINavigationItem *navigationItem = [[UINavigationItem alloc] initWithTitle:@"test"];
        [navigationBar pushNavigationItem:navigationItem animated:YES];
        [navigationItem release];
        
        UIBarButtonItem *done = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(selectDone)];
        [navigationItem setLeftBarButtonItem:done];
        [done release];
        
        listOfItems = [[NSMutableArray alloc] init];
        
        //Add items
        [listOfItems addObject:@"Bonobono #1"];
        [listOfItems addObject:@"Bonobono #2"];
        [listOfItems addObject:@"23 Hours Mode"];
        [listOfItems addObject:@"Date Information"];
        [listOfItems addObject:@"Allow Auto-Lock"];
        
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0.0, 40.0, 320.0, 440.0) style:UITableViewStyleGrouped];
        tableView.dataSource = self;
        tableView.delegate = self;
        [view addSubview:tableView];
        [tableView release];
        
        
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    
    [listOfItems release];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)selectDone
{
    [self.delegate OptionControllerViewDidFinish:self];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return 2;
        case 1:
            return 3;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
    }
    
    AbstractClockAppDelegate *appDelegate = (AbstractClockAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    
    NSIndexPath *selectedPath = [NSIndexPath indexPathForRow:appDelegate.optionMode inSection:0];
    
    NSLog(@"selectedPath.row:%d", selectedPath.row);
    
    
//    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    if( indexPath.section == 0 ){
        if( indexPath.row == 0 ){
            cell.textLabel.text = @"BonoBono #1";
        } else {
            cell.textLabel.text = @"BonoBono #2";            
        }
        
        if( [selectedPath compare:indexPath] == NSOrderedSame  ){
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
        } else {
            cell.accessoryType = UITableViewCellAccessoryNone;
        }
        
    } else {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UISwitch *sw = [[[UISwitch alloc] init] autorelease];
        switch (indexPath.row) {
            case 0:
                cell.textLabel.text = @"24 Hours Mode";
                sw.on = appDelegate.option24Mode;
                [sw addTarget:appDelegate action:@selector(change24Mode:) forControlEvents:UIControlEventValueChanged];
                cell.accessoryView = sw;
                break;
                
            case 1:
                cell.textLabel.text = @"Date Information";
                sw.on = appDelegate.optionDateInfo;
                [sw addTarget:appDelegate action:@selector(changeDateInfo:) forControlEvents:UIControlEventValueChanged];
                cell.accessoryView = sw;
                break;
                
            case 2:
                cell.textLabel.text = @"Allow Auto-Lock";
                sw.on = appDelegate.optionAutoLock;
                [sw addTarget:appDelegate action:@selector(changeAutoLock:) forControlEvents:UIControlEventValueChanged];
                cell.accessoryView = sw;
                
                break;
                
            default:
                break;
        }
                
    }
    
    // Set up the cell...
//    NSString *cellValue = [listOfItems objectAtIndex:indexPath.row];
//    [[cell textLabel] setText:cellValue];
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    switch (section) {
        case 0:
            return @"Image Type";
        case 1:
            return @"Clock Option";
    }
    return @"";
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    switch (section) {
        case 1:
            return @"Maart";
    }
    return @"";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if( indexPath.section != 0 ){
        return;
    }
    AbstractClockAppDelegate *appDelegate = (AbstractClockAppDelegate *)[[UIApplication sharedApplication] delegate];
    
    int optMode = appDelegate.optionMode;
    
    NSIndexPath *currentIndexPath = [NSIndexPath indexPathForRow:optMode inSection:0];
    
    [[tableView cellForRowAtIndexPath:currentIndexPath] setAccessoryType:UITableViewCellAccessoryNone];
    [[tableView cellForRowAtIndexPath:indexPath] setAccessoryType:UITableViewCellAccessoryCheckmark];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    appDelegate.optionMode = indexPath.row;
    
}


@end
