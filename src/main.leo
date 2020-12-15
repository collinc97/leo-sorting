// Sorts a list of 10 u32 integers.
//
// The algorithm works similar to selection sort by repeatedly finding
// the minimum and maximum elements of an array and then sorting the
// remaining sub-array.
//
// The advantage of this algorithm is that it takes fewer loops than the
// standard selection sort. However, it requires more conditional statements
// and therefore more constraints.
//
function sort(mut arr: [u32; 10]) -> [u32; 10] {
    // Move boundaries of unsorted subarray.
    for i in 0..4 {
        // Find min and max of unsorted subarray.
        let mut min = arr[i];
        let mut max = arr[i];
        let mut min_i = i;
        let mut max_i = i;
        let j = 9 - i;

        for k in i..(j+1) {
            if arr[k] > max {
                max = arr[k];
                max_i = k;
            } else if arr[k] < min {
                min = arr[k];
                min_i = k;
            }
        }

        // Shift the min.
        let temp_1 = arr[i];
        arr[i] = arr[min_i];
        arr[min_i] = temp_1;

        // Shift the max.
        let temp_2 = arr[j];

        arr[j] = if arr[min_i] == max ? arr[min_i] : arr[max_i];

        if arr[min_i] == max {
            arr[min_i] = temp_2;
        } else {
            arr[max_i] = temp_2;
        }
    }

    return arr
}

// The 'leo-sorting' main function.
function main(arr: [u32; 10]) {
    let sorted = sort(arr);
    console.log("{}", sorted);
}

test function test_basic() {
    let sorted = sort([34u32, 52u32, 999999u32, 84u32, 215u32, 102u32, 888u32, 9292u32, 50482u32, 954u32]);
    console.assert([34u32, 52u32, 84u32, 102u32, 215u32, 888u32, 954u32, 9292u32, 50482u32, 999999u32] == sorted);
}