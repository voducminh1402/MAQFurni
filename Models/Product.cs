using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace MAQFurni.Models
{
    [Table("Product")]
    public partial class Product
    {
        public Product()
        {
            OrderDetails = new HashSet<OrderDetail>();
        }

        [Key]
        [Column("ProductID")]
        [StringLength(50)]
        public string ProductId { get; set; }
        [Required]
        [StringLength(120)]
        public string ProductName { get; set; }
        [Required]
        [Column(TypeName = "ntext")]
        public string ProductImage { get; set; }
        [Column(TypeName = "decimal(16, 2)")]
        public decimal ProductPrice { get; set; }
        public int Quantity { get; set; }
        [Required]
        [Column(TypeName = "ntext")]
        public string Description { get; set; }
        [Column("AvailableID")]
        public int AvailableId { get; set; }
        [Column("CategoryID")]
        public int CategoryId { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime CreateDate { get; set; }

        [ForeignKey(nameof(AvailableId))]
        [InverseProperty(nameof(ProductAvailable.Products))]
        public virtual ProductAvailable Available { get; set; }
        [ForeignKey(nameof(CategoryId))]
        [InverseProperty("Products")]
        public virtual Category Category { get; set; }
        [InverseProperty(nameof(OrderDetail.Product))]
        public virtual ICollection<OrderDetail> OrderDetails { get; set; }
    }
}
