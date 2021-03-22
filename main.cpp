#include <iostream>
#include "D:\NMLT\console.cpp"
#include <windows.h>
#include <time.h>

using namespace std;

enum TrangThai {UP, DOWN, LEFT, RIGHT};

int dem = 0;

struct Toado
{
    int x, y; //y la tung do, x la hoanh do
};

struct HoaQua
{
    Toado td;
};

struct Snake
{
    Toado dot[31];
    int n;
    TrangThai tt;
};

void Khoitao(Snake &snake, HoaQua &hq)
{
    snake.n = 1;
    snake.dot[0].x = 0;
    snake.dot[0].y = 0;
    snake.tt = RIGHT;
    hq.td.x = 10;
    hq.td.y = 10;
}

void AnHoaQua(Snake &snake, HoaQua &hq, int &TimeSleep)
{
    if (snake.dot[0].x == hq.td.x && snake.dot[0].y == hq.td.y)
    {
        snake.n++;
        dem++;
        TimeSleep -= 10;
        for (int i = snake.n-1; i > 0; i--)
            snake.dot[i] = snake.dot[i-1];
        if (snake.tt == UP)
            snake.dot[0].y--;
        else
            if (snake.tt == DOWN)
                snake.dot[0].y++;
        else
            if (snake.tt == LEFT)
                snake.dot[0].x--;
        else
            snake.dot[0].x++;
        /*if (snake.tt == UP)
        {
            snake.dot[snake.n].x = snake.dot[snake.n-1].x;
            snake.dot[snake.n].y = snake.dot[snake.n-1].y - 1;
        }
        else
            if (snake.tt == DOWN)
            {
                snake.dot[snake.n].x = snake.dot[snake.n-1].x;
                snake.dot[snake.n].y = snake.dot[snake.n-1].y + 1;
            }
        else
            if (snake.tt == LEFT)
            {
                snake.dot[snake.n].x = snake.dot[snake.n-1].x - 1;
                snake.dot[snake.n].y = snake.dot[snake.n-1].y;
            }
        else
            if (snake.tt == RIGHT)
            {
                snake.dot[snake.n].x = snake.dot[snake.n-1].x + 1;
                snake.dot[snake.n].y = snake.dot[snake.n-1].y;
            }
        snake.n++;*/
        srand(time(NULL));
        hq.td.x = rand()%49;
        hq.td.y = rand()%24;
    }

}

void HienThi(Snake snake, HoaQua hq)
{
    clrscr();
    TextColor(5);
    for (int i = 0; i <= 25; i++)
    {
        gotoXY(50,i);
        cout<<char(179);
    }
    for (int i = 0; i < 50; i++)
    {
        gotoXY(i,25);
        cout<<char(196);
    }

    gotoXY(52,5);
    TextColor(10);
    cout<<"Point: "<<dem;

    gotoXY(hq.td.x,hq.td.y);
    TextColor(12);
    putchar('H');
    TextColor(10);


    gotoXY(snake.dot[0].x,snake.dot[0].y);
    putchar(2);
    for (int i = 1; i < snake.n; i++)
    {
        gotoXY(snake.dot[i].x,snake.dot[i].y);
        putchar('*');
    }
}

void Randichuyen(Snake &snake)
{
    for (int i = snake.n-1; i > 0; i--)
        snake.dot[i] = snake.dot[i-1];

    if (kbhit())
    {
        int key = _getch();
        if (key == 'a')
            snake.tt = LEFT;
        else
            if (key == 'd')
                snake.tt = RIGHT;
            else
                if (key == 'w')
                    snake.tt = UP;
                else
                    if (key == 's')
                        snake.tt = DOWN;
    }
    if (snake.tt == UP)
        snake.dot[0].y--;
    else
        if (snake.tt == DOWN)
            snake.dot[0].y++;
        else
            if (snake.tt == LEFT)
                snake.dot[0].x--;
            else
                snake.dot[0].x++;
    //HienThi(snake);
}

bool Die(Snake snake)
{
    if (snake.dot[0].x < 0 || snake.dot[0].x > 80 || snake.dot[0].y < 0 || snake.dot[0].y > 25)
        return true;
    for (int i = 1; i < snake.n; i++)
        if (snake.dot[0].x == snake.dot[i].x && snake.dot[0].y == snake.dot[i].y)
            return true;
    if (snake.dot[0].x >= 50 || snake.dot[0].y > 25)
        return true;
    return false;
}

int main()
{
    Snake snake;

    HoaQua hq;
    int TimeSleep = 200;
    Khoitao(snake,hq);

    while (1)
    {
        HienThi(snake,hq);
        //DieuKhien(snake);
        Randichuyen(snake);
        if (Die(snake))
            break;
        AnHoaQua(snake,hq,TimeSleep);
        if (snake.n == 30)
            break;
        Sleep(TimeSleep);
    }
    clrscr();
    if (snake.n == 30)
        cout<<"WIN GAME!";
    else
    {
        cout<<"YOU LOSE";
        cout<<"\nPoint cua ban: "<<dem;
    }
}
