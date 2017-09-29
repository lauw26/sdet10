using System;

namespace ENG1
{
    class MainClass
    {
        public static void Main(string[] args)
        {
            Console.WriteLine("Please Enter your weight in kilograms");
            double weight = Convert.ToDouble(Console.ReadLine());

			Console.WriteLine("Please Enter your height in meters");
			double height = Convert.ToDouble(Console.ReadLine());

            double BMI = MainClass.CalculateBMI(weight, height);
            string result = MainClass.BMIRange(BMI);

            Console.WriteLine($"Your BMI is {BMI} and your {result}");
        }

        public static double CalculateBMI(double weight, double height){

            return (weight/Math.Pow(height, 2));
        }

        public static string BMIRange(double BMI){
            if( BMI > 0 && BMI < 18.5){
                return "skinny";
            }
            else if(BMI >= 18.5 && BMI <= 24.9){
                return "ok";
            }
            else if(BMI > 24.9 && BMI <= 2.9){
                return "big";
            }
            else if(BMI > 29.9){
                return "very big";
            }
            else{
                return "You can't have negative bmi or value of 0";
            }
        }

    }
}
