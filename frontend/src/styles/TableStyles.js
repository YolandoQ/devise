import styled from 'styled-components';

const TableStyles = styled.div`
  display: flex;
  flex-direction: column;
  justify-content: center;  
  align-items: center;     
  height: 100vh;           

  table {
    border-collapse: collapse;
    width: 90%;            
    margin: 0 auto;         
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.15);

    tr {
      :last-child {
        td {
          border-bottom: 0;
        }
      }
      &:nth-child(even) {
        background-color: #f3f3f3;
      }
    }

    th,
    td {
      margin: 0;
      padding: 0.75rem;
      border: 1px solid #ddd;
      text-align: left;

      :last-child {
        border-right: 0;
      }
    }

    th {
      background-color: #007BFF;
      color: white;
      font-weight: bold;
      position: sticky;
      top: 0;
      box-shadow: 0 2px 2px -1px rgba(0, 0, 0, 0.4);
    }
  }

  .pagination {
    padding: 0.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 50%;
    margin-top: 0.5rem;
  }

  select, button {
    padding: 0.5rem;
    margin: 0 0.5rem;
    border: none;
    background: #007BFF;
    color: white;
    border-radius: 5px;
    cursor: pointer;

    &:disabled {
      background: #ccc;
    }
  }

  input {
    padding: 0.5rem;
    margin: 0.5rem;
    border: 1px solid #ddd;
    border-radius: 5px;
  }
`;

export default TableStyles;
