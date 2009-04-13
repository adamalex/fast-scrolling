//
//  FastScrollingAppDelegate.m
//  FastScrolling
//
//  Created by Loren Brichter on 12/9/08.
//  Copyright atebits 2008. All rights reserved.
//

#import "FastScrollingAppDelegate.h"
#import "RootViewController.h"

@implementation FastScrollingAppDelegate

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
	window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

	RootViewController *viewController = [[RootViewController alloc] init];
	navigationController = [[UINavigationController alloc] initWithRootViewController:viewController];
	[viewController release];
	
	[window addSubview:[navigationController view]];
	[window makeKeyAndVisible];
}

- (void)dealloc
{
	[navigationController release];
	[window release];
	[super dealloc];
}

@end
