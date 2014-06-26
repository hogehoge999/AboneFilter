//
//  STFilterKey.m
//  AboneFilter
//
//  Created by s-take on Sun Mar 04 2007.
//  Copyright (c) 2007 s-take. All rights reserved.
//

#import "STFilterKey.h"


@implementation STFilterKey

#pragma mark イニシャライザ

- (id)init
{
	self = [super init];
	if(self) {
		
		[self setEnabled:YES];
		[self setFiltersChainly:NO];
		[self setChecksName:YES];
		[self setChecksMail:YES];
		[self setChecksIdentifier:YES];
		[self setChecksContent:YES];
		
		[self setKeyString:@""];
		
		return self;
	}
	return nil;
}

- (void)dealloc
{
	[keyString release];
	[super dealloc];
}

#pragma mark -
#pragma mark アクセサ

- (NSString *)keyString
{
	return keyString;
}

- (void)setKeyString:(NSString *)string
{
	if(keyString != string) {
		[keyString release];
		keyString = [string retain];
	}
}

- (BOOL)enabled
{
	return enabled;
}

- (void)setEnabled:(BOOL)flag
{
	enabled = flag;
}

- (BOOL)filtersChainly
{
	return filtersChainly;
}

- (void)setFiltersChainly:(BOOL)flag
{
	filtersChainly = flag;
}

#pragma mark アクセサ：範囲指定フラグ

// 名前をフィルタ対象にするか
- (BOOL)checksName
{
	return checksName;
}

- (void)setChecksName:(BOOL)flag
{
	checksName = flag;
}

// メールをフィルタ対象にするか
- (BOOL)checksMail
{
	return checksMail;
}

- (void)setChecksMail:(BOOL)flag
{
	checksMail = flag;
}

// IDをフィルタ対象にするか
- (BOOL)checksIdentifier
{
	return checksIdentifier;
}

- (void)setChecksIdentifier:(BOOL)flag
{
	checksIdentifier = flag;
}

// 本文をフィルタ対象にするか
- (BOOL)checksContent
{
	return checksContent;
}

- (void)setChecksContent:(BOOL)flag
{
	checksContent = flag;
}


#pragma mark -

// レスがフィルタ対象かどうか。
- (BOOL)resConformsTo:(T2Res *)res
{
	if(!enabled) {
		return NO;
	}
#if 0
	if([[res name] containsString:keyString] ||
	   [[res mail] containsString:keyString] ||
	   [[res identifier] containsString:keyString] ||
	   [[res content] containsString:keyString]) {
		return YES;
	}
#endif
	
	BOOL comforms = NO;
	
	if(checksName) {
		comforms = [[res name] containsString:keyString];
	}
	if(checksMail) {
		comforms = ([[res mail] containsString:keyString] || comforms);
	}
	if(checksIdentifier) {
		comforms = ([[res identifier] containsString:keyString] || comforms);
	}
	if(checksContent) {
		comforms = ([[res content] containsString:keyString] || comforms);
	}
	
	return comforms;
}

#pragma mark <NSCoding>
- (void)encodeWithCoder:(NSCoder *)encoder
{
	[encoder encodeObject:keyString forKey:@"STFilterKeyKeyStringKey"];
	[encoder encodeBool:enabled forKey:@"STFilterKeyEnabledKey"];
	
	[encoder encodeBool:filtersChainly forKey:@"STFilterKeyFiltersChainlyKey"];
	
	[encoder encodeBool:checksName forKey:@"STFilterKeyChecksNameKey"];
	[encoder encodeBool:checksMail forKey:@"STFilterKeyChecksMailKey"];
	[encoder encodeBool:checksIdentifier forKey:@"STFilterKeyChecksIdentifierKey"];
	[encoder encodeBool:checksContent forKey:@"STFilterKeyChecksContentKey"];
}

- (id)initWithCoder:(NSCoder *)decoder
{
	self = [self init];
	if(self) {
		[self setKeyString:[decoder decodeObjectForKey:@"STFilterKeyKeyStringKey"]];
		[self setEnabled:[decoder decodeBoolForKey:@"STFilterKeyEnabledKey"]];
		
		[self setFiltersChainly:[decoder decodeBoolForKey:@"STFilterKeyFiltersChainlyKey"]];
		
		[self setChecksName:[decoder decodeBoolForKey:@"STFilterKeyChecksNameKey"]];
		[self setChecksMail:[decoder decodeBoolForKey:@"STFilterKeyChecksMailKey"]];
		[self setChecksIdentifier:[decoder decodeBoolForKey:@"STFilterKeyChecksIdentifierKey"]];
		[self setChecksContent:[decoder decodeBoolForKey:@"STFilterKeyChecksContentKey"]];
		return self;
	}
	return nil;
}

@end
