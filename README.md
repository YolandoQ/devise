# API de Montagem de Computadores

Esta API permite aos usuários montar um computador personalizado selecionando componentes de hardware disponíveis e visualizar informações detalhadas sobre cada componente, bem como listar e criar pedidos de montagem.

## Endpoints

### Informações Gerais

- **GET** `http://localhost:3001/`
  - Descrição: Retorna informações gerais sobre a API.
  - Resposta:
    ```json
    { "info": "instructions" }
    ```

### Componentes de Hardware

#### Motherboards

- **GET** `http://localhost:3001/api/v1/motherboards`
  - Descrição: Lista todas as placas-mãe disponíveis.
  - Resposta:
    ```json
    [
      {
        "id": 1,
        "name": "Asus ROG",
        "supported_processor": "Intel",
        "memory_slots": 2,
        "max_memory": 16,
        "integrated_video": false,
        "created_at": "2024-04-22T12:08:18.529Z",
        "updated_at": "2024-04-22T12:08:18.529Z"
      },
      {
        "id": 2,
        "name": "Gigabyte Aorus",
        "supported_processor": "AMD",
        "memory_slots": 2,
        "max_memory": 16,
        "integrated_video": false,
        "created_at": "2024-04-22T12:08:18.533Z",
        "updated_at": "2024-04-22T12:08:18.533Z"
      },
      {
        "id": 3,
        "name": "ASRock Steel Legend",
        "supported_processor": "Intel,AMD",
        "memory_slots": 4,
        "max_memory": 64,
        "integrated_video": true,
        "created_at": "2024-04-22T12:08:18.538Z",
        "updated_at": "2024-04-22T12:08:18.538Z"
      }
    ]
    ```

#### Processors

- **GET** `http://localhost:3001/api/v1/processors`
  - Descrição: Lista todos os processadores disponíveis.
  - Resposta:
    ```json
    [
      {
        "id": 1,
        "name": "Core i5",
        "brand": "Intel",
        "created_at": "2024-04-22T12:08:18.425Z",
        "updated_at": "2024-04-22T12:08:18.425Z"
      },
      {
        "id": 2,
        "name": "Core i7",
        "brand": "Intel",
        "created_at": "2024-04-22T12:08:18.456Z",
        "updated_at": "2024-04-22T12:08:18.456Z"
      },
      {
        "id": 3,
        "name": "Ryzen 5",
        "brand": "AMD",
        "created_at": "2024-04-22T12:08:18.488Z",
        "updated_at": "2024-04-22T12:08:18.488Z"
      },
      {
        "id": 4,
        "name": "Ryzen 7",
        "brand": "AMD",
        "created_at": "2024-04-22T12:08:18.493Z",
        "updated_at": "2024-04-22T12:08:18.493Z"
      }
    ]
    ```

#### Graphics Cards

- **GET** `http://localhost:3001/api/v1/graphics_cards`
  - Descrição: Lista todas as placas de vídeo disponíveis.
  - Resposta:
    ```json
    [
      {
        "id": 1,
        "name": "Evga GeForce RTX 2060",
        "memory": 6,
        "created_at": "2024-04-22T12:08:18.606Z",
        "updated_at": "2024-04-22T12:08:18.606Z"
      },
      {
        "id": 2,
        "name": "Asus ROG Strix GeForce RTX 3060",
        "memory": 6,
        "created_at": "2024-04-22T12:08:18.613Z",
        "updated_at": "2024-04-22T12:08:18.613Z"
      },
      {
        "id": 3,
        "name": "Gigabyte Radeon RX 6600 XT EAGLE",
        "memory": 8,
        "created_at": "2024-04-22T12:08:18.622Z",
        "updated_at": "2024-04-22T12:08:18.622Z"
      }
    ]
    ```

#### Memories

- **GET** `http://localhost:3001/api/v1/memories`
  - Descrição: Lista todos os módulos de memória disponíveis.
  - Resposta:
    ```json
    [
      {
        "id": 1,
        "name": "Kingston HyperX",
        "size": 4,
        "created_at": "2024-04-22T12:08:18.558Z",
        "updated_at": "2024-04-22T12:08:18.558Z"
      },
      {
        "id": 2,
        "name": "Kingston HyperX",
        "size": 8,
        "created_at": "2024-04-22T12:08:18.563Z",
        "updated_at": "2024-04-22T12:08:18.563Z"
      },
      {
        "id": 3,
        "name": "Kingston HyperX",
        "size": 16,
        "created_at": "2024-04-22T12:08:18.568Z",
        "updated_at": "2024-04-22T12:08:18.568Z"
      },
      {
        "id": 4,
        "name": "Kingston HyperX",
        "size": 32,
        "created_at": "2024-04-22T12:08:18.574Z",
        "updated_at": "2024-04-22T12:08:18.574Z"
      },
      {
        "id": 5,
        "name": "Kingston HyperX",
        "size": 64,
        "created_at": "2024-04-22T12:08:18.579Z",
        "updated_at": "2024-04-22T12:08:18.579Z"
      }
    ]
    ```

### Pedidos e Montagens

#### Listar Pedidos

- **GET** `http://localhost:3001/api/v1/orders`
  - Descrição: Lista todos os pedidos realizados.
  - Resposta:
    ```json
    [
      {
        "id": 1,
        "customer_name": null,
        "computer_build_id": 1,
        "cpf": "12345678910",
        ...
      },
      ...
    ]
    ```

#### Criar um Pedido de Montagem

- **POST** `http://localhost:3001/api/v1/computer_builds`
  - Descrição: Cria um novo pedido de montagem de computador com os componentes selecionados.
  - Corpo da Requisição:
    ```json
    {
      "computer_build": {
        "motherboard_id": 1,
        "processor_id": 1,
        "graphics_card_id": 1,
        "memory_ids": [1, 2]
      },
      "cpf": "12345678910"
    }
    ```
  - Resposta de Sucesso:
    ```json
    {
      "message": "Pedido criado com sucesso!",
      "computer_build": {
        "id": 1,
        "processor_id": 1,
        "motherboard_id": 1,
        "graphics_card_id": 1,
        ...
      },
      "order": {
        "id": 1,
        "computer_build_id": 1,
        "cpf": "12345678910"
      }
    }
    ```

## Como Usar

Para utilizar esta API, envie requisições HTTP conforme descrito para cada endpoint. Certifique-se de que seu ambiente de desenvolvimento está configurado para apontar para `localhost:3001`.
