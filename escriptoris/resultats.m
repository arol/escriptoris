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
