//
//  detall.m
//  escriptoris
//
//  Created by Arol Vinolas Martinez on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "detall.h"

@implementation detall

@synthesize nom;
@synthesize direccio;
@synthesize descripcio;
@synthesize navBar;
@synthesize imatge;
@synthesize espai;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

-(void) viewWillAppear:(BOOL)animated{
    
    [nom setText:[espai valueForKey:@"nom"]];
    [descripcio setText:[espai valueForKey:@"descripcio"]];
    [direccio setText:[espai valueForKey:@"direccio"]];
    
    NSURL * imageURL = [NSURL URLWithString:[espai valueForKey:@"imatge"]];
    NSData * imageData = [NSData dataWithContentsOfURL:imageURL];
    UIImage * image = [UIImage imageWithData:imageData];
    
    [imatge setImage:image];
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

@end
