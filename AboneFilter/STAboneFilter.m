//
//  STAboneFilter.m
//  AboneFilter
//
//  Created by s-take on Sun Mar 04 2007.
//  Copyright (c) 2007 s-take. All rights reserved.
//

#import "STAboneFilter.h"


@implementation STAboneFilter

- (id)init
{
	self = [super init];
	if(self) {
		[NSBundle loadNibNamed:@"STAboneFilter" owner:self];
		return self;
	}
	return nil;
}

#pragma mark T2PluginInterface_v100
+ (NSArray *)pluginInstances
{
	return [NSArray arrayWithObject:[[[self alloc] init] autorelease]];
}


- (NSString *)uniqueName
{
	return @"jp_s-take_AboneFilter";
}

- (NSString *)localizedName
{
	return STLocalizedString(@"localizedName");
}

- (NSString *)localizedPluginInfo
{
	return STLocalizedString(@"localizedPluginInfo");
}

- (T2PluginType)pluginType
{
	return T2StandardPlugin;
}

- (int)pluginOrder
{
	return T2PluginOrderMiddle;
}

- (NSArray *)preferenceItems
{
	return [NSArray arrayWithObjects:[T2PreferenceItem customViewItemWithView:preferenceView], nil];
}

#pragma mark T2ThreadHTMLProcessing_v100
- (NSString *)processedHTML:(NSString *)htmlString ofRes:(T2Res *)res inThread:(T2Thread *)thread
{
	// 最初のレス。連鎖あぼーん用のインデックスセット。
	if(!resIndexesToAbone) {
		resIndexesToAbone = [[NSMutableIndexSet alloc] init];
	}
	
	BOOL filtered = NO;
	NSEnumerator *enumerator = [[keyController arrangedObjects] objectEnumerator];
	STFilterKey *aFilterKey;
	while((aFilterKey = [enumerator nextObject]) && !filtered) {
		filtered = [aFilterKey resConformsTo:res];
		
		// レスがフィルタ対象な場合：
		if(filtered) {
			// あぼーん
			[self aboneRes:res];
			
			// 連鎖あぼーんが有効な場合：
			if([aFilterKey filtersChainly]) {
				// 連鎖あぼーん対象レス留置場に追加。
				[resIndexesToAbone addIndexes:[res forwardResIndexes]];
			}
		}
		
		// レスがフィルタ対象ではない場合："abonedByAboneFilter"クラスがあればそれは以前あぼーんフィルタによって
		// あぼーんされたものだから、追加した２つのクラスを取り除く。
		else {
			if([[res HTMLClasses] containsString:@"abonedByAboneFilter"]) {
				[res removeHTMLClass:@"spam"];
				[res removeHTMLClass:@"abonedByAboneFilter"];
			}
		}
		
		// 連鎖あぼーん対象？
		if([resIndexesToAbone containsIndex:[res resNumber] - 1]) {
			[self aboneRes:res];
			// 連鎖あぼーん対象レスにレスしてるレスを連鎖あぼーん対象レス留置場に追加。
			[resIndexesToAbone addIndexes:[res forwardResIndexes]];
		}
	}
	
	// 最後のレスのとき
	if([res resNumber] == [thread resCount]) {
		[resIndexesToAbone release];
		resIndexesToAbone = nil;
	}
	
	return htmlString;
}

- (id)valueForUndefinedKey:(NSString *)aKey
{
	return STLocalizedString(aKey);
}

#pragma mark <T2DictionaryConverting>
- (NSArray *)dictionaryConvertingKeysForUse:(T2DictionaryConvertingUse)use
{
	// keys : フィルタするためのキー。
	return [NSArray arrayWithObject:@"keys"];
}

#pragma mark アクセサ

// T2DictionaryConverting用。
- (NSArray *)keys
{
	return [keyController content];
}

- (void)setKeys:(NSArray *)keys
{
	[keyController setContent:keys];
}

#pragma mark -
// レスをあぼーん。
- (void)aboneRes:(T2Res *)res
{
	// ２つのクラス（"spam"と"abonedByAboneFilter"）を追加。
	// ただし、すでにあぼーんされていたら追加しない。
	if(![[res HTMLClasses] containsString:@"spam"]) {
		[res addHTMLClass:@"spam"];
		[res addHTMLClass:@"abonedByAboneFilter"];
	}
}

@end
