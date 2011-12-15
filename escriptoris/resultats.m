//
//  resultats.m
//  escriptoris
//
//  Created by David Cortés on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "resultats.h"
#import "mapa.h"
#import "AppDelegate.h"

@implementation resultats
@synthesize delegate;

@synthesize tableView;
@synthesize resultatsArray;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self ferRequestDelJson];      
    }
    return self;
}
- (void) ferRequestDelJson
{
    NSLog(@"dale al request");
    NSMutableURLRequest *request = [NSMutableURLRequest 
                                    requestWithURL:[NSURL URLWithString:@"http://escriptoris.herokuapp.com/espais.json"]];
    
    [[NSURLConnection alloc]initWithRequest:request delegate:self];   

}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (dataTotal == nil){
        dataTotal = [[NSMutableData alloc]initWithLength:0];
    }
    
    resultatsArray = [[AppDelegate instance] resultatsArray];
    [tableView reloadData];    
    [dataTotal appendData:data];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)theConnection
{
    NSError *error;
    NSLog(@"%@",dataTotal);
    [[AppDelegate instance] setResultatsArray:[NSJSONSerialization JSONObjectWithData:dataTotal options:0 error:&error]];

    NSLog(@"Dades rebudes: %@",[[AppDelegate instance] resultatsArray]);
    [delegate hemRebutLesDades];
}
- (IBAction)mapa:(id)sender
{
    mapa *mapaView = [[mapa alloc]init];
    [mapaView setModalTransitionStyle:UIModalTransitionStyleFlipHorizontal];
    [self presentModalViewController:mapaView animated:YES];
    
}
- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    resultatsArray = [[AppDelegate instance] resultatsArray];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - UITableViewDelegate operations
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //Cel.la per a cada espai a reservar
    NSString *CellIdentifier = @"Cell";
    NSArray *espai = [resultatsArray objectAtIndex:indexPath.row];
    
    
    UITableViewCell *cell;
    cell=[[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    
    [cell.textLabel setText:[espai valueForKey:@"nom"]];
	[cell.textLabel setShadowColor:[UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1]];
	[cell.textLabel setShadowOffset:CGSizeMake(0, 1)];
	[cell.textLabel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    
    [cell.detailTextLabel setText:[NSString stringWithFormat:@"%@", [espai valueForKey:@"lat"]]];
	[cell.detailTextLabel setTextColor:[UIColor colorWithRed:0.34 green:0.34 blue:0.34 alpha:1]];
	[cell.detailTextLabel setShadowColor:[UIColor colorWithRed:1 green:1 blue:1 alpha:1]];
	[cell.detailTextLabel setShadowOffset:CGSizeMake(0, 1)];
	[cell.detailTextLabel setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0]];
    
    [cell setAccessoryType:UITableViewCellAccessoryDetailDisclosureButton];
    
	UIImage *image = [[UIImage imageNamed:@"cellBackground.png"] retain];	
	UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
	imageView.image = image;
	imageView.opaque = YES;
	cell.backgroundView = imageView;
	
	[imageView release];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    return cell;
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    //Nombre de espais a poder reservar
    
    
    NSLog(@"Retornant %i", [resultatsArray count]);
    return [resultatsArray count];
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"Resulats";
}

- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
	return 22;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	return 90;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

-(void) tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
	if (detallViewController == nil) {
		detallViewController = [[detall alloc] initWithNibName:@"detall" bundle:nil];
//		[detallViewController setManagedObjectContext:[self managedObjectContext]];
	}
	
	NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
	[dateFormatter setDateFormat:@"dd/MM/yyyy"];
	
    [detallViewController setEspai:[resultatsArray objectAtIndex:indexPath.row]];
    
	NSLog(@"Showing historyViewController");
	//[self.navigationController pushViewController:historyView animated:YES];
//	[self.view insertSubview:detallViewController.view aboveSubview:self.view];
    
    [[[AppDelegate instance] navController] pushViewController:detallViewController animated:YES];
}

@end
