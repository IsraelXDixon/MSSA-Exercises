using System;

namespace CSharpEx07_dixon
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("This is C# Exercise 7.");
            int[] wheel = {0,28,9,26,30,11,7,20,32,17,5,22,34,15,3,24,36,13,1,00
                          ,27,10,25,29,12,8,19,31,18,6,21,33,16,4,23,35,14,2};
            Random random = new Random();
            int start1 = random.Next(0, 38);
            Console.WriteLine($"This is the index on the wheel {start1}");
            Console.WriteLine($"This is the value of the wheel {wheel[start1]}");
            int roll = wheel[start1];
            int[] red = { 32, 19, 21, 25, 34, 27, 36, 30, 23, 5, 16, 1, 14, 9, 18, 7, 12, 3 };
            int[] black = { 15, 4, 2, 17, 6, 13, 11, 8, 10, 24, 33, 20, 31, 22, 29, 28, 35, 26 };

            int[] First_column = { 1, 4, 7, 10, 13, 16, 19, 22, 25, 28, 31, 34 };
            int[] Second_column = { 2, 5, 8, 11, 14, 17, 20, 23, 26, 29, 32, 35 };
            int[] Third_column = { 3, 6, 9, 12, 15, 18, 21, 24, 27, 30, 33, 36 };
            
            int[] street1 = { 1, 2, 3 };
            int[] street2 = { 4, 5, 6 };
            int[] street3 = { 7, 8, 9 };
            int[] street4 = { 10, 11, 12 };
            int[] street5 = { 13, 14, 15 };
            int[] street6 = { 16, 17, 18 };
            int[] street7 = { 19, 20, 21 };
            int[] street8 = { 22, 23, 24 };
            int[] street9 = { 25, 26, 27 };
            int[] street10 = { 28, 29, 30 };
            int[] street11 = { 31, 32, 33 };
            int[] street12 = { 34, 35, 36 };

            int[,] twoDarray = new int[12, 3] 
            {
                { 1, 2, 3},
                { 4, 5, 6 },
                { 7, 8, 9 },
                { 10, 11, 12 },
                { 13, 14, 15 },
                { 16, 17, 18 },
                { 19, 20, 21 },
                { 22, 23, 24 },
                { 25, 26, 27 },
                { 28, 29, 30 },
                { 31, 32, 33 },
                { 34, 35, 36 }

            };
            //Console.WriteLine($"{twoDarray[10,0]} {twoDarray[10,1]} {twoDarray[10,2]}");

            /////////////////////////////////////////////Part 1 & 2: Numbers/ Odds & Evens
            if (start1 == 0)
            {
                Console.WriteLine($"Zero, House wins");
            }
            else if (start1 == 19)
            {
                Console.WriteLine($"ZeroZero, House wins");
            }
            else if (wheel[start1] % 2 == 0)
            {
                Console.WriteLine($"Number is even");
            }
            else if (wheel[start1] % 2 != 0)
                Console.WriteLine($"Number is odd");

            /////////////////////////////////////////////Part 3: Reds/Blacks
            foreach (int value in red)
            {
                if(roll == value)
                {
                    Console.WriteLine($"You landed on Red {value}");
                }
            }
            foreach(int value in black)
            {
                if (roll == value)
                {
                    Console.WriteLine($"You landed on Black {value}");
                }
            }
            {
                if (start1 == 0)
                {
                    Console.WriteLine($"You landed on Green {start1}");
                }
                else if (start1 == 19)
                {
                    Console.WriteLine($"You landed on Green 00");
                }

                /////////////////////////////////////////Part 4: Lows/Highs
                if (roll == 0)
                {
                    Console.WriteLine();
                }
                else if (roll < 19)
                {
                    Console.WriteLine("You got a Low Roll");
                }
                else if (roll > 18)
                {
                    Console.WriteLine("You got an High Roll");
                }

                //////////////////////////////////////Part 5: Dozens
                if (roll == 0)
                {
                    Console.WriteLine();
                }
                else if (roll <= 12)
                {
                    Console.WriteLine("You got 1st Dozen rows");
                }
                else if (roll >= 13 && roll <= 24)
                {
                    Console.WriteLine("You got 2nd Dozen rows");
                }
                else if (roll >= 25 )
                {
                    Console.WriteLine("You got 3rd Dozen rows");
                }

                ///////////////////////////////////////////Part 6: Columns
                foreach (int value in First_column)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed on the First Column {value}");
                    }
                }
                foreach (int value in Second_column)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed on the Second Column {value}");
                    }
                }
                foreach (int value in Third_column)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed on the Third Column {value}");
                    }
                }


                 ////////////////////Part 7: Street
                foreach (int value in street1)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 1: {value}");
                    }
                }
                foreach (int value in street2)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 2: {value}");
                    }
                }
                foreach (int value in street3)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 3: {value}");
                    }
                }
                foreach (int value in street4)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 4: {value}");
                    }
                }
                foreach (int value in street5)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 5: {value}");
                    }
                }
                foreach (int value in street6)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 6: {value}");
                    }
                }
                foreach (int value in street7)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 7: {value}");
                    }
                }
                foreach (int value in street8)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 8: {value}");
                    }
                }
                foreach (int value in street9)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 9: {value}");
                    }
                }
                foreach (int value in street10)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 10: {value}");
                    }
                }
                foreach (int value in street11)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 11: {value}");
                    }
                }
                foreach (int value in street12)
                {
                    if (roll == value)
                    {
                        Console.WriteLine($"You landed in street 12: {value}");
                    }
                }

                ////////////////////////////////////////Part 8: Six Numbers/Double Rows
                int unbound0 = twoDarray.GetUpperBound(0);
                int unbound1= twoDarray.GetUpperBound(1);
                int ycol = 0;
                int xrow = 0;
                int CurrentRowNum1 = 0;
                int CurrentRowNum2 = 0;

                int DownRowNum1 = 0;
                int DownRowNum2 = 0;
                int DownRowNum3 = 0;

                int UpRowNum1 = 0;
                int UpRowNum2 = 0;
                int UpRowNum3 = 0;

                int CurrentMidx = 0;
                int CurrentMidy = 0;

                int SequenceCurrentOrder1 = 0;
                int SequenceCurrentOrder2 = 0;
                int SequenceCurrentOrder3 = 0;

                for (int column = 0; column <= unbound0; column++)
                {
                    for (int row = 0; row <= unbound1; row++)
                    {
                        
                        int result = twoDarray[column, row];
                        //Console.WriteLine(result);

                        if (roll == result)
                        {
                            ycol = column;
                            Console.WriteLine($"This is y = {ycol}");
                            xrow = row;
                            Console.WriteLine($"This is x = {xrow}");

                        }
                        
                    }
                }
                //Console.WriteLine($"{twoDarray[ycol,xrow]}");
                if (xrow == 0)
                {
                    CurrentRowNum1 = twoDarray[ycol,xrow + 1];
                    CurrentRowNum2 = twoDarray[ycol, xrow + 2];
                    Console.Write($"Row is {twoDarray[ycol,xrow]} {CurrentRowNum1} {CurrentRowNum2} ");
                    CurrentMidx = xrow+1;
                    CurrentMidy = ycol;
                    SequenceCurrentOrder1 = twoDarray[ycol, xrow];
                    SequenceCurrentOrder2 = CurrentRowNum1;
                    SequenceCurrentOrder3 = CurrentRowNum2;
                }
                else if (xrow == 1)
                {
                    CurrentRowNum1 = twoDarray[ycol, xrow + 1];
                    CurrentRowNum2 = twoDarray[ycol, xrow - 1];
                    Console.Write($"Row is {CurrentRowNum2} {twoDarray[ycol, xrow]} {CurrentRowNum1} ");
                    CurrentMidx = xrow;
                    CurrentMidy = ycol;
                    SequenceCurrentOrder1 = CurrentRowNum2;
                    SequenceCurrentOrder2 = twoDarray[ycol,xrow ];
                    SequenceCurrentOrder2 = CurrentRowNum1;
                }
                else
                {
                    CurrentRowNum1 = twoDarray[ycol, xrow - 1];
                    CurrentRowNum2 = twoDarray[ycol, xrow - 2];
                    Console.Write($"Row is {CurrentRowNum2} {CurrentRowNum1} {twoDarray[ycol, xrow]} ");
                    CurrentMidx = xrow - 1;
                    CurrentMidy = ycol;
                    SequenceCurrentOrder1 = CurrentRowNum2;
                    SequenceCurrentOrder2 = CurrentRowNum1;
                    SequenceCurrentOrder3 = twoDarray[ycol, xrow]; ;
                }
                //////////////Going Down get row
                if (ycol == 11)
                {
                    //No Add
                }
                else
                {
                    DownRowNum1 = twoDarray[CurrentMidy + 1, CurrentMidx - 1];
                    DownRowNum2 = twoDarray[CurrentMidy - 1, CurrentMidx];
                    DownRowNum3 = twoDarray[CurrentMidy - 1, CurrentMidx + 1];
                    Console.Write($"{DownRowNum1} {DownRowNum2} {DownRowNum3} ");
                    
                    //we add
                }
                //////////////Going up Get Row
                if (ycol == 0)
                {
                    //No Subtract
                }
                else
                {
                    UpRowNum1 = twoDarray[CurrentMidy - 1, CurrentMidx - 1];
                    UpRowNum2 = twoDarray[CurrentMidy - 1, CurrentMidx];
                    UpRowNum3 = twoDarray[CurrentMidy - 1, CurrentMidx + 1];
                    Console.Write($"Row is {UpRowNum1} {UpRowNum2} {UpRowNum3} ");
                    Console.WriteLine($"{SequenceCurrentOrder1} {SequenceCurrentOrder2} {SequenceCurrentOrder3}" );

                }

                ////////////////////////Part 9: Split
                //////Going up
                if (ycol == 0)
                {
                    //no subtract 
                }
                else
                {
                    Console.WriteLine($"Winning Pair {roll} {twoDarray[ycol-1,xrow]}");
                }
                //////Going Down
                if (ycol == 11)
                {
                    //no subtract 
                }
                else
                {
                    Console.WriteLine($"Winning Pair {roll} {twoDarray[ycol + 1, xrow]}");
                }
                //////////////Going Left
                if (xrow == 0)
                {
                    //no subtract 
                }
                else
                {
                    Console.WriteLine($"Winning Pair {roll} {twoDarray[ycol, xrow - 1]}");
                }
                ///////////Going Right
                if (xrow == 2)
                {
                    //no add
                }
                else
                {
                    Console.WriteLine($"Winning Pair {roll} {twoDarray[ycol, xrow + 1]}");
                }

                //////////////////Part 10: Corner
                ///Going Up, Right
                int valid = 0;
                if (ycol == 0 || xrow == 2)
                {
                    //Do nothing
                }
                else
                {
                    
                    valid++;
                    //Console.WriteLine($"{}");
                }
                /////////////Going Up, Left
                if (xrow == 2)
                {
                    //Do nothing
                }
                else
                {
                    
                    valid++;
                }
                ///////////Going Down, Right
                if (ycol == 0)
                {
                    //Do nothing
                }
                else
                {
                    
                    valid++;
                }
                if (valid == 3)
                {
                    Console.WriteLine($"winning corner: {roll} {twoDarray[ycol, xrow+1]} ");
                    Console.WriteLine($"{twoDarray[ycol, xrow+1]} ");
                    Console.WriteLine($"{twoDarray[ycol-1, xrow]} ");

                }

            }
        }
    }
}
