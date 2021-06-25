using System;

namespace CSharpEx4_dixon

{
    class Cheetah
    {
        public Cheetah(string v)
        {
        }

        public void Speak(string sound)
        {
            Console.WriteLine(sound);
        }
        public void Eat()
        {
            Console.WriteLine();
        }
        public void CheetahRun()
        {
            Console.WriteLine();
        }
        public void Test(string sound, string name, string species)
        {
            Console.WriteLine($"I am a {species}, My name is {name}, and I say {sound}.");
        }
    }
    class Horse
    {
        public Horse(string v)
        {
        }

        public void Speak(string sound)
        {
            Console.WriteLine(sound);
        }
        public void Eat()
        {
            Console.WriteLine();
        }
        public void HorseRun()
        {
            Console.WriteLine();
        }
        public void Test(string sound, string name, string species)
        {
            Console.WriteLine($"I am a {species}, My name is {name}, and I say {sound}.");
        }
    }
    class Dog
    {
        public Dog(string v)
        {
        }

        public void Speak(string sound)
        {
            Console.WriteLine(sound);
        }
        public void Eat()
        {
            Console.WriteLine();
        }
        public void DogRun()
        {
            Console.WriteLine();
        }
        public void Test(string sound, string name, string species)
        {
            Console.WriteLine($"I am a {species}, My name is {name}, and I say {sound}.");
        }
    }
    class Bird
    {
        public Bird(string v)
        {
        }

        public void Speak(string sound)
        {
            Console.WriteLine(sound);
        }
        public void Eat()
        {
            Console.WriteLine();
        }
        public void BirdRun()
        {
            Console.WriteLine();
        }
        public void Test(string sound, string name, string species)
        {
            Console.WriteLine($"I am a {species}, My name is {name}, and I say {sound}.");
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("This is C# Exercise 4");

            Cheetah Azaad = new Cheetah("Azaad");
            Azaad.Speak("I am a Cheetah, My name is Azaad, and I say Meow.");
            Azaad.Eat();
            Azaad.CheetahRun();

            Cheetah Fuli = new Cheetah("Fuli");
            Fuli.Speak("I am a Cheetah, My name is Fuli, and I say Growl.");
            Fuli.Eat();
            Fuli.CheetahRun();

            Cheetah Tally = new Cheetah("Tally");
            Tally.Speak("I am a Cheetah, My name is Tally, and I say Purrr.");
            Tally.Eat();
            Tally.CheetahRun();

            Cheetah Benjamin = new Cheetah("Benjamin");
            Benjamin.Speak("I am a Cheetah, My name is Benjamin, and I say Hsst.");
            Benjamin.Eat();
            Benjamin.CheetahRun();

            Horse Spirit = new Horse("Spirit");
            Spirit.Speak("I am a Horse, My name is Spirit, and I say neigh.");
            Spirit.Eat();
            Spirit.HorseRun();

            Horse Nobu = new Horse("Nobu");
            Nobu.Speak("I am a Horse, My name is Nobu, and I say neigh.");
            Nobu.Eat();
            Nobu.HorseRun();

            Horse Kage = new Horse("Kage");
            Kage.Speak("I am a Horse, My name is Kage, and I say neigh.");
            Kage.Eat();
            Kage.HorseRun();

            Horse Sora = new Horse("Sora");
            Sora.Speak("I am a Horse, My name is Sora, and I say neigh.");
            Sora.Eat();
            Sora.HorseRun();

            Dog Bolt = new Dog("Bolt");
            Bolt.Speak("I am a Dog, My name is Bolt, and I say bark.");
            Bolt.Eat();
            Bolt.DogRun();

            Dog Krypto = new Dog("Krypto");
            Krypto.Speak("I am a Dog, My name is Krypto, and I say bark.");
            Krypto.Eat();
            Krypto.DogRun();

            Dog Ace = new Dog("Ace");
            Ace.Speak("I am a Dog, My name is Ace, and I say Wuff.");
            Ace.Eat();
            Ace.DogRun();

            Dog Cooper = new Dog("Cooper");
            Cooper.Speak("I am a Dog, My name is Cooper, and I say Wuff.");
            Cooper.Eat();
            Cooper.DogRun();

            Bird Harpie = new Bird("Harpie");
            Harpie.Speak("I am a Bird, My name is Harpie, and I say Kakaww.");
            Harpie.Eat();
            Harpie.BirdRun();

            Bird Sirus = new Bird("Sirus");
            Sirus.Speak("I am a Bird, My name is Sirus, and I say Kakaww.");
            Sirus.Eat();
            Sirus.BirdRun();

            Bird Pidgey = new Bird("Pidgey");
            Pidgey.Speak("I am a Bird, My name is Pidgey, and I say Kakaww.");
            Pidgey.Eat();
            Pidgey.BirdRun();

            Bird Sparrow = new Bird("Sparrow");
            Sparrow.Speak("I am a Bird, My name is Sparrow, and I say Kakaww.");
            Sparrow.Eat();
            Sparrow.BirdRun();

        }
    }
}

