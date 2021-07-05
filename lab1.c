/* CSE 2312 - Summer 2021 - Lab 1 Driver
 *
 * All values are example values only - student programs will be evaluated with 
 * different inputs.  Students are expected to test their code with different 
 * values to ensure their code functions correctly.
 *
 */

#include<stdio.h>
#include<stdlib.h>
#include<stdint.h>
#include<stdbool.h>

extern uint64_t add64(uint32_t x, uint32_t y); // returns x + y
extern uint64_t sub64(uint64_t x, uint64_t y); // returns x - y
extern uint32_t minU32(uint32_t x, uint32_t y); // returns the minimum of x, y
extern int8_t minS8(int8_t x, int8_t y); // returns the minimum of x, y
extern bool isLessThanU16(uint16_t x, uint16_t y); // returns 1 if x < y, 0 else
extern bool isLessThanS16(int16_t x, int16_t y); // returns 1 if x < y, 0 else
extern uint8_t shiftLeftU8 (uint8_t x, uint8_t p); // returns x << p = x * 2^p for p = 0 .. 8
extern uint16_t shiftU16(uint16_t x, int16_t p); // return x * 2^p for p = -16 .. 16
extern int8_t shiftS8(int8_t x, int8_t p); // return x * 2^p for p = -8 .. 8
extern bool isEqualU16(uint8_t x, uint8_t y); // returns 1 if x = y, 0 if x != y
extern bool isEqualS8(int8_t x, int8_t y); // returns 1 if x = y, 0 if x != y

int main(void) {
	
	uint32_t a = 4294967295;
	uint32_t b = 4294967295;
	
	printf("Question 1, add64: Correct answer = %lld\n", 8589934590);
	printf("Question 1, add64: Student answer = %lld\n\n", add64(a, b));
	
	uint64_t c = 9000000000;
	uint64_t d = 8000000000;
	
	printf("Question 2, sub64: Correct answer = %lld\n", c - d);
	printf("Question 2, sub64: Student answer = %lld\n\n", sub64(c, d));
	
	uint32_t e = 9;
	uint32_t f = 3;
	
	printf("Question 3, minU32, test 1: Correct answer = %u\n", f);
	printf("Question 3, minU32, test 1: Student answer = %u\n\n", minU32(e, f));
	
	printf("Question 3, minU8, test 2: Correct answer = %u\n", f);
	printf("Question 3, minU8, test 2: Student answer = %u\n\n", minU32(f, e));
	
	int8_t g = -128;
	int8_t h = -125;
	
	printf("Questin 4, minS8, test 1: Correct answer = %hhd\n", g);
	printf("Question 4, minS8, test 1: Student answer = %d\n\n", minS8(g, h));
	
	printf("Question 4, minS8, test 2: Correct answer = %hhd\n", g);
	printf("Question 4, minS8, test 2: Student answer = %hhd\n\n", minS8(h, g));
	
	uint16_t i = 2;
	uint16_t j = 1;
	
	printf("Question 5, isLessThanU8, test 1: Correct answer = %hd\n", 0);
	printf("Question 5, isLessThanU8, test 1: Student answer = %hd\n\n", isLessThanU16(i, j));
	
	printf("Question 5, isLessThanU8, test 2: Correct answer = %hd\n", 1);
	printf("Question 5, isLessThanU8, test 2: Student answer = %hd\n\n", isLessThanU16(j, i));
	
	int16_t k = 27000;
	int16_t l = -32000;
	
	printf("Question 6, isLessThanS16, test 1: Correct answer = %hd\n", 0);
	printf("Question 6, isLessThanS16, test 1: Student answer = %hd\n\n", isLessThanS16(k, l));
	
	printf("Question 6, isLessThanS16, test 2: Correct answer = %hd\n", 1);
	printf("Question 6, isLessThanS16, test 2: Student answer = %hd\n\n", isLessThanS16(l, k));
	
	uint8_t m = 1;
	uint8_t n = 7;
	
	printf("Question 7, shiftLeftU8: Correct answer = %hhu\n", 128);
	printf("Question 7, shiftLeftU8: Student answer = %hhu\n\n", shiftLeftU8(m, n));

	uint16_t m_a = 100;
	uint16_t n_a = 3;
	
	printf("Question 8, shiftU16, test 1: Correct answer = %hu\n", 800);
	printf("Question 8, shiftU16, test 1: Student answer = %hu\n\n", shiftU16(m_a, n_a));
	
	printf("Question 8, shiftU16, test 2: Correct answer = %hu\n", 12);
	printf("Question 8, shiftU16, test 2: Student answer = %hu\n\n", shiftU16(m_a, -3));
	
	int8_t o = -4;
	int8_t p = 4;
	
	printf("Question 9, shiftS8, test 1: Correct answer = %hhd\n", -64);
	printf("Question 9, shiftS8, test 1: Student answer = %hhd\n\n", shiftS8(o, p));
	
	printf("Question 9, shiftS8, test 2: Correct answer = %hhd\n", -2);
	printf("Question 9, shiftS8, test 2: Student answer = %hhd\n\n", shiftS8(o, -1));
	
	uint16_t q = 32;
	uint16_t r = 16;
	
	printf("Question 10, isEqualU16, test 1: Correct answer = %hu\n", 0);
	printf("Question 10, isEqualU16, test 1: Student answer = %hu\n\n", isEqualU16(q, r));
	
	printf("Question 10, isEqualU16, test 2: Correct answer = %hu\n", 1);
	printf("Question 10, isEqualU16, test 2: Student answer = %hu\n\n", isEqualU16(q, q));
	
	int8_t s =-128;
	int8_t t = 127;
	
	printf("Question 11, isEqualS8, test 1: Correct answer = %hhd\n", 0);
	printf("Question 11, isEqualS8, test 1: Student answer = %hhd\n\n", isEqualS8(s, t));
	
	printf("Question 11, isEqualS8, test 2: Correct answer = %d\n", 1);
	printf("Question 11, isEqualS8, test 2: Student answer = %d\n\n", isEqualS8(s, s));
	
	return EXIT_SUCCESS;
}
