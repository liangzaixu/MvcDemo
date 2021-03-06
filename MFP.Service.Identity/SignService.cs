﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNet.Identity.Owin;
using Microsoft.Owin;
using Microsoft.Owin.Security;
using MFP.Repository.Entities.Entity;
using Microsoft.AspNet.Identity;


namespace MFP.Service.Identity
{
    public class SignInService : SignInManager<User, string>
    {
        private UserService _userService;

        public UserService UserService
        {
            get
            {
                return _userService;
            }

            set
            {
                _userService = value;
            }
        }

        public SignInService(UserService userManager, IAuthenticationManager authenticationManager)
            : base(userManager, authenticationManager)
        {
            UserService = userManager;
        }

        public override Task<ClaimsIdentity> CreateUserIdentityAsync(User user)
        {
            return user.GenerateUserIdentityAsync((UserService)UserManager);
        }

        public static SignInService Create(IdentityFactoryOptions<SignInService> options, IOwinContext context)
        {
            return new SignInService(context.GetUserManager<UserService>(), context.Authentication);
        }

        /// <summary>
        /// Sign in the user in using the userId/userName/email and password
        /// </summary>
        /// <param name="accountID"></param>
        /// <param name="password"></param>
        /// <param name="isPersistent"></param>
        /// <param name="shouldLockout"></param>
        /// <returns></returns>
        public override async Task<SignInStatus> PasswordSignInAsync(string accountID, string password, bool isPersistent, bool shouldLockout)
        {
            if (UserManager == null)
            {
                return SignInStatus.Failure;
            }
            var user = await UserService.FindByAccountIdAsync(accountID).WithCurrentCulture();

            if (user == null)
            {
                return SignInStatus.Failure;
            }
            if (await UserManager.IsLockedOutAsync(user.Id).WithCurrentCulture())
            {
                return SignInStatus.LockedOut;
            }
            if (await UserManager.CheckPasswordAsync(user, password).WithCurrentCulture())
            {
                //if (!await IsTwoFactorEnabled(user))
                //{
                //    await UserManager.ResetAccessFailedCountAsync(user.Id).WithCurrentCulture();
                //}
                //return await SignInOrTwoFactor(user, isPersistent).WithCurrentCulture();

                await SignInAsync(user, isPersistent,true).WithCurrentCulture();
                return SignInStatus.Success;
            }
            if (shouldLockout)
            {
                // If lockout is requested, increment access failed count which might lock out the user
                await UserManager.AccessFailedAsync(user.Id).WithCurrentCulture();
                if (await UserManager.IsLockedOutAsync(user.Id).WithCurrentCulture())
                {
                    return SignInStatus.LockedOut;
                }
            }
            return SignInStatus.Failure;
        }
    }
}
