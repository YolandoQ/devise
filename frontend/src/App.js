import React, { useEffect, useState } from 'react';
import axios from 'axios';
import CustomTable from './components/CustomTable';

function App() {
  const [data, setData] = useState([]);

  useEffect(() => {
    axios.get('http://localhost:3001/api/v1/orders')
      .then(response => {
        console.log(response)
        setData(response.data);
      })
      .catch(error => {
        console.error('Erro ao buscar dados:', error);
      });

  }, []);

  const columns = React.useMemo(
    () => [
      { Header: 'ID', accessor: 'id' },
      { Header: 'CPF', accessor: 'cpf' },
      {
        Header: 'Processador',
        accessor: row => `${row.computer_build.processor.name} - ${row.computer_build.processor.brand}`
      },
      {
        Header: 'Placa Mãe',
        accessor: row => {
          const mb = row.computer_build.motherboard;
          return `${mb.name} - ${mb.supported_processor} - ${mb.memory_slots} slots - ${mb.max_memory}GB - ${mb.integrated_video ? 'Sim' : 'Não'}`
        }
      },
      {
        Header: 'Memórias',
        accessor: row => row.computer_build.memories.map(m => `${m.name} - ${m.size}GB`).join(', ')
      },
      { Header: 'Placa de Vídeo', accessor: 'computer_build.graphics_card.name' },
    ],
    []
  );

  return (
    <div className="App">
      <CustomTable columns={columns} data={data} />
    </div>
  );
}

export default App;