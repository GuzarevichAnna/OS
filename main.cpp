#include <iostream>
#include <thread>
#include "buffered_channel.h"

void Sender(BufferedChannel<int> &bufferedChannel, int val) {
    std::this_thread::sleep_for(std::chrono::seconds(1));
    bufferedChannel.Send(val);
}


void Receiver(BufferedChannel<int> &bufferedChannel) {
    std::this_thread::sleep_for(std::chrono::seconds(1));
    std::pair<int, bool> result = bufferedChannel.Recv();
}

int main() {
    const int size = 3;
    BufferedChannel<int> bufferedChannel(size);
    std::vector<std::thread> vect;

    for (int i = 1; i <= 4; i++) {
        vect.emplace_back(Sender, std::ref(bufferedChannel), i);
    }

    for (int i = 1; i <= 2; i++) {
        vect.emplace_back(Receiver, std::ref(bufferedChannel));
    }

    for (int i = 5; i <= 6; i++) {
        vect.emplace_back(Sender, std::ref(bufferedChannel), i);
    }

    for (int i = 3; i <= 5; i++) {
        vect.emplace_back(Receiver, std::ref(bufferedChannel));
    }

    for (auto &thr: vect) {
        thr.join();
    }
    std::cout<<"The task performed successfully.\n";

    bufferedChannel.Close();
    std::cout<<"The channel has been closed.\n";
    std::thread thr1(Receiver, std::ref(bufferedChannel));
    thr1.join();
    std::cout<<"Receiving was done after the channel had been closed.\n";
    std::thread thr2(Sender, std::ref(bufferedChannel), 10);
    thr2.join();

    return 0;
}
