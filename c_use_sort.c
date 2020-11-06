#include <stdio.h>
#include "sort.h"

int main(){
    long arr1[5]={1,3, 2, 10, 7};
    
    printf("Array:\n");
    for(long i = 0; i < 5; ++i) {
        printf("%i\n", arr1[i]);
    }
    
    sort(5, arr1);
    
    printf("Sorted array:\n");
    for(long i = 0; i < 5; ++i) {
        printf("%i\n", arr1[i]);
    }
    
    return 0;
}
