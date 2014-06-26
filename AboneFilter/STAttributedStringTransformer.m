//
//  STAttributedStringTransformer.m
//  AboneFilter
//
//  Created by s-take on Sun Mar 11 2007.
//  Copyright (c) 2007 s-take. All rights reserved.
//

#import "STAttributedStringTransformer.h"


@implementation STAttributedStringTransformer

+ (void)load
{
	[super setValueTransformer:[[[self alloc] init] autorelease] forName:@"STAttributedStringTransformer"];
}

+ (Class)transformedValueClass
{
	return [NSAttributedString class];
}

+ (BOOL)allowsReverseTransformation
{
	return YES;
}

- (id)init
{
	self = [super init];
	if(self) {
		attrs = [[NSMutableDictionary alloc] init];
		
		NSMutableParagraphStyle *style = [[[NSParagraphStyle defaultParagraphStyle] mutableCopy] autorelease];
		[style setLineBreakMode:NSLineBreakByTruncatingTail];
		[attrs setObject:style forKey:NSParagraphStyleAttributeName];
		
		return self;
	}
	return nil;
}

- (void)dealloc
{
	[attrs release];
	[super dealloc];
}

- (id)transformedValue:(id)value
{
	return [[[NSAttributedString alloc] initWithString:value attributes:attrs] autorelease];
}

- (id)reverseTransformedValue:(id)value
{
	if([value isKindOfClass:[NSString class]]) {
		return value;
	}
	return [value string]; 
}

@end
