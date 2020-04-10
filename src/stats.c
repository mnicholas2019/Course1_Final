/******************************************************************************
 * @file stats.h 
 * @brief Functions that perform statistical analysis on a dataset.
 *
 * Week 1 application assignment for the Coursera course, "Introduction to
 * Embedded Systems Software and Development Environments". 
 *
 * @author Matthew Nicholas
 * @date 4/5/2020
 *
 *****************************************************************************/



#include <stdio.h>
#include "stats.h"

/* Size of the Data Set */
#define SIZE (40)

void main() {

  unsigned char test[SIZE] = { 34, 201, 190, 154,   8, 194,   2,   6,
                              114, 88,   45,  76, 123,  87,  25,  23,
                              200, 122, 150, 90,   92,  87, 177, 244,
                              201,   6,  12,  60,   8,   2,   5,  67,
                                7,  87, 250, 230,  99,   3, 100,  90};                            



  /* Statistics and Printing Functions Go Here */
  sort_array(test, SIZE);
  print_array(test, SIZE);                        
  print_statistics(test, SIZE);
}

void print_statistics(unsigned char *data, unsigned int size){
  unsigned char median, mean, maximum, minimum;
  median = find_median(data, size);
  mean = find_mean(data, size);
  maximum = find_maximum(data, size);
  minimum = find_minimum(data, size);
  printf("Median: %d\nMean: %d\nMaximum: %d\nMinimum: %d\n",
          median, mean, maximum, minimum);
	return;
}

void print_array(unsigned char *data, unsigned int size){
  if (data == NULL || size <= 0) {
    return;
  }

	printf("Array contents: ");
	for (int i = 0; i < size; i++) {
    printf("%d ", data[i]);
	}
  printf("\n");
	return;
}

unsigned char find_median(unsigned char *data, unsigned int size){
  sort_array(data, size);
  
  if (size % 2 == 1)
    return (data[size/2]);
  else {
    return ((data[size/2 - 1] + data[size/2])/2);
  }

	return 0;
}

unsigned char find_mean(unsigned char *data, unsigned int size){
  int sum = 0;
  for (int i = 0; i < size; i++) {
    sum += data[i];
  }
	return (unsigned char)(sum/size);
}

unsigned char find_maximum(unsigned char *data, unsigned int size){
  sort_array(data, size);
	return data[size-1];
}

unsigned char find_minimum(unsigned char *data, unsigned int size){
  sort_array(data, size);
	return data[0];
}

void sort_array(unsigned char *data, unsigned int size){
  if (data == NULL || size <= 0) {
    return;
  }
  unsigned char tmp;
  for (int i = 0; i < size; i++){
    for (int j = 0; j < size; j++){
      if (data[i] < data[j]){
        tmp = data[i];
        data[i] = data[j];
        data[j] = tmp;
      }
    }
  }
	return;
}
