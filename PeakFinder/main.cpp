//
//  main.cpp
//  PeakFinder
//
//  Created by Holger Schmidt on 29.12.19.
//  Copyright © 2019 Holger Schmidt. All rights reserved.
//

#include <iostream>
#include <vector>

#include "PeakFinder1DRecursive.hpp"

int main(int argc, const char * argv[]) {
    std::vector<int> ints0;
    auto p0 = FindAPeakRecursive(ints0.cbegin(), ints0.cend());
    if (p0 != ints0.cend())
        std::cout << "0 found " << *p0 << "\n";
    else
        std::cout << "0 no peak found\n";
    
    std::vector<int> ints1 {1};
    auto p1 = FindAPeakRecursive(ints1.cbegin(), ints1.cend());
    if (p1 != ints1.cend())
        std::cout << "1 found " << *p1 << "\n";
    else
        std::cout << "1 no peak found\n";
    
    std::vector<int> ints2 {1, 2};
    auto p2 = FindAPeakRecursive(ints2.cbegin(), ints2.cend());
    if (p2 != ints2.cend())
        std::cout << "2 found " << *p2 << "\n";
    else
        std::cout << "2 no peak found\n";
    
    std::vector<int> ints3 {3, 2, 1};
    auto p3 = FindAPeakRecursive(ints3.cbegin(), ints3.cend());
    if (p3 != ints3.cend())
        std::cout << "3 found " << *p3 << "\n";
    else
        std::cout << "3 no peak found\n";
    
    std::vector<int> ints4 {100, 80, 60, 50, 20};
    auto p4 = FindAPeakRecursive(ints4.cbegin(), ints4.cend());
    if (p4 != ints4.cend())
        std::cout << "4 found " << *p4 << "\n";
    else
        std::cout << "4 no peak found\n";
    
    return 0;
}
