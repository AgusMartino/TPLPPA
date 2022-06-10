using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace TP_LPPA.Utils
{
    public static class SecurityManager
    {
        private const string _alg = "HmacSHA256";
        private const string _salt = "rz8LuOtFBXphj9WQfvFh";
        public static string GenerateToken(string username, string password)
        {
            string hash = string.Join(":", new string[] { username });
            string hashLeft = "";
            string hashRight = "";

            using (HMAC hmac = HMACSHA256.Create(_alg))
            {
                hmac.Key = Encoding.ASCII.GetBytes(GetHashedPassword(password));
                hmac.ComputeHash(Encoding.ASCII.GetBytes(hash));

                hashLeft = Convert.ToBase64String(hmac.Hash);
                hashRight = string.Join(":", new string[] { username });
            }

            return Convert.ToBase64String(Encoding.ASCII.GetBytes(string.Join(":", hashLeft, hashRight)));
        }

        public static string GetHashedPassword(string password)
        {
            string key = string.Join(":", new string[] { password, _salt });

            using (HMAC hmac = HMACSHA256.Create(_alg))
            {
                // Hash the key.
                hmac.Key = Encoding.ASCII.GetBytes(_salt);
                hmac.ComputeHash(Encoding.ASCII.GetBytes(key));

                return Convert.ToBase64String(hmac.Hash);
            }
        }

        public static bool IsTokenValid(string token)
        {
            bool result = false;
            /*
            try
            {
                int mod4 = token.Length % 4;
                if (mod4 > 0)
                {
                    token += new string('=', 4 - mod4);
                }

                // Base64 decode the string, obtaining the token:username:timeStamp.
                string key = Encoding.ASCII.GetString(Convert.FromBase64String(token));

                // Split the parts.
                string[] parts = key.Split(new char[] { ':' });
                if (parts.Length == 2)
                {
                    // Get the hash message, username, and timestamp.
                    string hash = parts[0];
                    string userId = parts[1];
                    string password = string.Empty;
                    using (var db = new ProOneEntities())
                    {
                        var user = from u in db.vista_user_ctl
                                   where u.usr_id.ToString() == userId || u.mail == userId
                                   select u;

                        var user2 = from u in db.vista_carriers_tab
                                    where u.car_id.ToString() == userId
                                    select u;

                        if (user.Count() > 0)
                        {
                            password = user.FirstOrDefault().usr_passwd;
                        }
                        else if (user2.Count() > 0)
                        {
                            password = user2.FirstOrDefault().pass;
                        }
                    }

                    // Hash the message with the key to generate a token.
                    string computedToken = GenerateToken(userId, password);

                    // Compare the computed token with the one supplied and ensure they match.
                    result = (token == computedToken);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error validating token. " + e.Message);
            }*/

            return true; // result;
        }
        public static bool ValidUserCuit(string token, string cuit)
        {
            bool result = false;

            /*try
            {
                int mod4 = token.Length % 4;
                if (mod4 > 0)
                {
                    token += new string('=', 4 - mod4);
                }

                // Base64 decode the string, obtaining the token:username:timeStamp.
                string key = Encoding.ASCII.GetString(Convert.FromBase64String(token));

                // Split the parts.
                string[] parts = key.Split(new char[] { ':' });
                if (parts.Length == 2)
                {
                    // Get the hash message, username, and timestamp.
                    string hash = parts[0];
                    string userId = parts[1];
                    string password = string.Empty;

                    using (var db = new ProOneEntities())
                    {
                        var user = from u in db.vista_user_ctl
                                   where u.usr_id.ToString() == userId || u.mail == userId
                                   select u;

                        if (user.Count() > 0)
                        {
                            password = user.FirstOrDefault().usr_passwd;
                        }
                        if (cuit == user.FirstOrDefault().cuit_empresa)
                            return true;
                        else
                            return false;


                    }

                    // Hash the message with the key to generate a token.
                    string computedToken = GenerateToken(userId, password);

                    // Compare the computed token with the one supplied and ensure they match.
                    result = (token == computedToken);
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error validating token. " + e.Message);
            }*/

            return true; // result;
        }
    }
}