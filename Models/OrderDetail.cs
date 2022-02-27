using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace MAQFurni.Models
{
    [Table("OrderDetail")]
    public partial class OrderDetail
    {
        [Key]
        [Column("DetailID")]
        [StringLength(50)]
        public string DetailId { get; set; }
        [Required]
        [Column("OrderID")]
        [StringLength(50)]
        public string OrderId { get; set; }
        [Required]
        [Column("ProductID")]
        [StringLength(50)]
        public string ProductId { get; set; }
        [Column(TypeName = "decimal(16, 2)")]
        public decimal DetailPrice { get; set; }
        public int Quantity { get; set; }

        [ForeignKey(nameof(OrderId))]
        [InverseProperty("OrderDetails")]
        public virtual Order Order { get; set; }
        [ForeignKey(nameof(ProductId))]
        [InverseProperty("OrderDetails")]
        public virtual Product Product { get; set; }
    }
}
