using System;
using System.IO;

namespace Day01
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Result:" + Solve(@"../../input.txt"));
			Console.WriteLine("Result:" + SolvePt2(@"../../input.txt"));
			//Console.WriteLine(Solve("input.txt"));
		}

        static int Solve(string inputPath)
        {
            var floor = 0;
            using(var stream = new StreamReader(new FileStream(inputPath, FileMode.Open)))
            {
                var buf = new char[1];
                while(stream.Read(buf, 0, 1) == 1)
                    floor += buf[0] == '(' ? 1 : -1;
            }
            return floor;
        }

		static int SolvePt2(string inputPath)
		{
			var pos = 0;
            var floor = 0;
			using (var stream = new StreamReader(new FileStream(inputPath, FileMode.Open)))
			{
				var buf = new char[1];
                while (stream.Read(buf, 0, 1) == 1)
                {
                    floor += buf[0] == '(' ? 1 : -1;
                    pos++;
                    if (floor == -1)
                        break;
                }
			}
			return pos;
		}
	}
}
