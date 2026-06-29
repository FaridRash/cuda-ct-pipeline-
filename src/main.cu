#include <iostream>
#include <opencv2/opencv.hpp>

__global__ void hello_kernel() {
    printf("Hello from CUDA thread %d\n", threadIdx.x);
}

int main() {
    std::cout << "OpenCV version: " << CV_VERSION << std::endl;

    hello_kernel<<<1, 4>>>();
    cudaDeviceSynchronize();

    return 0;
}
