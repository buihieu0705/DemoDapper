﻿namespace DemoDapper.Models
{
    public class Product
    {
        public int Id { get; set; }

        public string ProductName { get; set; }
        public double Price { get; set; }
        public string Description { get; set; }
        public int CategoryId { get; set; }

    }
}
