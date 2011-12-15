//
//  AppDelegate.h
//  escriptoris
//
//  Created by David Cortés on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UITabBarController  *tabBarController;
    UINavigationController *navController;
    NSMutableArray *resultatsArray;
}

+ (AppDelegate *) instance;
- (void) obrirResultatsCerca;

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UITabBarController *tabBarController;
@property (strong, nonatomic) NSMutableArray  *resultatsArray;
@property (strong, nonatomic) UINavigationController  *navController;

@end
