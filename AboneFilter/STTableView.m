//
//  STTableView.m
//  AboneFilter
//
//  Created by s-take on Sun Mar 11 2007.
//  Copyright (c) 2007 s-take. All rights reserved.
//

#import "STTableView.h"


@implementation STTableView

- (void)awakeFromNib
{
	NSArray *columns = [self tableColumns];
	NSEnumerator *enumerator = [columns objectEnumerator];
	NSTableColumn *aColumn;
	while(aColumn = [enumerator nextObject]) {
		if([[aColumn dataCell] isKindOfClass:[NSTextFieldCell class]]) {
			Class dataCellClass = [[aColumn dataCell] class];
			id cell = [[[dataCellClass alloc] init] autorelease];
			[cell setWraps:YES];
			[aColumn setDataCell:cell];
		}
	}
}

@end
