/* CSE 2312 - Summer 2021 - Lab 2 Driver
 *
 * All values are example values only - student programs will be evaluated with 
 * different inputs.  Students are expected to test their code with different 
 * values to ensure their code functions correctly.
 *
 */
#include <stdio.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdbool.h>

extern void stringCopy(char* strTo, char* strFrom); // copies strFrom to strTo
extern void stringCat(char* strFrom, char* strTo); // adds strFrom to end of strTo
extern int32_t sumS32(int32_t x[], int32_t count);
extern int16_t sumS16(int16_t x[], int32_t count);
extern uint64_t sumU32_64(uint32_t x[], uint32_t count);
extern uint32_t countNegative (int16_t x[], uint32_t count);
extern uint32_t countNonNegative (int32_t x[], uint32_t count);
extern uint32_t countMatches(char str[], char toMatch);
extern int32_t returnMax(int32_t x[], uint32_t count);
extern int8_t returnMin(int8_t x[], uint32_t count);

#define COUNT 5

int main(void) {
	
	char test1[20] = "abcd";
	char test2[44] = "efgh";

	stringCopy(test1, test2);
	
	printf("Question 1, stringCopy: Correct answer = efgh\n");
	printf("Question 1, stringCopy: Student answer = %s\n\n", test1);

	char test3[20] = "ijkl";
	char test4[44] = "mnop"; 

	stringCat(test3, test4);	

	printf("Question 2, stringCat: Correct answer = mnopijkl\n");
	printf("Question 2, stringCat: Student answer = %s\n\n", test4);	
	
	int32_t arrayInt32[COUNT] = {-4000, -5000, 6000, 7000, 8000};

	printf("Question 3, sumS32: Correct answer = 12000\n");
	printf("Question 3, sumS32: Student answer = %d\n\n", sumS32(arrayInt32, COUNT));
	
	int16_t arrayInt16[COUNT] = {129, -256, 512, 1024, -2048};
	
	printf("Question 4, sumS16: Correct answer = -639\n");
	printf("Question 4, sumS16: Student answer = %hd\n\n", sumS16(arrayInt16, COUNT));
	
	uint32_t arrayUint32[COUNT] = {4000000001, 4000000001, 4000000001, 4000000001, 4000000001};
	
	printf("Question 5, sumU32_64: Correct answer = 20000000005\n");
	printf("Question 5, sumU32_64: Student answer = %lld\n\n", sumU32_64(arrayUint32, COUNT));
	
	printf("Question 6, countNegative: Correct answer = 2\n");
	printf("Question 6, countNegative: Student answer = %u\n\n", countNegative(arrayInt16, COUNT));
	
	printf("Question 7, countNonNegative: Correct answer = 3\n");
	printf("Question 7, countNonNegative: Student answer = %u\n\n", countNonNegative(arrayInt32, COUNT));
	
	char str[] = "aabbccddeeffgghhiijjkkllmmnnooppqqrrss";
	
	printf("Question 8, countMatches: Correct Answer = 2\n");
	printf("Question 8, countMatches: Student Answer = %u\n\n", countMatches(str, 'g'));
	
	printf("Question 9, returnMax: Correct Answer = 8000\n");
	printf("Question 9, returnMax: Student Answer = %d\n\n", returnMax(arrayInt32, COUNT));
	
	int8_t arrayInt8[COUNT] = {0, 0, -127, -1, 4};
	
	printf("Question 10, returnMin: Correct Answer = -127\n");
	printf("Question 10, returnMin: Student Answer = %hhd\n\n", returnMin(arrayInt8, COUNT));
	
	return EXIT_SUCCESS;
}
