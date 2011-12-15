//
//  AppDelegate.m
//  escriptoris
//
//  Created by David Cortés on 15/12/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "cerca.h"
#import "resultats.h"

@implementation AppDelegate

@synthesize window = _window;
@synthesize tabBarController;
@synthesize resultatsArray;
@synthesize localitzacioUsuari;

+ (AppDelegate *) instance
{
    return (AppDelegate *)[[UIApplication sharedApplication] delegate];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];
    // Override point for customization after application launch.
    tabBarController = [[UITabBarController alloc] init] ;
    
    
    SecondViewController* vc2 = [[SecondViewController alloc] init];
    
    cerca* cercaView = [[cerca alloc] init];
    

    
    navController = [[UINavigationController alloc]
                                              initWithRootViewController:cercaView] ;
    
    NSArray* controllers = [NSArray arrayWithObjects:navController, vc2, nil];
    
    tabBarController.viewControllers = controllers;
    
    // Add the tab bar controller's current view as a subview of the window
//    [_window setRootViewController:tabBarController];
    self.window.rootViewController = tabBarController;
    
    [self.window makeKeyAndVisible];
    
    resultatsArray = [[NSMutableArray alloc]init];  
    
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    [locationManager startUpdatingLocation];   

    localitzacioUsuari = [[CLLocation alloc]init];
    return YES;
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"Location: %@", [newLocation description]);
    
    if (localitzacioUsuari != nil) [localitzacioUsuari release];
    localitzacioUsuari = [newLocation copy];
}
- (void) obrirResultatsCerca
{
    resultatsView = [[resultats alloc] init];
    
    resultatsView.delegate = self;
    

    
}
-(void)hemRebutLesDades
{
    
    [navController pushViewController:resultatsView animated:YES];
    
    NSLog(@"entrem un cop amb les dades: %@",resultatsArray);

}
					
- (void)applicationWillResignActive:(UIApplication *)application
{
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
     */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    /*
     Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
     */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    /*
     Called when the application is about to terminate.
     Save data if appropriate.
     See also applicationDidEnterBackground:.
     */
}

@end
