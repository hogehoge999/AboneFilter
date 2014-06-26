//
//  STAboneFilter.h
//  AboneFilter
//
//  Created by s-take on Sun Mar 04 2007.
//  Copyright (c) 2007 s-take. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Thousand2ch/Thousand2ch.h>
#import "STFilterKey.h"
#import "STAdditions.h"
#import "STFunctions.h"


@interface STAboneFilter : NSObject <T2PluginInterface_v100, T2ThreadHTMLProcessing_v100, T2DictionaryConverting>
{
	// 環境設定用ビュー
	IBOutlet NSView *preferenceView;
	// フィルタキーのコントローラ
	IBOutlet NSArrayController *keyController;
	
	// 連鎖あぼーん用、
	NSMutableIndexSet *resIndexesToAbone;
}

#pragma mark T2PluginInterface_v100
+ (NSArray *)pluginInstances;
- (NSString *)uniqueName;
- (NSString *)localizedName;
- (NSString *)localizedPluginInfo;
- (T2PluginType)pluginType;
- (int)pluginOrder;

- (NSArray *)preferenceItems;

#pragma mark T2ThreadHTMLProcessing_v100
- (NSString *)processedHTML:(NSString *)htmlString ofRes:(T2Res *)res inThread:(T2Thread *)thread;

#pragma mark <T2DictionaryConverting>
- (NSArray *)dictionaryConvertingKeysForUse:(T2DictionaryConvertingUse)use;

#pragma mark アクセサ
- (NSArray *)keys;
- (void)setKeys:(NSArray *)keys;

#pragma mark -
// レスをあぼーん。
- (void)aboneRes:(T2Res *)res;

@end
