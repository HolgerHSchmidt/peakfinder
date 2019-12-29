//
//  PeakFinder1D.hpp
//  PeakFinder
//
//  Created by Holger Schmidt on 29.12.19.
//  Copyright © 2019 Holger Schmidt. All rights reserved.
//
// find a peak value in a given range
// a peak is a peak if and only if an element is greater or equal than its neigbours
// if the element is the first or last element in the range than its enough to be greater or equal than the sole neighbor
// every non empty range has at least one peak
// use devide and conquer
// complexity is O(log n)

#ifndef PeakFinder1D_hpp
#define PeakFinder1D_hpp

#include <algorithm>

template <typename IterT>
IterT FindAPeakRecursive(IterT it, IterT end) {
    auto distance = std::distance(it, end);
    if (distance == 0)
        return end;
    if (distance == 1)
        return it;
    if (distance == 2) {
        auto next = it;
        ++next;
        if (*it >= *next)
            return it;
        return next;
    }
    auto middleIndex = distance / 2;
    auto middle = it;
    std::advance(middle, middleIndex);
    auto next = middle;
    ++next;
    if (*middle < *next)
        return FindAPeakRecursive(next, end);
    auto prev = middle;
    std::advance(prev, -1);
    if (*middle < *prev)
        return FindAPeakRecursive(it, prev);
    return middle;
}

#endif /* PeakFinder1D_hpp */
