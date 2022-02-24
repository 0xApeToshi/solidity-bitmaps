// SPDX-License-Identifier: MIT
// based on https://soliditydeveloper.com/bitmaps

pragma solidity 0.8.12;

contract Bitmaps {
    uint256[] public bitmaps;

    constructor(uint256[] memory _bitmaps) {
        bitmaps = _bitmaps;
    }

    function setBitmaps(uint256[] memory _bitmaps) external {
        bitmaps = _bitmaps;
    }
    
    function readBit(uint256 bitmapIndexFromLeft, uint256 bitIndexFromRight) public view returns (bool) {
        uint256 bitAtIndex = bitmaps[bitmapIndexFromLeft] & (1 << bitIndexFromRight);
        return bitAtIndex > 0;
    }
    ///@dev overload with one arg
    function readBit(uint256 indexFromRight) external view returns (bool) {
        uint256 bitmapIndexFromLeft = (256*bitmaps.length - indexFromRight - 1) / 256;
        uint256 bitIndexFromRight = indexFromRight % 256;
        return readBit(bitmapIndexFromLeft, bitIndexFromRight);
    }
}
