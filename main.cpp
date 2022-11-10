#include <iostream>
#include <windows.h>
#include <ctime>
#include <vector>
#include <tuple>
#include <chrono>

typedef std::tuple<int, int, int, int, int, int, int> tuple;

HANDLE ghMutex;
const int N = 5;
int **A = new int *[N];
int **B = new int *[N];
int **result = new int *[N];

void GenerateAndDisplayMatrices() {
    for (int i = 0; i < N; ++i) {
        A[i] = new int[N];
        B[i] = new int[N];
        result[i] = new int[N];
    }

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            result[i][j] = 0;
        }
    }

    srand(time(NULL));

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            A[i][j] = rand() % 10;
        }
    }

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            B[i][j] = rand() % 10;
        }
    }

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            std::cout << A[i][j] << ' ';
        }
        std::cout << '\n';
    }

    std::cout << '\n';

    for (int i = 0; i < N; ++i) {
        for (int j = 0; j < N; ++j) {
            std::cout << B[i][j] << ' ';
        }
        std::cout << '\n';
    }
}


void Multiply(void *parametersVoidPointer) {

    tuple *parametersTuplePointer = static_cast<tuple *>(parametersVoidPointer);
    tuple parametersTuple = *parametersTuplePointer;

    for (int i = 0; i < std::get<1>(parametersTuple); ++i) {
        for (int j = 0; j < std::get<2>(parametersTuple); ++j) {
            for (int k = 0; k < std::get<0>(parametersTuple); ++k) {
                WaitForSingleObject(
                        ghMutex,
                        INFINITE);
                    result[std::get<3>(parametersTuple) + i][std::get<6>(parametersTuple) + j] +=
                            A[std::get<3>(parametersTuple) + i][std::get<4>(parametersTuple) + k] *
                            B[std::get<5>(parametersTuple) + k][std::get<6>(parametersTuple) + j];
                    ReleaseMutex(ghMutex);
            }
        }
    }
}


int main() {

    GenerateAndDisplayMatrices();

    for (int blockSize = 1; blockSize <= N; ++blockSize) {
        int numberOfBlocks = N / blockSize;
        int lastBlockSize = blockSize;

        int AblockWidth;
        int AblockHeight;
        int BblockWidth;

        if (N % blockSize != 0) {
            numberOfBlocks++;
            lastBlockSize = N % blockSize;
        }

        int numberOfThreads = numberOfBlocks*numberOfBlocks*numberOfBlocks;

        HANDLE ThreadArray[numberOfThreads];
        DWORD ThreadIds[numberOfThreads];
        int thrNumber = 0;
        ghMutex = CreateMutex(
                nullptr,
                FALSE,
                nullptr);

        auto start = std::chrono::steady_clock::now();

        for (int i = 0; i < numberOfBlocks; ++i) {
            for (int j = 0; j < numberOfBlocks; ++j) {
                for (int k = 0; k < numberOfBlocks; ++k) {

                    if (i == numberOfBlocks - 1) AblockHeight = lastBlockSize;
                    else AblockHeight = blockSize;

                    if (j == numberOfBlocks - 1) BblockWidth = lastBlockSize;
                    else BblockWidth = blockSize;

                    if (k == numberOfBlocks - 1) AblockWidth = lastBlockSize;
                    else AblockWidth = blockSize;

                    void *parametersPointer = new std::tuple<int, int, int, int, int, int, int>(AblockWidth, AblockHeight,
                                                             BblockWidth,
                                                             i * blockSize,
                                                             k * blockSize,
                                                             k * blockSize, j * blockSize);


                    ThreadArray[thrNumber] = CreateThread(nullptr, 0, reinterpret_cast<LPTHREAD_START_ROUTINE>(Multiply),
                                                   parametersPointer, 0, (LPDWORD) &ThreadIds[thrNumber]);
                    thrNumber++;
                }
            }
        }

        WaitForMultipleObjects(numberOfBlocks*numberOfBlocks*numberOfBlocks, ThreadArray, TRUE, INFINITE);

        auto end = std::chrono::steady_clock::now();
        int time = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();

        std::cout << '\n' << "BlockSize = " << blockSize << ", duration = " << time << '\n';
        for (int i = 0; i < N; ++i) {
            for (int j = 0; j < N; ++j) {
                std::cout << result[i][j] << ' ';
            }
            std::cout << '\n';
        }

        for (int i = 0; i < N; ++i) {
            for (int j = 0; j < N; ++j) {
                result[i][j] = 0;
            }
        }

        for( int i=0; i < numberOfThreads; i++ )
            CloseHandle(ThreadArray[i]);
    }

    CloseHandle(ghMutex);

    return 0;
}
