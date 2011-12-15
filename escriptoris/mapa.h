//
//  mapa.h
//  escriptoris
//
//  Created by David Cortés on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <MapKit/MKAnnotation.h>

@interface mapa : UIViewController <MKMapViewDelegate>

- (IBAction)dismiss:(id)sender;
@property (retain, nonatomic) IBOutlet MKMapView *map;

@end
