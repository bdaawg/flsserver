﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Dynamic;
using System.Text;

namespace FLS.Common.Extensions
{
    public static class LinqExtensions
    {
        public static IEnumerable<T> Replace<T>(this IEnumerable<T> items, Predicate<T> condition, Func<T, T> replaceAction)
        {
            return items.Select(item => condition(item) ? replaceAction(item) : item);
        }

        public static TResult? MaxOrDefault<TSource, TResult>(this IEnumerable<TSource> source, Func<TSource, TResult> selector)
            where TResult : struct
        {
            return source
                .Select(selector)
                .Cast<TResult?>()
                .Max();
        }

        /// <summary>
        /// Sorts the query depending on the properties within the sortString.
        /// </summary>
        /// <remarks>
        /// Source code derived from http://www.itorian.com/2015/12/sorting-in-webapi-generic-way-to-apply.html
        /// and http://stackoverflow.com/questions/21176782/create-sort-on-list-for-web-api-controller
        /// </remarks>
        /// <typeparam name="T"></typeparam>
        /// <param name="query"></param>
        /// <param name="sortString">In format 'PropertyName1:asc,PropertyName2:desc</param>
        /// <returns></returns>
        public static IQueryable<T> OrderByPropertyNames<T>(this IQueryable<T> query, string sortString)
        {
            if (query == null)
            {
                throw new ArgumentNullException("query", "Data query is empty.");
            }

            if (string.IsNullOrEmpty(sortString))
            {
                return query;
            }

            var sortExpression = sortString.ToLower().Replace(":asc", "").Replace(":desc", " descending").Trim(',');

            if (string.IsNullOrWhiteSpace(sortExpression) == false)
            {
                // Note: system.linq.dynamic NuGet package is required here to operate OrderBy on string
                query = query.OrderBy(sortExpression);
            }

            return query;
        }

        /// <summary>
        /// Sorts the query depending on the properties within the sortString.
        /// </summary>
        /// <remarks>
        /// Source code derived from http://www.itorian.com/2015/12/sorting-in-webapi-generic-way-to-apply.html
        /// and http://stackoverflow.com/questions/21176782/create-sort-on-list-for-web-api-controller
        /// </remarks>
        /// <typeparam name="T"></typeparam>
        /// <param name="query"></param>
        /// <param name="sorting">In format 'PropertyName1:asc,PropertyName2:desc</param>
        /// <returns></returns>
        public static IQueryable<T> OrderByPropertyNames<T>(this IQueryable<T> query, Dictionary<string, string> sorting)
        {
            if (query == null)
            {
                throw new ArgumentNullException("query", "Data query is empty.");
            }

            if (sorting == null || sorting.Any() == false)
            {
                return query;
            }

            var sb = new StringBuilder();

            foreach (var sortColumn in sorting.Keys)
            {
                sb.Append($"{sortColumn}:{sorting[sortColumn]},");
            }
            var sortExpression = sb.ToString().Replace(":asc", "").Replace(":desc", " descending").Trim(',').ToLower();

            if (string.IsNullOrWhiteSpace(sortExpression) == false)
            {
                // Note: system.linq.dynamic NuGet package is required here to operate OrderBy on string
                query = query.OrderBy(sortExpression);
            }

            return query;
        }

        /// <summary>
        /// Adds a where-clause if condition is true to a query. Usage: .WhereIf(batchNumber != null, s => s.Number == batchNumber)
        /// http://stackoverflow.com/questions/33153932/filter-search-using-multiple-fields-asp-net-mvc
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <param name="source"></param>
        /// <param name="condition"></param>
        /// <param name="predicate"></param>
        /// <returns></returns>
        public static IQueryable<TSource> WhereIf<TSource>(this IQueryable<TSource> source, bool condition, Func<TSource, bool> predicate)
        {
            if (condition)
                return source.Where(predicate).AsQueryable();
            else
                return source;
        }

        /// <summary>
        /// Adds a where-clause if condition string is not empty or null to a query. Usage: .WhereIf(string, s => s.Number == batchNumber)
        /// http://stackoverflow.com/questions/33153932/filter-search-using-multiple-fields-asp-net-mvc
        /// </summary>
        /// <typeparam name="TSource"></typeparam>
        /// <param name="source"></param>
        /// <param name="searchText"></param>
        /// <param name="predicate"></param>
        /// <returns></returns>
        public static IQueryable<TSource> WhereIf<TSource>(this IQueryable<TSource> source, string searchText, Func<TSource, bool> predicate)
        {
            if (string.IsNullOrWhiteSpace(searchText))
                return source;
            else
                return source.Where(predicate).AsQueryable();
        }
    }
}
