﻿using System;

namespace FLS.Common.Extensions
{
    public static class DateTimeExtensions
    {
        public static DateTime Truncate(this DateTime date, long resolution)
        {
            return new DateTime(date.Ticks - (date.Ticks % resolution), date.Kind);
        }

        public static DateTime SetAsUtc(this DateTime datetime)
        {
            if (datetime.Kind == DateTimeKind.Local)
            {
                return datetime.ToUniversalTime();
            }
            else if (datetime.Kind == DateTimeKind.Unspecified)
            {
                return DateTime.SpecifyKind(datetime, DateTimeKind.Utc);
            }
            else
            {
                return datetime;
            }
        }

        public static DateTime? SetAsUtc(this DateTime? datetime)
        {
            if (datetime.HasValue == false) return null;

            if (datetime.Value.Kind == DateTimeKind.Local)
            {
                return datetime.Value.ToUniversalTime();
            }
            else if (datetime.Value.Kind == DateTimeKind.Unspecified)
            {
                return DateTime.SpecifyKind(datetime.Value, DateTimeKind.Utc);
            }
            else
            {
                return datetime;
            }
        }

        public static bool ContainsSearchText(this DateTime? datetime, string searchText)
        {
            if (datetime.HasValue == false) return false;

            return datetime.Value.ContainsSearchText(searchText);
        }

        public static bool ContainsSearchText(this DateTime datetime, string searchText)
        {
            var loweredSearchText = searchText.ToLower();

            return datetime.ToString("yyyy-MM-dd").Contains(loweredSearchText)
                || datetime.ToString("yyyy-M-d").Contains(loweredSearchText)
                || datetime.ToString("dd.MM.yyyy").Contains(loweredSearchText)
                || datetime.ToString("d.M.yyyy").Contains(loweredSearchText)
                || datetime.ToString("dd.M.yyyy").Contains(loweredSearchText)
                || datetime.ToString("d.MM.yyyy").Contains(loweredSearchText)
                || datetime.ToString("dd.MM.yy").Contains(loweredSearchText)
                || datetime.ToString("d.M.yy").Contains(loweredSearchText)
                || datetime.ToString("dd.M.yy").Contains(loweredSearchText)
                || datetime.ToString("d.MM.yy").Contains(loweredSearchText);

        }

    }
}