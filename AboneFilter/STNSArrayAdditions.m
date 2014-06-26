//
//  STNSArrayAdditions.m
//  AboneFilter
//
//  Created by s-take on Fri Sep 22 2006.
//  Copyright (c) 2006 s-take. All rights reserved.
//

#import "STNSArrayAdditions.h"


@implementation NSArray(STNSArrayAdditions)

- (BOOL)containsString:(NSString *)aString
{
	NSEnumerator *enumerator = [self objectEnumerator];
	id anItem;
	while(anItem = [enumerator nextObject]) {
		if([anItem isEqualToString:aString]) {
			return YES;
		}
	}
	return NO;
}

@end
