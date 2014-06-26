//
//  STActionButton.m
//  AboneFilter
//
//  Created by s-take on Fri Mar 09 2007.
//  Copyright (c) 2007 s-take. All rights reserved.
//

#import "STActionButton.h"


@implementation STActionButton

- (void)mouseDown:(NSEvent *)downEvent
{
	// Ç±ÇÍÇéQçlÇ…ÇµÇ‹ÇµÇΩÅB
	// http://blog.cocoa-study.com/?eid=292168
	
	NSEvent *menuEvent;
	NSPoint menuPoint;
	
	menuPoint = [[self superview] convertPoint:[self frame].origin toView:[[self window] contentView]];
	menuEvent = [NSEvent mouseEventWithType:[downEvent type]
								   location:menuPoint
							  modifierFlags:[downEvent modifierFlags]
								  timestamp:[downEvent timestamp]
							   windowNumber:[downEvent windowNumber]
									context:[downEvent context]
								eventNumber:[downEvent eventNumber]
								 clickCount:[downEvent clickCount]
								   pressure:[downEvent pressure]];
	[self highlight:YES];
	[NSMenu popUpContextMenu:[self menu] withEvent:menuEvent forView:self];
	[self highlight:NO];
}

@end
