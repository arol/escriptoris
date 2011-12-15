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
    NSMutableURLRequest *request = [NSMutableURLRequest 
                                    requestWithURL:[NSURL URLWithString:@"http://escriptoris.herokuapp.com/espais.json"]];
    
    [[NSURLConnection alloc]initWithRequest:request delegate:self];    
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSError *error;
    
    [[AppDelegate instance] setResultatsArray:[NSJSONSerialization JSONObjectWithData:data options:0 error:&error]];
    
    NSLog(@"%@",[[AppDelegate instance] resultatsArray]);
    
    for (NSArray *objecte in [[AppDelegate instance] resultatsArray]) {
        NSLog(@"%@",[objecte valueForKey:@"codipostal"]);        
    }

    
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
