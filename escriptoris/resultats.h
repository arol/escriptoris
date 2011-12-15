//
//  resultats.h
//  escriptoris
//
//  Created by David Cortés on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "resultatsDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface resultats : UIViewController <NSURLConnectionDataDelegate>
{
    id <resultatsDelegate> delegate;
    NSMutableData *dataTotal;
}

- (void) ferRequestDelJson;
- (IBAction)mapa:(id)sender;

@property (nonatomic, retain) id <resultatsDelegate> delegate;

@end
