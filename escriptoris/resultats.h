//
//  resultats.h
//  escriptoris
//
//  Created by David Cortés on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "detall.h"
#import "resultatsDelegate.h"
#import <CoreLocation/CoreLocation.h>

@interface resultats : UIViewController <NSURLConnectionDataDelegate, UITableViewDelegate, UITableViewDataSource>
{
    IBOutlet UITableView *tableView;
    NSMutableArray *resultatsArray;
    
    detall *detallViewController;
    id <resultatsDelegate> delegate;
    NSMutableData *dataTotal;
}

- (void) ferRequestDelJson;
- (IBAction)mapa:(id)sender;

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) NSMutableArray *resultatsArray;

@property (nonatomic, retain) id <resultatsDelegate> delegate;

@end
