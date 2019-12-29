//
//  TestPeakFinder1D.m
//  TestPeakFinder1D
//
//  Created by Holger Schmidt on 29.12.19.
//  Copyright © 2019 Holger Schmidt. All rights reserved.
//

#import <XCTest/XCTest.h>

#include <vector>
#include "../PeakFinder/PeakFinder1D.hpp"

@interface TestPeakFinder1D : XCTestCase

@end

@implementation TestPeakFinder1D

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testEmptyArray {
    std::vector<int> ints;
    auto peak = FindAPeak(ints.cbegin(), ints.cend());
    XCTAssert(peak == ints.cend());
}

- (void)testSingleElement {
    std::vector<int> ints {1};
    auto peak = FindAPeak(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 1);
}

- (void)test2Elements_lastIsPeak {
    std::vector<int> ints {1, 2};
    auto peak = FindAPeak(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 2);
}

- (void)test2Elements_firstIsPeak {
    std::vector<int> ints {2, 1};
    auto peak = FindAPeak(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 2);
}

- (void)test3Elements_lastIsPeak {
    std::vector<int> ints {1, 2, 3};
    auto peak = FindAPeak(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 3);
}

- (void)test3Elements_firstIsPeak {
    std::vector<int> ints {3, 2, 1};
    auto peak = FindAPeak(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 3);
}

- (void)test3Elements_middleIsPeak {
    std::vector<int> ints {2, 3, 1};
    auto peak = FindAPeak(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 3);
}

- (void)test4Elements_middleIsPeak {
    std::vector<int> ints {2, 3, 3, 1};
    auto peak = FindAPeak(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 3);
}

@end
