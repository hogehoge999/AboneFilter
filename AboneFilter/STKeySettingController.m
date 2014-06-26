//
//  STKeySettingController.m
//  AboneFilter
//
//  Created by s-take on Fri Mar 09 2007.
//  Copyright (c) 2007 s-take. All rights reserved.
//

#import "STKeySettingController.h"


@implementation STKeySettingController

- (BOOL)validateMenuItem:(id <NSMenuItem>)menuItem
{
	// 「詳細設定...」：複数選択されてたら使用不可
	if([menuItem action] == @selector(showAdvancedPanel:)) {
		return ([[keyController selectedObjects] count] == 1);
	}
	return YES;
}

- (void)showAdvancedPanel:(id)sender
{
	// フィルタキーの値をシート上のコントロールに反映
	STFilterKey *key = [[keyController selectedObjects] objectAtIndex:0];
//	[keyField setStringValue:([key keyString]? [key keyString]: @"")];
	[keyField setStringValue:[key keyString]];
	[chainAboneBox setState:[key filtersChainly]];
	[inNameBox setState:[key checksName]];
	[inMailBox setState:[key checksMail]];
	[inIdentifierBox setState:[key checksIdentifier]];
	[inContentBox setState:[key checksContent]];
	
	// 詳細設定シートを表示
	[NSApp beginSheet:advancedPanel
	   modalForWindow:[prefView window]
		modalDelegate:self
	   didEndSelector:@selector(sheetDidEnd:returnCode:contextInfo:)
		  contextInfo:NULL];
}

- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(int)returnCode contextInfo:(void *)contextInfo
{
	[advancedPanel orderOut:self];
}

// 詳細設定：OK
- (void)advancedPanelOK:(id)sender
{
	[NSApp endSheet:advancedPanel returnCode:YES];
	
	// シート上のコントロールの値をフィルタキーに反映
	STFilterKey *key = [[keyController selectedObjects] objectAtIndex:0];
	[key setKeyString:[keyField stringValue]];
	[key setFiltersChainly:[chainAboneBox state]];
	[key setChecksName:[inNameBox state]];
	[key setChecksMail:[inMailBox state]];
	[key setChecksIdentifier:[inIdentifierBox state]];
	[key setChecksContent:[inContentBox state]];
}

// 詳細設定：キャンセル
- (void)advancedPanelCancel:(id)sender
{
	[NSApp endSheet:advancedPanel returnCode:NO];
}

@end
