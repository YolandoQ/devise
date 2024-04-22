import React from 'react';
import { useTable, useSortBy, usePagination, useFilters } from 'react-table';
import TableStyles from '../styles/TableStyles';

function DefaultColumnFilter({
  column: { filterValue, preFilteredRows, setFilter },
}) {
  const count = preFilteredRows.length;

  return (
    <input
      value={filterValue || ''}
      onChange={e => setFilter(e.target.value || undefined)}
      placeholder={`Buscar em ${count} registros...`}
    />
  );
}

function CustomTable({ columns, data }) {
  const defaultColumn = React.useMemo(
    () => ({
      Filter: DefaultColumnFilter
    }),
    []
  );

  const {
    getTableProps,
    getTableBodyProps,
    headerGroups,
    prepareRow,
    page,
    canPreviousPage,
    canNextPage,
    pageOptions,
    pageCount,
    gotoPage,
    nextPage,
    previousPage,
    setPageSize,
    state: { pageIndex, pageSize },
  } = useTable(
    { columns, data, defaultColumn, initialState: { pageIndex: 0 } },
    useFilters,
    useSortBy,
    usePagination
  );

  return (
    <TableStyles>
      <table {...getTableProps()}>
        <thead>
          {headerGroups.map(headerGroup => (
            <tr {...headerGroup.getHeaderGroupProps()}>
              {headerGroup.headers.map(column => (
                <th {...column.getHeaderProps()}>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center' }}>
                    <div>{column.render('Header')}</div>
                    <span
                      style={{ cursor: 'pointer' }}
                      onClick={(e) => {
                        column.toggleSortBy(!column.isSortedDesc);
                        e.stopPropagation();
                      }}
                    >
                      {column.isSorted
                        ? column.isSortedDesc ? ' 🔽' : ' 🔼'
                        : ' ⬍'}
                    </span>
                  </div>
                  {column.canFilter ? column.render('Filter') : null}
                </th>
              ))}
            </tr>
          ))}
        </thead>
        <tbody {...getTableBodyProps()}>
          {page.map(row => {
            prepareRow(row);
            return (
              <tr {...row.getRowProps()}>
                {row.cells.map(cell => (
                  <td {...cell.getCellProps()}>{cell.render('Cell')}</td>
                ))}
              </tr>
            );
          })}
        </tbody>
      </table>
      <div className="pagination" style={{ justifyContent: 'center', width: '100%' }}>
        <button onClick={() => gotoPage(0)} disabled={!canPreviousPage}>
          {'<<'}
        </button>
        <button onClick={() => previousPage()} disabled={!canPreviousPage}>
          {'<'}
        </button>
        <span>
          Página{' '}
          <strong>
            {pageIndex + 1} de {pageOptions.length}
          </strong>{' '}
        </span>
        <button onClick={() => nextPage()} disabled={!canNextPage}>
          {'>'}
        </button>
        <button onClick={() => gotoPage(pageCount - 1)} disabled={!canNextPage}>
          {'>>'}
        </button>
        <select
          value={pageSize}
          onChange={e => setPageSize(Number(e.target.value))}
        >
          {[10, 20, 30, 40, 50].map(pageSize => (
            <option key={pageSize} value={pageSize}>
              Mostrar {pageSize}
            </option>
          ))}
        </select>
      </div>
    </TableStyles>
  );
}

export default CustomTable;
