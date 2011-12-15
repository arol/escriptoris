//
//  historialViewController.h
//  escriptoris
//
//  Created by David Cortés on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface historialViewController : UIViewController <UITableViewDelegate,UITableViewDataSource>
{
    NSArray *resultatsArray;
}
@property (retain, nonatomic) IBOutlet UITableView *tableview;

@end
