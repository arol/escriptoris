//
//  historialViewController.m
//  escriptoris
//
//  Created by David Cortés on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "historialViewController.h"

@implementation historialViewController
@synthesize tableview;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSString* plistPath = [[NSBundle mainBundle] pathForResource:@"resultats" ofType:@"plist"];
        resultatsArray = [NSArray arrayWithContentsOfFile:plistPath];
        NSLog(@"%@",resultatsArray);
        [tableview reloadData];
        NSLog(@"hola hola");
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - table view delegate
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
#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [tableview reloadData];
}

- (void)viewDidUnload
{
    [self setTableview:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [tableview release];
    [super dealloc];
}
@end
