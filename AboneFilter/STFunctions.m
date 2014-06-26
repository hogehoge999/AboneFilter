//
//  STFunctions.m
//  AboneFilter
//
//  Created by s-take on Sun Mar 04 2007.
//  Copyright (c) 2007 s-take. All rights reserved.
//

#import "STFunctions.h"


@class STAboneFilter;

inline NSString * STLocalizedString(NSString *key)
{
	return [[NSBundle bundleForClass:[STAboneFilter class]] localizedStringForKey:key
																			value:key
																			table:@"Localizable"];
}