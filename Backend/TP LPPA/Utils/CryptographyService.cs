using System.Collections.Generic;
using TP_LPPA.Models.LPPA;
using TP_LPPA.Entities;
using TP_LPPA.Contracts;
using System;
using System.Security.Cryptography;
using System.Text;

namespace SL.Services
{
    /// <summary>
    /// Brinda funciones de encriptación y hashing.
    /// </summary>
    public static class CryptographyService
    {
        public static string Hash_SHA256(string text)
        {
            using (var sha256 = new SHA256Managed())
            {
                return BitConverter.ToString(sha256.ComputeHash(Encoding.UTF8.GetBytes(text))).Replace("-", "");
            }
        }
    }
}
