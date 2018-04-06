//
//  EPEvaluator.h
//  EPEvaluator
//
//  Created by Evgeniy on 06.04.18.
//  Copyright © 2018 Evgeniy. All rights reserved.
//

#include <TargetConditionals.h>

#if TARGET_OS_IPHONE
@import UIKit;
#else
@import AppKit;
#endif

//! Project version number for EPEvaluator_macOS.
FOUNDATION_EXPORT double EPEvaluatorVersionNumber;

//! Project version string for EPEvaluator_macOS.
FOUNDATION_EXPORT const unsigned char EPEvaluatorVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <EPEvaluator/PublicHeader.h>


