
#include <folly/Portability.h>

#include <stdint.h>

namespace folly {
namespace detail {

#if (FOLLY_X64 || defined(__i386__)) && (FOLLY_SSE >= 2)
alignas(16) extern const uint64_t groupVarintSSEMasks[512] = {
  0xffffff01ffffff00ULL, 0xffffff03ffffff02ULL,
  0xffffff02ffff0100ULL, 0xffffff04ffffff03ULL,
  0xffffff03ff020100ULL, 0xffffff05ffffff04ULL,
  0xffffff0403020100ULL, 0xffffff06ffffff05ULL,
  0xffff0201ffffff00ULL, 0xffffff04ffffff03ULL,
  0xffff0302ffff0100ULL, 0xffffff05ffffff04ULL,
  0xffff0403ff020100ULL, 0xffffff06ffffff05ULL,
  0xffff050403020100ULL, 0xffffff07ffffff06ULL,
  0xff030201ffffff00ULL, 0xffffff05ffffff04ULL,
  0xff040302ffff0100ULL, 0xffffff06ffffff05ULL,
  0xff050403ff020100ULL, 0xffffff07ffffff06ULL,
  0xff06050403020100ULL, 0xffffff08ffffff07ULL,
  0x04030201ffffff00ULL, 0xffffff06ffffff05ULL,
  0x05040302ffff0100ULL, 0xffffff07ffffff06ULL,
  0x06050403ff020100ULL, 0xffffff08ffffff07ULL,
  0x0706050403020100ULL, 0xffffff09ffffff08ULL,
  0xffffff01ffffff00ULL, 0xffffff04ffff0302ULL,
  0xffffff02ffff0100ULL, 0xffffff05ffff0403ULL,
  0xffffff03ff020100ULL, 0xffffff06ffff0504ULL,
  0xffffff0403020100ULL, 0xffffff07ffff0605ULL,
  0xffff0201ffffff00ULL, 0xffffff05ffff0403ULL,
  0xffff0302ffff0100ULL, 0xffffff06ffff0504ULL,
  0xffff0403ff020100ULL, 0xffffff07ffff0605ULL,
  0xffff050403020100ULL, 0xffffff08ffff0706ULL,
  0xff030201ffffff00ULL, 0xffffff06ffff0504ULL,
  0xff040302ffff0100ULL, 0xffffff07ffff0605ULL,
  0xff050403ff020100ULL, 0xffffff08ffff0706ULL,
  0xff06050403020100ULL, 0xffffff09ffff0807ULL,
  0x04030201ffffff00ULL, 0xffffff07ffff0605ULL,
  0x05040302ffff0100ULL, 0xffffff08ffff0706ULL,
  0x06050403ff020100ULL, 0xffffff09ffff0807ULL,
  0x0706050403020100ULL, 0xffffff0affff0908ULL,
  0xffffff01ffffff00ULL, 0xffffff05ff040302ULL,
  0xffffff02ffff0100ULL, 0xffffff06ff050403ULL,
  0xffffff03ff020100ULL, 0xffffff07ff060504ULL,
  0xffffff0403020100ULL, 0xffffff08ff070605ULL,
  0xffff0201ffffff00ULL, 0xffffff06ff050403ULL,
  0xffff0302ffff0100ULL, 0xffffff07ff060504ULL,
  0xffff0403ff020100ULL, 0xffffff08ff070605ULL,
  0xffff050403020100ULL, 0xffffff09ff080706ULL,
  0xff030201ffffff00ULL, 0xffffff07ff060504ULL,
  0xff040302ffff0100ULL, 0xffffff08ff070605ULL,
  0xff050403ff020100ULL, 0xffffff09ff080706ULL,
  0xff06050403020100ULL, 0xffffff0aff090807ULL,
  0x04030201ffffff00ULL, 0xffffff08ff070605ULL,
  0x05040302ffff0100ULL, 0xffffff09ff080706ULL,
  0x06050403ff020100ULL, 0xffffff0aff090807ULL,
  0x0706050403020100ULL, 0xffffff0bff0a0908ULL,
  0xffffff01ffffff00ULL, 0xffffff0605040302ULL,
  0xffffff02ffff0100ULL, 0xffffff0706050403ULL,
  0xffffff03ff020100ULL, 0xffffff0807060504ULL,
  0xffffff0403020100ULL, 0xffffff0908070605ULL,
  0xffff0201ffffff00ULL, 0xffffff0706050403ULL,
  0xffff0302ffff0100ULL, 0xffffff0807060504ULL,
  0xffff0403ff020100ULL, 0xffffff0908070605ULL,
  0xffff050403020100ULL, 0xffffff0a09080706ULL,
  0xff030201ffffff00ULL, 0xffffff0807060504ULL,
  0xff040302ffff0100ULL, 0xffffff0908070605ULL,
  0xff050403ff020100ULL, 0xffffff0a09080706ULL,
  0xff06050403020100ULL, 0xffffff0b0a090807ULL,
  0x04030201ffffff00ULL, 0xffffff0908070605ULL,
  0x05040302ffff0100ULL, 0xffffff0a09080706ULL,
  0x06050403ff020100ULL, 0xffffff0b0a090807ULL,
  0x0706050403020100ULL, 0xffffff0c0b0a0908ULL,
  0xffffff01ffffff00ULL, 0xffff0403ffffff02ULL,
  0xffffff02ffff0100ULL, 0xffff0504ffffff03ULL,
  0xffffff03ff020100ULL, 0xffff0605ffffff04ULL,
  0xffffff0403020100ULL, 0xffff0706ffffff05ULL,
  0xffff0201ffffff00ULL, 0xffff0504ffffff03ULL,
  0xffff0302ffff0100ULL, 0xffff0605ffffff04ULL,
  0xffff0403ff020100ULL, 0xffff0706ffffff05ULL,
  0xffff050403020100ULL, 0xffff0807ffffff06ULL,
  0xff030201ffffff00ULL, 0xffff0605ffffff04ULL,
  0xff040302ffff0100ULL, 0xffff0706ffffff05ULL,
  0xff050403ff020100ULL, 0xffff0807ffffff06ULL,
  0xff06050403020100ULL, 0xffff0908ffffff07ULL,
  0x04030201ffffff00ULL, 0xffff0706ffffff05ULL,
  0x05040302ffff0100ULL, 0xffff0807ffffff06ULL,
  0x06050403ff020100ULL, 0xffff0908ffffff07ULL,
  0x0706050403020100ULL, 0xffff0a09ffffff08ULL,
  0xffffff01ffffff00ULL, 0xffff0504ffff0302ULL,
  0xffffff02ffff0100ULL, 0xffff0605ffff0403ULL,
  0xffffff03ff020100ULL, 0xffff0706ffff0504ULL,
  0xffffff0403020100ULL, 0xffff0807ffff0605ULL,
  0xffff0201ffffff00ULL, 0xffff0605ffff0403ULL,
  0xffff0302ffff0100ULL, 0xffff0706ffff0504ULL,
  0xffff0403ff020100ULL, 0xffff0807ffff0605ULL,
  0xffff050403020100ULL, 0xffff0908ffff0706ULL,
  0xff030201ffffff00ULL, 0xffff0706ffff0504ULL,
  0xff040302ffff0100ULL, 0xffff0807ffff0605ULL,
  0xff050403ff020100ULL, 0xffff0908ffff0706ULL,
  0xff06050403020100ULL, 0xffff0a09ffff0807ULL,
  0x04030201ffffff00ULL, 0xffff0807ffff0605ULL,
  0x05040302ffff0100ULL, 0xffff0908ffff0706ULL,
  0x06050403ff020100ULL, 0xffff0a09ffff0807ULL,
  0x0706050403020100ULL, 0xffff0b0affff0908ULL,
  0xffffff01ffffff00ULL, 0xffff0605ff040302ULL,
  0xffffff02ffff0100ULL, 0xffff0706ff050403ULL,
  0xffffff03ff020100ULL, 0xffff0807ff060504ULL,
  0xffffff0403020100ULL, 0xffff0908ff070605ULL,
  0xffff0201ffffff00ULL, 0xffff0706ff050403ULL,
  0xffff0302ffff0100ULL, 0xffff0807ff060504ULL,
  0xffff0403ff020100ULL, 0xffff0908ff070605ULL,
  0xffff050403020100ULL, 0xffff0a09ff080706ULL,
  0xff030201ffffff00ULL, 0xffff0807ff060504ULL,
  0xff040302ffff0100ULL, 0xffff0908ff070605ULL,
  0xff050403ff020100ULL, 0xffff0a09ff080706ULL,
  0xff06050403020100ULL, 0xffff0b0aff090807ULL,
  0x04030201ffffff00ULL, 0xffff0908ff070605ULL,
  0x05040302ffff0100ULL, 0xffff0a09ff080706ULL,
  0x06050403ff020100ULL, 0xffff0b0aff090807ULL,
  0x0706050403020100ULL, 0xffff0c0bff0a0908ULL,
  0xffffff01ffffff00ULL, 0xffff070605040302ULL,
  0xffffff02ffff0100ULL, 0xffff080706050403ULL,
  0xffffff03ff020100ULL, 0xffff090807060504ULL,
  0xffffff0403020100ULL, 0xffff0a0908070605ULL,
  0xffff0201ffffff00ULL, 0xffff080706050403ULL,
  0xffff0302ffff0100ULL, 0xffff090807060504ULL,
  0xffff0403ff020100ULL, 0xffff0a0908070605ULL,
  0xffff050403020100ULL, 0xffff0b0a09080706ULL,
  0xff030201ffffff00ULL, 0xffff090807060504ULL,
  0xff040302ffff0100ULL, 0xffff0a0908070605ULL,
  0xff050403ff020100ULL, 0xffff0b0a09080706ULL,
  0xff06050403020100ULL, 0xffff0c0b0a090807ULL,
  0x04030201ffffff00ULL, 0xffff0a0908070605ULL,
  0x05040302ffff0100ULL, 0xffff0b0a09080706ULL,
  0x06050403ff020100ULL, 0xffff0c0b0a090807ULL,
  0x0706050403020100ULL, 0xffff0d0c0b0a0908ULL,
  0xffffff01ffffff00ULL, 0xff050403ffffff02ULL,
  0xffffff02ffff0100ULL, 0xff060504ffffff03ULL,
  0xffffff03ff020100ULL, 0xff070605ffffff04ULL,
  0xffffff0403020100ULL, 0xff080706ffffff05ULL,
  0xffff0201ffffff00ULL, 0xff060504ffffff03ULL,
  0xffff0302ffff0100ULL, 0xff070605ffffff04ULL,
  0xffff0403ff020100ULL, 0xff080706ffffff05ULL,
  0xffff050403020100ULL, 0xff090807ffffff06ULL,
  0xff030201ffffff00ULL, 0xff070605ffffff04ULL,
  0xff040302ffff0100ULL, 0xff080706ffffff05ULL,
  0xff050403ff020100ULL, 0xff090807ffffff06ULL,
  0xff06050403020100ULL, 0xff0a0908ffffff07ULL,
  0x04030201ffffff00ULL, 0xff080706ffffff05ULL,
  0x05040302ffff0100ULL, 0xff090807ffffff06ULL,
  0x06050403ff020100ULL, 0xff0a0908ffffff07ULL,
  0x0706050403020100ULL, 0xff0b0a09ffffff08ULL,
  0xffffff01ffffff00ULL, 0xff060504ffff0302ULL,
  0xffffff02ffff0100ULL, 0xff070605ffff0403ULL,
  0xffffff03ff020100ULL, 0xff080706ffff0504ULL,
  0xffffff0403020100ULL, 0xff090807ffff0605ULL,
  0xffff0201ffffff00ULL, 0xff070605ffff0403ULL,
  0xffff0302ffff0100ULL, 0xff080706ffff0504ULL,
  0xffff0403ff020100ULL, 0xff090807ffff0605ULL,
  0xffff050403020100ULL, 0xff0a0908ffff0706ULL,
  0xff030201ffffff00ULL, 0xff080706ffff0504ULL,
  0xff040302ffff0100ULL, 0xff090807ffff0605ULL,
  0xff050403ff020100ULL, 0xff0a0908ffff0706ULL,
  0xff06050403020100ULL, 0xff0b0a09ffff0807ULL,
  0x04030201ffffff00ULL, 0xff090807ffff0605ULL,
  0x05040302ffff0100ULL, 0xff0a0908ffff0706ULL,
  0x06050403ff020100ULL, 0xff0b0a09ffff0807ULL,
  0x0706050403020100ULL, 0xff0c0b0affff0908ULL,
  0xffffff01ffffff00ULL, 0xff070605ff040302ULL,
  0xffffff02ffff0100ULL, 0xff080706ff050403ULL,
  0xffffff03ff020100ULL, 0xff090807ff060504ULL,
  0xffffff0403020100ULL, 0xff0a0908ff070605ULL,
  0xffff0201ffffff00ULL, 0xff080706ff050403ULL,
  0xffff0302ffff0100ULL, 0xff090807ff060504ULL,
  0xffff0403ff020100ULL, 0xff0a0908ff070605ULL,
  0xffff050403020100ULL, 0xff0b0a09ff080706ULL,
  0xff030201ffffff00ULL, 0xff090807ff060504ULL,
  0xff040302ffff0100ULL, 0xff0a0908ff070605ULL,
  0xff050403ff020100ULL, 0xff0b0a09ff080706ULL,
  0xff06050403020100ULL, 0xff0c0b0aff090807ULL,
  0x04030201ffffff00ULL, 0xff0a0908ff070605ULL,
  0x05040302ffff0100ULL, 0xff0b0a09ff080706ULL,
  0x06050403ff020100ULL, 0xff0c0b0aff090807ULL,
  0x0706050403020100ULL, 0xff0d0c0bff0a0908ULL,
  0xffffff01ffffff00ULL, 0xff08070605040302ULL,
  0xffffff02ffff0100ULL, 0xff09080706050403ULL,
  0xffffff03ff020100ULL, 0xff0a090807060504ULL,
  0xffffff0403020100ULL, 0xff0b0a0908070605ULL,
  0xffff0201ffffff00ULL, 0xff09080706050403ULL,
  0xffff0302ffff0100ULL, 0xff0a090807060504ULL,
  0xffff0403ff020100ULL, 0xff0b0a0908070605ULL,
  0xffff050403020100ULL, 0xff0c0b0a09080706ULL,
  0xff030201ffffff00ULL, 0xff0a090807060504ULL,
  0xff040302ffff0100ULL, 0xff0b0a0908070605ULL,
  0xff050403ff020100ULL, 0xff0c0b0a09080706ULL,
  0xff06050403020100ULL, 0xff0d0c0b0a090807ULL,
  0x04030201ffffff00ULL, 0xff0b0a0908070605ULL,
  0x05040302ffff0100ULL, 0xff0c0b0a09080706ULL,
  0x06050403ff020100ULL, 0xff0d0c0b0a090807ULL,
  0x0706050403020100ULL, 0xff0e0d0c0b0a0908ULL,
  0xffffff01ffffff00ULL, 0x06050403ffffff02ULL,
  0xffffff02ffff0100ULL, 0x07060504ffffff03ULL,
  0xffffff03ff020100ULL, 0x08070605ffffff04ULL,
  0xffffff0403020100ULL, 0x09080706ffffff05ULL,
  0xffff0201ffffff00ULL, 0x07060504ffffff03ULL,
  0xffff0302ffff0100ULL, 0x08070605ffffff04ULL,
  0xffff0403ff020100ULL, 0x09080706ffffff05ULL,
  0xffff050403020100ULL, 0x0a090807ffffff06ULL,
  0xff030201ffffff00ULL, 0x08070605ffffff04ULL,
  0xff040302ffff0100ULL, 0x09080706ffffff05ULL,
  0xff050403ff020100ULL, 0x0a090807ffffff06ULL,
  0xff06050403020100ULL, 0x0b0a0908ffffff07ULL,
  0x04030201ffffff00ULL, 0x09080706ffffff05ULL,
  0x05040302ffff0100ULL, 0x0a090807ffffff06ULL,
  0x06050403ff020100ULL, 0x0b0a0908ffffff07ULL,
  0x0706050403020100ULL, 0x0c0b0a09ffffff08ULL,
  0xffffff01ffffff00ULL, 0x07060504ffff0302ULL,
  0xffffff02ffff0100ULL, 0x08070605ffff0403ULL,
  0xffffff03ff020100ULL, 0x09080706ffff0504ULL,
  0xffffff0403020100ULL, 0x0a090807ffff0605ULL,
  0xffff0201ffffff00ULL, 0x08070605ffff0403ULL,
  0xffff0302ffff0100ULL, 0x09080706ffff0504ULL,
  0xffff0403ff020100ULL, 0x0a090807ffff0605ULL,
  0xffff050403020100ULL, 0x0b0a0908ffff0706ULL,
  0xff030201ffffff00ULL, 0x09080706ffff0504ULL,
  0xff040302ffff0100ULL, 0x0a090807ffff0605ULL,
  0xff050403ff020100ULL, 0x0b0a0908ffff0706ULL,
  0xff06050403020100ULL, 0x0c0b0a09ffff0807ULL,
  0x04030201ffffff00ULL, 0x0a090807ffff0605ULL,
  0x05040302ffff0100ULL, 0x0b0a0908ffff0706ULL,
  0x06050403ff020100ULL, 0x0c0b0a09ffff0807ULL,
  0x0706050403020100ULL, 0x0d0c0b0affff0908ULL,
  0xffffff01ffffff00ULL, 0x08070605ff040302ULL,
  0xffffff02ffff0100ULL, 0x09080706ff050403ULL,
  0xffffff03ff020100ULL, 0x0a090807ff060504ULL,
  0xffffff0403020100ULL, 0x0b0a0908ff070605ULL,
  0xffff0201ffffff00ULL, 0x09080706ff050403ULL,
  0xffff0302ffff0100ULL, 0x0a090807ff060504ULL,
  0xffff0403ff020100ULL, 0x0b0a0908ff070605ULL,
  0xffff050403020100ULL, 0x0c0b0a09ff080706ULL,
  0xff030201ffffff00ULL, 0x0a090807ff060504ULL,
  0xff040302ffff0100ULL, 0x0b0a0908ff070605ULL,
  0xff050403ff020100ULL, 0x0c0b0a09ff080706ULL,
  0xff06050403020100ULL, 0x0d0c0b0aff090807ULL,
  0x04030201ffffff00ULL, 0x0b0a0908ff070605ULL,
  0x05040302ffff0100ULL, 0x0c0b0a09ff080706ULL,
  0x06050403ff020100ULL, 0x0d0c0b0aff090807ULL,
  0x0706050403020100ULL, 0x0e0d0c0bff0a0908ULL,
  0xffffff01ffffff00ULL, 0x0908070605040302ULL,
  0xffffff02ffff0100ULL, 0x0a09080706050403ULL,
  0xffffff03ff020100ULL, 0x0b0a090807060504ULL,
  0xffffff0403020100ULL, 0x0c0b0a0908070605ULL,
  0xffff0201ffffff00ULL, 0x0a09080706050403ULL,
  0xffff0302ffff0100ULL, 0x0b0a090807060504ULL,
  0xffff0403ff020100ULL, 0x0c0b0a0908070605ULL,
  0xffff050403020100ULL, 0x0d0c0b0a09080706ULL,
  0xff030201ffffff00ULL, 0x0b0a090807060504ULL,
  0xff040302ffff0100ULL, 0x0c0b0a0908070605ULL,
  0xff050403ff020100ULL, 0x0d0c0b0a09080706ULL,
  0xff06050403020100ULL, 0x0e0d0c0b0a090807ULL,
  0x04030201ffffff00ULL, 0x0c0b0a0908070605ULL,
  0x05040302ffff0100ULL, 0x0d0c0b0a09080706ULL,
  0x06050403ff020100ULL, 0x0e0d0c0b0a090807ULL,
  0x0706050403020100ULL, 0x0f0e0d0c0b0a0908ULL,
};
#endif /*#if (FOLLY_X64 || defined(__i386__)) && (FOLLY_SSE >= 2)*/

extern const uint8_t groupVarintLengths[] = {
  5,
  6,
  7,
  8,
  6,
  7,
  8,
  9,
  7,
  8,
  9,
  10,
  8,
  9,
  10,
  11,
  6,
  7,
  8,
  9,
  7,
  8,
  9,
  10,
  8,
  9,
  10,
  11,
  9,
  10,
  11,
  12,
  7,
  8,
  9,
  10,
  8,
  9,
  10,
  11,
  9,
  10,
  11,
  12,
  10,
  11,
  12,
  13,
  8,
  9,
  10,
  11,
  9,
  10,
  11,
  12,
  10,
  11,
  12,
  13,
  11,
  12,
  13,
  14,
  6,
  7,
  8,
  9,
  7,
  8,
  9,
  10,
  8,
  9,
  10,
  11,
  9,
  10,
  11,
  12,
  7,
  8,
  9,
  10,
  8,
  9,
  10,
  11,
  9,
  10,
  11,
  12,
  10,
  11,
  12,
  13,
  8,
  9,
  10,
  11,
  9,
  10,
  11,
  12,
  10,
  11,
  12,
  13,
  11,
  12,
  13,
  14,
  9,
  10,
  11,
  12,
  10,
  11,
  12,
  13,
  11,
  12,
  13,
  14,
  12,
  13,
  14,
  15,
  7,
  8,
  9,
  10,
  8,
  9,
  10,
  11,
  9,
  10,
  11,
  12,
  10,
  11,
  12,
  13,
  8,
  9,
  10,
  11,
  9,
  10,
  11,
  12,
  10,
  11,
  12,
  13,
  11,
  12,
  13,
  14,
  9,
  10,
  11,
  12,
  10,
  11,
  12,
  13,
  11,
  12,
  13,
  14,
  12,
  13,
  14,
  15,
  10,
  11,
  12,
  13,
  11,
  12,
  13,
  14,
  12,
  13,
  14,
  15,
  13,
  14,
  15,
  16,
  8,
  9,
  10,
  11,
  9,
  10,
  11,
  12,
  10,
  11,
  12,
  13,
  11,
  12,
  13,
  14,
  9,
  10,
  11,
  12,
  10,
  11,
  12,
  13,
  11,
  12,
  13,
  14,
  12,
  13,
  14,
  15,
  10,
  11,
  12,
  13,
  11,
  12,
  13,
  14,
  12,
  13,
  14,
  15,
  13,
  14,
  15,
  16,
  11,
  12,
  13,
  14,
  12,
  13,
  14,
  15,
  13,
  14,
  15,
  16,
  14,
  15,
  16,
  17,

};

} // namespace detail
} // namespace folly
