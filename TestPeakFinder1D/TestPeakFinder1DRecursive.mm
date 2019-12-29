//
//  TestPeakFinder1D.m
//  TestPeakFinder1D
//
//  Created by Holger Schmidt on 29.12.19.
//  Copyright © 2019 Holger Schmidt. All rights reserved.
//

#import <XCTest/XCTest.h>

#include <array>
#include <iterator>
#include <list>
#include <vector>
#include "../PeakFinder/PeakFinder1DRecursive.hpp"

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
    std::array<int, 0> ints;
    auto peak = FindAPeakRecursive(ints.cbegin(), ints.cend());
    XCTAssert(peak == ints.cend());
}

- (void)testSingleElement {
    std::array<int, 1> ints {1};
    auto peak = FindAPeakRecursive(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 1);
}

- (void)test2Elements_lastIsPeak {
    int ints[] {1, 2};
    auto peak = FindAPeakRecursive(std::begin(ints), std::end(ints));
    XCTAssert(*peak == 2);
}

- (void)test2Elements_firstIsPeak {
    int ints[] {2, 1};
    auto peak = FindAPeakRecursive(std::begin(ints), std::end(ints));
    XCTAssert(*peak == 2);
}

- (void)test3Elements_sortedAscending_lastIsPeak {
    std::vector<int> ints {1, 2, 3};
    auto peak = FindAPeakRecursive(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 3);
}

- (void)test3Elements_sortedDecending_firstIsPeak {
    std::list<int> ints {3, 2, 1};
    auto peak = FindAPeakRecursive(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 3);
}

- (void)test3Elements_middleIsPeak {
    std::vector<int> ints {2, 3, 1};
    auto peak = FindAPeakRecursive(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 3);
}

- (void)test4Elements_middleIsPeak {
    std::vector<int> ints {2, 3, 3, 1};
    auto peak = FindAPeakRecursive(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 3);
}

- (void)test5Elements_middleIsPeak {
    std::vector<int> ints {2, 3, 3, 3, 1};
    auto peak = FindAPeakRecursive(ints.cbegin(), ints.cend());
    XCTAssert(*peak == 3);
}

- (void)test20Elements_sortedAscending_lastIsPeak {
    int ints[] {1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20};
    auto peak = FindAPeakRecursive(std::begin(ints), std::end(ints));
    XCTAssert(*peak == 20);
}

@end
