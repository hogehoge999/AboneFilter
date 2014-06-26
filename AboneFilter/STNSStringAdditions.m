//
//  STNSStringAdditions.m
//  Thread Inspector
//
//  Created by s-take on Wed Aug 30 2006.
//  Copyright (c) 2006 s-take. All rights reserved.
//

#import "STNSStringAdditions.h"


@implementation NSString(STNSStringAdditions)

- (BOOL)containsString:(NSString *)aString
{
	if(!aString) return NO;
	NSRange theRange = [self rangeOfString:aString options:NSCaseInsensitiveSearch];
	if(theRange.location != NSNotFound) {
		return YES;
	}
	return NO;
}

@end
