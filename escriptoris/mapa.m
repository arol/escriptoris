//
//  mapa.m
//  escriptoris
//
//  Created by David Cortés on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "mapa.h"
#import "AppDelegate.h"

@interface AddressAnnotation : NSObject<MKAnnotation> {
    CLLocationCoordinate2D coordinate;
    NSString *titol;
    NSString *subtitol;
}

@property (assign,readwrite) NSString *titol;
@property (assign,readwrite) NSString *subtitol;

@end

@implementation AddressAnnotation

@synthesize coordinate;
@synthesize titol;
@synthesize subtitol;

- (NSString *)title{
    return titol;
}

- (NSString *)subtitle{
    return subtitol;
}

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
    coordinate=c;
    NSLog(@"%f,%f",c.latitude,c.longitude);
    return self;
}
@end

@implementation mapa
@synthesize map;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {


    }
    return self;
}
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
    if (annotation == mapView.userLocation)
    {
        return nil;
    }
    else{
        MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
        annView.pinColor = MKPinAnnotationColorGreen;
        annView.animatesDrop=TRUE;
        annView.canShowCallout = YES;
        annView.calloutOffset = CGPointMake(-5, 5);
        NSLog(@"view for annotation");
        return annView;
    }
}
- (IBAction)dismiss:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
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
    NSMutableArray *resultatsArray = [[AppDelegate instance] resultatsArray];
    
    NSLog(@"%@",resultatsArray);
    
    CLLocation *localitzacio = [[AppDelegate instance] localitzacioUsuari];
    
    for (id annotation in map.annotations) {
        [map removeAnnotation: annotation];
    }
    
    for (NSArray *objecte in resultatsArray) {
        
        CLLocationCoordinate2D coord;
        coord.latitude = [[objecte valueForKey:@"lat"] doubleValue];
        coord.longitude = [[objecte valueForKey:@"lang"] doubleValue];
   
        AddressAnnotation *annotation = [[AddressAnnotation alloc]initWithCoordinate:coord];

        CLLocation *locationPunt = [[CLLocation alloc]initWithLatitude:coord.latitude longitude:coord.longitude];
        int distancia = (int)[localitzacio distanceFromLocation:locationPunt];
        NSLog(@"%i",distancia);
        
        annotation.titol = [objecte valueForKey:@"nom"];
        
        annotation.subtitol = [objecte valueForKey:@"direccio"];
        
        NSLog(@"%@",annotation.subtitol);        
        
        [map addAnnotation:annotation];
        
    }
    CLLocationCoordinate2D centre;
    
    centre.longitude = 0;     
    
    MKCoordinateRegion region;
    
    MKCoordinateSpan span;
    span.latitudeDelta=0.05;
    span.longitudeDelta=0.05;

    region.center=  localitzacio.coordinate;
    region.span = span;

    [map setRegion:region animated:TRUE];
    [map regionThatFits:region];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setMap:nil];
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
    [map release];
    [super dealloc];
}
@end
