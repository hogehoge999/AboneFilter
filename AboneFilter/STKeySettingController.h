//
//  STKeySettingController.h
//  AboneFilter
//
//  Created by s-take on Fri Mar 09 2007.
//  Copyright (c) 2007 s-take. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "STFilterKey.h"


@interface STKeySettingController : NSObject
{
	IBOutlet NSView *prefView;
	IBOutlet NSPanel *advancedPanel;
	IBOutlet NSArrayController *keyController;
	
	// �ڍאݒ�p�l����̃R���g���[��
	IBOutlet NSTextField *keyField;
	IBOutlet NSButton *chainAboneBox;
	IBOutlet NSButton *inNameBox;
	IBOutlet NSButton *inMailBox;
	IBOutlet NSButton *inIdentifierBox;
	IBOutlet NSButton *inContentBox;
}

//�@�ڍאݒ��\��
- (void)showAdvancedPanel:(id)sender;
- (void)sheetDidEnd:(NSWindow *)sheet returnCode:(int)returnCode contextInfo:(void *)contextInfo;
// �ڍאݒ�F�A�N�V����
- (void)advancedPanelOK:(id)sender;
- (void)advancedPanelCancel:(id)sender;

@end
