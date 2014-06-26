//
//  STNSStringAdditions.h
//  Thread Inspector
//
//  Created by s-take on Wed Aug 30 2006.
//  Copyright (c) 2006 s-take. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSString(STNSStringAdditions)

// 文字列中にaStringを含んでいればYES
- (BOOL)containsString:(NSString *)aString;

@end
