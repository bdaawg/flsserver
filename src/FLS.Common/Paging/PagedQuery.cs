﻿using System.Collections.Generic;
using System.Linq;

namespace FLS.Common.Paging
{
    /// <summary>
    /// Source code is derived from https://github.com/CypressNorth/.NET-CNPagedList
    /// </summary>
    /// <typeparam name="T"></typeparam>
    public class PagedQuery<T>
    {
        private const int MaxTotalRowsServersideAllowed = 500;

        private readonly IQueryable<T> _items;
        private readonly int? _pageStart;
        private readonly int? _pageSize;

        public PagedQuery(IQueryable<T> items, int? pageStart=null, int? pageSize=null)
        {
            _items = items;
            _pageStart = pageStart;
            _pageSize = pageSize;
        }

        /// <summary>
        /// The paginated result items
        /// </summary>
        public IQueryable<T> Items
        {
            get
            {
                if (_items == null) return null;
                return _items.Skip((PageStart - 1) * PageSize).Take(PageSize);
            }
        }

        /// <summary>
        ///  The current start page (row number).
        /// </summary>
        public int PageStart
        {
            get
            {
                if (_pageStart.HasValue) return _pageStart.Value;

                return 1;
            }
        }

        /// <summary>
        /// The size of the page (returned number of rows).
        /// </summary>
        public int PageSize
        {
            get
            {
                if (_pageSize.HasValue) return _pageSize.Value;

                if (TotalRows > MaxTotalRowsServersideAllowed) return MaxTotalRowsServersideAllowed;

                return TotalRows;
            }
        }

        /// <summary>
        /// The total number of items in the original list of items.
        /// </summary>
        public int TotalRows
        {
            get
            {
                if (_items == null) return 0;

                return _items.Count();
            }
        }
    }
}