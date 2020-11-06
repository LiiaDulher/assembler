#include <stdio.h>
#include "sort.h"

int main(){
    int arr1[5]={1,3, 2, 10, 7};
    printf("Array:\n");
    for(int i = 0; i < 5; ++i) {
        printf("%i\n", arr1[i]);
    }
    printf("Sorted array:\n");
    sort(5, arr1);
    for(int i = 0; i < 5; ++i) {
        printf("%i\n", arr1[i]);
    }
    return 0;
}
