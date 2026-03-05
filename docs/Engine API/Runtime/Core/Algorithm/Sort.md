# Sort

The Sort function handles any array type to organize and put each value in order. To access the function

Sort is defined in CoreMinimal.h

## Run Sort

The Sort function is defined below:

```cpp
void Algo::Sort(ArrayType& Input, ArrayAlgo Type = ArrayAlgo::IntroSort)
```

The ArrayType is a template that can be replaced with any container that supports `Swap()`, `Replace()`, and `Indices()` function

The Type contains the algorithm we will use for the sort algorithm we will use, the default algorithm is IntroSort (introspective sort)

Here's all the options in ArrayAlgo that you can use:

```cpp
ArrayAlgo::IntroSort // Introspective Sort

ArrayAlgo::HeapSort // Heap Sort

ArrayAlgo::InsertionSort // Insertion Sort

ArrayAlgo::QuickSort // Quick Sort
```
