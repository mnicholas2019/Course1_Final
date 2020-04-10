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
#ifndef __STATS_H__
#define __STATS_H__

/* Add Your Declarations and Function Comments here */ 

/**
 * @brief <Add Brief Description of Function Here>
 *
 * <Add Extended Description Here>
 *
 * @param <Add InputName> <add description here>
 * @param <Add InputName> <add description here>
 * @param <Add InputName> <add description here>
 * @param <Add InputName> <add description here>
 *
 * @return <Add Return Informaiton here>
 */

/**
 * @function print_statistics
 * @brief prints the statistics of an array
 *
 * @param data: An unsigned char pointer to an n-element data entry
 * @param size: An unsigned integer as the size of the array
 */
void print_statistics(unsigned char *data, unsigned int size);

/**
 * @function print_array
 * @brief prints the array to the screen
 *
 * @param data: An unsigned char pointer to an n-element data entry
 * @param size: An unsigned integer as the size of the array
 */
void print_array(unsigned char *data, unsigned int size);

/**
 * @function find_median
 * @brief calculates the median value in array
 *
 * @param data: An unsigned char pointer to an n-element data entry
 * @param size: An unsigned integer as the size of the array
 *
 * @return the median of array (unsigned char)
 */
unsigned char find_median(unsigned char *data, unsigned int size);

/**
 * @function find_mean
 * @brief calculates the mean value of array
 *
 * @param data: An unsigned char pointer to an n-element data entry
 * @param size: An unsigned integer as the size of the array
 *
 * @return the mean of array (unsigned char)
 */
unsigned char find_mean(unsigned char *data, unsigned int size);

/**
 * @function find_maximum
 * @brief finds the maximum value in array
 *
 * @param data: An unsigned char pointer to an n-element data entry
 * @param size: An unsigned integer as the size of the array
 *
 * @return the maximum value in array (unsigned char)
 */
unsigned char find_maximum(unsigned char *data, unsigned int size);

/**
 * @function find_minimum
 * @brief finds the minimum value in array
 *
 * @param data: An unsigned char pointer to an n-element data entry
 * @param size: An unsigned integer as the size of the array
 *
 * @return the minimum value in array (unsigned char)
 */
unsigned char find_minimum(unsigned char *data, unsigned int size);

/**
 * @function sort_array
 * @brief sorts the array from largest to smallest
 *
 * @param data: An unsigned char pointer to an n-element data entry 
 * @param size: An unsigned integer as the size of the array
 */
void sort_array(unsigned char *data, unsigned int size);

#endif /* __STATS_H__ */
