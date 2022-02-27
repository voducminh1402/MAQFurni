using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.EntityFrameworkCore;

#nullable disable

namespace MAQFurni.Models
{
    [Table("User")]
    public partial class User
    {
        public User()
        {
            Orders = new HashSet<Order>();
        }

        [Key]
        [Column("UserID")]
        [StringLength(50)]
        public string UserId { get; set; }
        [Required]
        [StringLength(120)]
        public string UserName { get; set; }
        [Required]
        [StringLength(200)]
        public string UserAddress { get; set; }
        [Required]
        [StringLength(22)]
        public string UserPhone { get; set; }
        [Required]
        [StringLength(22)]
        public string Password { get; set; }
        [Column(TypeName = "datetime")]
        public DateTime CreateDate { get; set; }
        [StringLength(50)]
        public string Email { get; set; }
        [Column("UserStatusID")]
        public int UserStatusId { get; set; }
        [Column("RoleID")]
        public int RoleId { get; set; }

        [ForeignKey(nameof(RoleId))]
        [InverseProperty("Users")]
        public virtual Role Role { get; set; }
        [ForeignKey(nameof(UserStatusId))]
        [InverseProperty("Users")]
        public virtual UserStatus UserStatus { get; set; }
        [InverseProperty(nameof(Order.User))]
        public virtual ICollection<Order> Orders { get; set; }
    }
}
