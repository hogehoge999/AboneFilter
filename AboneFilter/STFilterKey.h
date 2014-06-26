//
//  STFilterKey.h
//  AboneFilter
//
//  Created by s-take on Sun Mar 04 2007.
//  Copyright (c) 2007 s-take. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Thousand2ch/Thousand2ch.h>
#import "STAdditions.h"


@interface STFilterKey : NSObject <NSCoding>
{
	NSString *keyString;
	BOOL enabled;
	
	// 連鎖あぼーんするか
	BOOL filtersChainly;
	// フィルタ範囲フラグ
	BOOL checksName;
	BOOL checksMail;
	BOOL checksIdentifier;
	BOOL checksContent;
}

#pragma mark アクセサ
- (NSString *)keyString;
- (void)setKeyString:(NSString *)string;

- (BOOL)enabled;
- (void)setEnabled:(BOOL)flag;

- (BOOL)filtersChainly;
- (void)setFiltersChainly:(BOOL)flag;

- (BOOL)checksName;
- (void)setChecksName:(BOOL)flag;
- (BOOL)checksMail;
- (void)setChecksMail:(BOOL)flag;
- (BOOL)checksIdentifier;
- (void)setChecksIdentifier:(BOOL)flag;
- (BOOL)checksContent;
- (void)setChecksContent:(BOOL)flag;

#pragma mark -
// レスがフィルタ対象かどうか。
- (BOOL)resConformsTo:(T2Res *)res;

#pragma mark <NSCoding>
- (void)encodeWithCoder:(NSCoder *)encoder;
- (id)initWithCoder:(NSCoder *)decoder;

@end
