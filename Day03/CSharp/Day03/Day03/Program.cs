using System;
using System.Collections.Generic;
using System.IO;

namespace Day03
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine(SolvePt1(@"../../../input.txt"));
			Console.WriteLine(SolvePt2(@"../../../input.txt"));
			Console.ReadLine();
        }

        class Point 
        {
            public readonly int X, Y;
            public Point(int x, int y)
            {
                X = x;
                Y = y;
            }
            public override bool Equals(object obj)
            {
                return obj is Point &&
                    ((Point)obj).X == X &&
                                ((Point)obj).Y == Y;
            }
            public override int GetHashCode()
            {
                var result = 17;
                result = 31 * result + X;
                result = 31 * result + Y;
                return result;
            }
        }

        static int SolvePt1(string inputPath)
        {
            var visited = new List<Point>();

            using (var stream = new StreamReader(new FileStream(inputPath, FileMode.Open)))
            {
                int xPos = 0, yPos = 0;
                var buf = new char[1];
                while (stream.Read(buf, 0, 1) == 1)
                {
                    xPos += buf[0] == '>' ? 1 : buf[0] == '<' ? -1 : 0;
                    yPos += buf[0] == '^' ? 1 : buf[0] == 'v' ? -1 : 0;
                    var p = new Point(xPos, yPos);
                    if (!visited.Contains(p))
                        visited.Add(p);
                }
            }
    		return visited.Count;
        }

		static int SolvePt2(string inputPath)
		{
			var visited = new List<Point>();

			using (var stream = new StreamReader(new FileStream(inputPath, FileMode.Open)))
			{
                int xSantaPos = 0, ySantaPos = 0;
                int xRoboPos = 0, yRoboPos = 0;
                var santasTurn = true;
				var buf = new char[1];
				while (stream.Read(buf, 0, 1) == 1)
				{
					var xDelta = buf[0] == '>' ? 1 : buf[0] == '<' ? -1 : 0;
					var yDelta = buf[0] == '^' ? 1 : buf[0] == 'v' ? -1 : 0;
                    if(santasTurn) {
                        xSantaPos += xDelta;
                        ySantaPos += yDelta;
						var p = new Point(xSantaPos, ySantaPos);
						if (!visited.Contains(p))
							visited.Add(p);
					}
                    else {
						xRoboPos += xDelta;
						yRoboPos += yDelta;
						var p = new Point(xRoboPos, yRoboPos);
                        if (!visited.Contains(p))
                            visited.Add(p);
					}
                    santasTurn = !santasTurn;
				}
			}
            return visited.Count;
		}
	}
}
