//
//  TestPeakFinder1DIterative.m
//  TestPeakFinder1D
//
//  Created by Holger Schmidt on 29.12.19.
//  Copyright © 2019 Holger Schmidt. All rights reserved.
//

#import <XCTest/XCTest.h>

#include <array>
#include <iterator>

#include "../PeakFinder/PeakFinder1DIterative.h"

@interface TestPeakFinder1DIterative : XCTestCase

@end

@implementation TestPeakFinder1DIterative

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testEmpty {
    std::array<int, 0> ints;
     auto peak = FindAPeakIterative(std::begin(ints), std::end(ints));
     XCTAssert(peak == std::end(ints));
}

- (void)test1Element {
    std::array<int, 1> ints{1};
     auto peak = FindAPeakIterative(std::begin(ints), std::end(ints));
     XCTAssert(*peak == 1);
}

- (void)test2Elements_ascendingOrder {
    std::array<int, 2> ints{1,2};
     auto peak = FindAPeakIterative(std::begin(ints), std::end(ints));
     XCTAssert(*peak == 2);
}

- (void)test2Elements_descendingOrder {
    std::array<int, 2> ints{2,1};
     auto peak = FindAPeakIterative(std::begin(ints), std::end(ints));
     XCTAssert(*peak == 2);
}

- (void)test3Elements_ascendingOrder {
    int ints[]{1,2,3};
     auto peak = FindAPeakIterative(std::begin(ints), std::end(ints));
     XCTAssert(*peak == 3);
}

- (void)test3Elements_descendingOrder {
    int ints[]{3,2,1};
     auto peak = FindAPeakIterative(std::begin(ints), std::end(ints));
     XCTAssert(*peak == 3);
}

-(void)test3Elements_peakIsMiddle {
    int ints[]{2,3,1};
     auto peak = FindAPeakIterative(std::begin(ints), std::end(ints));
     XCTAssert(*peak == 3);
}

-(void)test4Elements_peakIsMiddle {
    int ints[]{2,3,3,1};
     auto peak = FindAPeakIterative(std::begin(ints), std::end(ints));
     XCTAssert(*peak == 3);
}

- (void)test4Elements_ascendingOrder {
    int ints[]{1,2,3,4};
     auto peak = FindAPeakIterative(std::begin(ints), std::end(ints));
     XCTAssert(*peak == 4);
}

- (void)test4Elements_descendingOrder {
    int ints[]{4,3,2,1};
     auto peak = FindAPeakIterative(std::begin(ints), std::end(ints));
     XCTAssert(*peak == 4);
}

@end
