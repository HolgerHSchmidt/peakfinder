//
//  PeakFinder1DIterative.h
//  PeakFinder
//
//  Created by Holger Schmidt on 29.12.19.
//  Copyright © 2019 Holger Schmidt. All rights reserved.
//

#ifndef PeakFinder1DIterative_h
#define PeakFinder1DIterative_h

#include <algorithm>

template <typename IterT>
IterT FindAPeakIterative(IterT it, IterT end) {
    
    while (it != end) {
        auto distance = std::distance(it, end);
        auto middleIndex = distance / 2;
        auto middle = it;
        std::advance(middle, middleIndex);
        auto next = middle;
        ++next;
        if (next == end) {
            auto prev = middle;
            --prev;
            if (*prev < *middle)
                return middle;
            end = middle;
            continue;
        }
        if (*middle < *next)
            it = next;
        else {
            auto prev = middle;
            --prev;
            if (*middle < *prev)
                end = prev;
            else
                return middle;
        }
    }
    
    return it;
}


#endif /* PeakFinder1DIterative_h */
