g++ -c -o dirNumber/Number.o dirNumber/Number.cpp 
ar r dirNumber/libNumber.a dirNumber/Number.o
g++ -c -o dirVector/Vector.o dirVector/Vector.cpp -IdirNumber -LdirNumber -lNumber
g++ -shared -o dirVector/libVector.so dirVector/Vector.o
g++ -o dirDemo/Demo dirDemo/main.cpp -LdirNumber -LdirVector -lNumber -lVector -IdirVector -IdirNumber
cd dirDemo
export LD_LIBRARY_PATH=../dirVector
./Demo