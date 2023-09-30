using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;

namespace DealCart.BLL.Helper
{
	public static class EmailSender
	{

		public static int EmailSend(IConfiguration _configuration, string sub, string clientEmail, string messageBody)
		{
			string subject = sub;
			string SenderEmail = _configuration.GetSection("EmailConfiguration:From").Value;
			string Passowrd = _configuration.GetSection("EmailConfiguration:Password").Value;
			string UserName = _configuration.GetSection("EmailConfiguration:Username").Value;
			string smtpServer = _configuration.GetSection("EmailConfiguration:SmtpServer").Value;
			try
			{
				MailMessage mail = new MailMessage();
				SmtpClient smtp = new SmtpClient();

				mail.From = new MailAddress(SenderEmail, "Invoice");
				mail.To.Add(clientEmail);
				mail.Subject = subject;
				mail.IsBodyHtml = true;
				mail.Body = messageBody;
				smtp.Port = 587;
				smtp.Host = smtpServer;
				smtp.EnableSsl = true;
				smtp.UseDefaultCredentials = false;
				smtp.Credentials = new System.Net.NetworkCredential(SenderEmail, Passowrd);
				smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
				smtp.Send(mail);
				return 1;
			}
			catch (Exception ex)
			{
			

			}
			return 0;

		}
	}
}
