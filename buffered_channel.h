#ifndef BUFFERED_CHANNEL_H_
#define BUFFERED_CHANNEL_H_

#include <queue>
#include <mutex>
#include <condition_variable>

std::mutex write_mut_;
std::mutex read_mut_;
std::mutex mut_;
std::condition_variable write_var_;
std::condition_variable read_var_;
bool can_write_ = true;
bool can_read_ = true;
bool is_closed_ = false;

template<class T>
class BufferedChannel {
public:
    explicit BufferedChannel(int size) : size_(size) {
        UpdateState();
    }

    void Send(T value) {
        std::unique_lock<std::mutex> lock(write_mut_);
        while(!can_write_) {
            if(is_closed_){
                write_var_.notify_all();
                throw std::runtime_error("The channel is closed.");
            }
            write_var_.wait(lock);
        }
        std::lock_guard<std::mutex> lockGuard(mut_);
        queue_.push(value);
        UpdateState();
        write_var_.notify_one();
        read_var_.notify_one();
    }

    std::pair<T, bool> Recv() {
        std::unique_lock<std::mutex> lock(read_mut_);
        while(!can_read_) {
            if (is_closed_ && queue_.empty()){
                read_var_.notify_all();
                return {T(), false};
            }
            read_var_.wait(lock);
        }
        std::lock_guard<std::mutex> lockGuard(mut_);
        T value = queue_.front();
        queue_.pop();
        UpdateState();
        write_var_.notify_one();
        read_var_.notify_one();
        return {value, true};
    }

    void Close() {
        is_closed_ = true;
        read_var_.notify_one();
        write_var_.notify_one();
    }

private:
    std::queue<T> queue_;
    const int size_;

    void UpdateState(){
        can_write_ = queue_.size()<size_;
        can_read_ = !queue_.empty();
    }
};

#endif // BUFFERED_CHANNEL_H_
