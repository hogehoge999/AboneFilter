//
//  STNSArrayAdditions.h
//  AboneFilter
//
//  Created by s-take on Fri Sep 22 2006.
//  Copyright (c) 2006 s-take. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray(STNSArrayAdditions)

// NSStringの配列の中にaStringと同じ文字列があればYES
- (BOOL)containsString:(NSString *)aString;

@end
