using System;

namespace Vehicles
{
    class Program
    {
        static void doWork()
        {
            Console.WriteLine("Test Vehicle");
            Vehicle v = new Vehicle();
            v.StartEngine("RUM RUM");
            v.Drive();
            v.StopEngine("GIN GIN");

            Console.WriteLine(' ');
            Console.WriteLine("Journey by airplane:");
            Airplane myPlane = new Airplane();
            myPlane.StartEngine("Contact");
            myPlane.TakeOff();
            myPlane.Drive();
            myPlane.Land();
            myPlane.StopEngine("Whirr");

            Console.WriteLine(' ');
            Console.WriteLine();
            Console.WriteLine("Journey by car:");
            Car Zariah = new Car();
            Zariah.StartEngine("Brm brm");
            Zariah.Accelerate();
            Zariah.Drive();
            Zariah.Brake();
            Zariah.StopEngine("Phut phut");

            Console.WriteLine(' ');
            Console.WriteLine("\nTesting polymorphism");
            Vehicle w = new Vehicle();
            w.Drive();
            w = Zariah;
            w.Drive();
            w = myPlane;
            w.Drive();

            Console.WriteLine(' ');
            Console.WriteLine("Journey by Motorcycle");
            Motorcycle mc = new Motorcycle();
            mc.StartEngine("Hoooopla");
            mc.Accelerate();
            mc.Drive();
            mc.brake();
            mc.StopEngine("clunk");
            
        }

        static void Main()
        {
            try
            {
                doWork();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Exception: {0}", ex.Message);
            }
        }
    }
}
