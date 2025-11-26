#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <malloc.h>

#define CHUNKSIZE (sizeof(long) * 1024)

void branch(long, int, int, int) ;
int compare(const void *, const void *) ;
void get_str(long, char *, int) ;

long *result ;
int g_count ;
int size_result ;

void main(void)
{
    long *l ;
    int len ;
    char buffer[32] ;

    g_count = 0 ;
    result = (long *) malloc(CHUNKSIZE) ;
    size_result = CHUNKSIZE ;
    branch(0l, 1, 0, 0) ;
    qsort(result, g_count, sizeof(long), compare) ;
    for (int i=0; i<g_count; i++)
    {
        get_str(*(result + i), buffer, 32) ;
        printf("%d : %s\n", i + 1, buffer) ;
    }
}

int compare(const void *a, const void *b)
{
    long l1 = *((long *)a) ;
    long l2 = *((long *)b) ;
    char buffer[32] ;

    for (int i=0; i<45; i++)
    {
        if (l1 % 2 > l2 % 2)
        {
            return 0 ;
        }
        else if (l1 % 2 < l2 %2)
        {
            return 1 ;
        }
        l1 = l1 / 2l ;
        l2 = l2 / 2l ;
    }

    get_str(*((long *)a), buffer, 32) ;
    fprintf(stderr, "ERROR: Same sets exist. (%ld) %s\n", *((long *)a), buffer) ;
    exit(1) ;
}

void branch(long data, int index, int sum, int count)
{
    if (sum == 70 && count == 6)
    {
        if (g_count * sizeof(long) > size_result)
        {
            size_result += CHUNKSIZE ;
            result = (long *)realloc(result, size_result) ;
        }
        *(result + g_count) = data ;
        g_count ++ ;
        return ;
    }
    if (count >= 6 || sum > 70 || index > 45)
    {
        return ;
    }
    branch(data, index + 1, sum, count) ;
    branch(data | (long)1 << (index - 1), index + 1, sum + index, count + 1) ;
}

void get_str(long data, char buffer[], int size)
{
    int i, j, index ;

    for (i=0, j=0, index=0; data > 0; i++)
    {
        if (data % 2l == 1l)
        {
            snprintf(&(buffer[index]), size - index, "%d", i + 1) ;
            index = strlen(buffer) ;
            buffer[index] = ' ' ;
            index ++ ;
            j ++ ;
            if (j > 6)
            {
                fprintf(stderr, "ERROR: more than 6 number in one set\n") ;
                exit(1) ;
            }
        }
        data = data / 2l ;
    }
    buffer[index - 1] = 0 ;
}
