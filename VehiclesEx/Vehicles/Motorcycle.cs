using System;


namespace Vehicles
{
    class Motorcycle : Vehicle
    {
        internal void Accelerate()
        {
            Console.WriteLine("Motorcycle going fast");
        }

        internal void brake()
        {
            Console.WriteLine("Motorcycle skidding on pavement");
        }

        public override void Drive()
        {
            Console.WriteLine("Motorcycling");

        }
    }
}
