#include <iostream>
#include <thread>
#include <ctime>
#include <vector>
#include <mutex>

std::mutex g_lock;

void Multiply(int **A, int **B, int AblockWidth, int AblockHeight, int BblockWidth, int BblockHeight, int AstartRow,
              int AstartColumn, int BstartRow, int BstartColumn, int **result) {


    for (int i = 0; i < AblockHeight; ++i) {
        for (int j = 0; j < BblockWidth; ++j) {
            for (int k = 0; k < AblockWidth; ++k) {
                g_lock.lock();
                result[AstartRow + i][BstartColumn + j] +=
                        A[AstartRow + i][AstartColumn + k] * B[BstartRow + k][BstartColumn + j];
                g_lock.unlock();
            }
        }
    }
}


int main() {

    const int N = 70;
    int **A = new int *[N];
    int **B = new int *[N];
    int **result = new int *[N];
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


    for (int blockSize = 1; blockSize <= N; ++blockSize) {
        int numberOfBlocks = N / blockSize;
        int lastBlockSize = blockSize;

        int AblockWidth;
        int AblockHeight;
        int BblockWidth;
        int BblockHeight;

        if (N % blockSize != 0) {
            numberOfBlocks++;
            lastBlockSize = N % blockSize;
        }

        std::vector<std::thread> ThreadVector;

        auto start = std::chrono::steady_clock::now();

        for (int i = 0; i < numberOfBlocks; ++i) {
            for (int j = 0; j < numberOfBlocks; ++j) {
                for (int k = 0; k < numberOfBlocks; ++k) {

                    if (i == numberOfBlocks - 1) AblockHeight = lastBlockSize;
                    else AblockHeight = blockSize;

                    if (j == numberOfBlocks - 1) BblockWidth = lastBlockSize;
                    else BblockWidth = blockSize;

                    if (k == numberOfBlocks - 1) AblockWidth = BblockHeight = lastBlockSize;
                    else AblockWidth = BblockHeight = blockSize;

                    std::thread thr = std::thread(Multiply, A, B, AblockWidth, AblockHeight, BblockWidth, BblockHeight,
                                                  i * blockSize,
                                                  k * blockSize,
                                                  k * blockSize, j * blockSize, result);
                    ThreadVector.push_back(move(thr));
                }
            }
        }

        for (auto &thr: ThreadVector) {
            thr.join();
        }
        auto end = std::chrono::steady_clock::now();
        int time = std::chrono::duration_cast<std::chrono::microseconds>(end - start).count();
        ThreadVector.clear();

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
    }

    return 0;
}
