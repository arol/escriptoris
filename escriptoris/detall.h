//
//  detall.h
//  escriptoris
//
//  Created by Arol Vinolas Martinez on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detall : UIViewController{
    IBOutlet UILabel *descripcio;
    IBOutlet UILabel *direccio;
    IBOutlet UILabel *nom;
    IBOutlet UILabel *tags;
    
    IBOutlet UIImageView *imatge;
    
    IBOutlet UINavigationBar *navBar;
    
    NSArray *espai;
}

@property (nonatomic, retain) IBOutlet UILabel *descripcio;
@property (nonatomic, retain) IBOutlet UILabel *direccio;
@property (nonatomic, retain) IBOutlet UILabel *nom;
@property (nonatomic, retain) IBOutlet UILabel *tags;
@property (nonatomic, retain) IBOutlet UIImageView *imatge;
@property (nonatomic, retain) IBOutlet UINavigationBar *navBar;
@property (nonatomic, retain) NSArray *espai;

@end
