using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Reflection;
using System.Text;
using FLS.Data.WebApi;

namespace FLS.Server.Data.DbEntities
{
    public partial class EmailTemplate : IFLSMetaData
    {
        public EmailTemplate()
        {
        }

        public Guid EmailTemplateId { get; set; }

        public Guid? ClubId { get; set; }

        [Required]
        [StringLength(100)]
        public string EmailTemplateName { get; set; }

        [Required]
        [StringLength(100)]
        public string EmailTemplateKeyName { get; set; }

        public string Description { get; set; }

        [Required]
        [StringLength(256)]
        public string FromAddress { get; set; }

        /// <summary>
        /// Gets or sets the emails reply to addresses as comma-separated string (if multiple)
        /// </summary>
        [StringLength(256)]
        public string ReplyToAddresses { get; set; }

        [Required]
        [StringLength(256)]
        public string Subject { get; set; }

        public string HtmlBody { get; set; }

        public string TextBody { get; set; }

        public bool IsSystemTemplate { get; set; }

        public bool IsCustomizable { get; set; }

        public int LanguageId { get; set; }


        [Column(TypeName = "datetime2")]
        public DateTime CreatedOn { get; set; }

        public Guid CreatedByUserId { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? ModifiedOn { get; set; }

        public Guid? ModifiedByUserId { get; set; }

        [Column(TypeName = "datetime2")]
        public DateTime? DeletedOn { get; set; }

        public Guid? DeletedByUserId { get; set; }

        public int? RecordState { get; set; }

        public Guid OwnerId { get; set; }

        public int OwnershipType { get; set; }

        public bool IsDeleted { get; set; }

        public virtual Club Club { get; set; }

        public virtual Language Language { get; set; }

        public Guid Id
        {
            get { return EmailTemplateId; }
            set { EmailTemplateId = value; }
        }

        public override string ToString()
        {
            StringBuilder sb = new StringBuilder();
            Type type = GetType();
            sb.Append("[");
            sb.Append(type.Name);
            sb.Append(" -> ");
            foreach (FieldInfo info in type.GetFields())
            {
                sb.Append(string.Format("{0}: {1}, ", info.Name, info.GetValue(this)));
            }

            Type tColl = typeof(ICollection<>);
            foreach (PropertyInfo info in type.GetProperties())
            {
                Type t = info.PropertyType;
                if (t.IsGenericType && tColl.IsAssignableFrom(t.GetGenericTypeDefinition()) ||
                    t.GetInterfaces().Any(x => x.IsGenericType && x.GetGenericTypeDefinition() == tColl)
                    || (t.Namespace != null && t.Namespace.Contains("FLS.Server.Data.DbEntities")))
                {
                    continue;
                }

                sb.Append(string.Format("{0}: {1}, ", info.Name, info.GetValue(this, null)));
            }

            sb.Append(" <- ");
            sb.Append(type.Name);
            sb.AppendLine("]");

            return sb.ToString();
        }
    }
}
