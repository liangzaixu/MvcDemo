using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.EntityFramework;

namespace MFP.Repository.Entities.Entity
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public class User : IdentityUser<string,UserLogin, UserRole, UserClaim>
    {
        public User()
        {
            Id = Guid.NewGuid().ToString();
        }

        public User(string userName)
            : this()
        {
            UserName = userName;
        }


        public async Task<ClaimsIdentity> GenerateUserIdentityAsync(UserManager<User> manager)
        {
            // 请注意，authenticationType 必须与 CookieAuthenticationOptions.AuthenticationType 中定义的相应项匹配
            ClaimsIdentity userIdentity = await manager.CreateIdentityAsync(this, DefaultAuthenticationTypes.ApplicationCookie);
            // 在此处添加自定义用户声明
            return userIdentity;
        }

        [Column(TypeName = "varchar")]
        [StringLength(50)]
        public string AccountId { get; set; }


        [Required]
        public int Age { get; set; }

        [Column(TypeName = "varchar")]
        [StringLength(256)]
        public string Photo { get; set; }

        [Column(TypeName = "nvarchar")]
        [StringLength(32)]
        public string Sign { get; set; }

    }
}
