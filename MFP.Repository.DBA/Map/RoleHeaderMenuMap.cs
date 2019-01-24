﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity.ModelConfiguration;
using MFP.Repository.Entities.Entity;

namespace MFP.Repository.Entities.Map
{
    public class RoleHeaderMenuMap:EntityTypeConfiguration<RoleHeaderMenu>
    {
        public RoleHeaderMenuMap()
        {
            HasKey(m => new {m.RoleID, m.MenuID});
        }
    }
}
