using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace MAQFurni.Models
{
    [Table("ProductAvailable")]
    public partial class ProductAvailable
    {
        public ProductAvailable()
        {
            Products = new HashSet<Product>();
        }

        [Key]
        [Column("AvailableID")]
        public int AvailableId { get; set; }
        [Required]
        [StringLength(50)]
        public string AvailableName { get; set; }

        [InverseProperty(nameof(Product.Available))]
        public virtual ICollection<Product> Products { get; set; }
    }
}
