//
//  AppDelegate.h
//  escriptoris
//
//  Created by David Cortés on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "resultatsDelegate.h"
#import "resultats.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate,resultatsDelegate,CLLocationManagerDelegate>
{
    UITabBarController  *tabBarController;
    UINavigationController *navController;
    NSMutableArray *resultatsArray;
    resultats *resultatsView;
    CLLocation *localitzacioUsuari;
}

+ (AppDelegate *) instance;
- (void) obrirResultatsCerca;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) NSMutableArray  *resultatsArray;
@property (strong,nonatomic) CLLocation *localitzacioUsuari;

@end
