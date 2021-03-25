# Exlivery

## Proposal
The proposal for this project is a slightly sowed study on Elixir's Agent module.<br>

In it, I'm exploring:
- Agent Module
- Guards
- DDD (Domain Driven Design)
- Factory Tests
- Report Generation

### NOTE
if you want to run any of this commands properly, you need to start the agents:
```elixir
iex> Exlivery.start_agents()
...> {:ok, PID<...>}
```

### Exlivery.create_or_update_user/1
Creates an application user, used to make orders.

### Setup
```elixir
iex> user_params = %{name: "Aldo", email: "aldo@banana.com", address: "Rua das Bananeiras", cpf: "12345678911", age: 30}
```

#### Success
```elixir
iex> user = Exlivery.create_or_update_user(user_params)
...> {:ok, "User created or updated successfully"}
```

#### Error
Invalid `age` parameter:
```elixir
iex> invalid_user_params = %{user_params | age: 17}
iex> Exlivery.create_or_update_user(invalid_user_params)
...> {:error, "Invalid parameters"}
```

### Exlivery.create_or_update_order/1
Returns the highest value between an "user" or a "food" depending on the option that is passed.

### Setup
```elixir
iex> user_cpf = "45612378912"
iex> item1 = %{description: "Pizza de Calabresa", category: :pizza, quantity: 1, unity_price: "45.00"}
iex> item2 = %{item1 | description: "Pizza de Peperoni", unity_price: "35.50"}
```

#### Success
```elixir
iex> params = %{user_cpf: "45612378912", items: [item1, item2]}
iex> Exlivery.create_or_update_order(params)
...> {:ok, "insert-a-random-generated-uuid-here"}
```

#### Error
Invalid `user_cpf` parameter:
```elixir
iex> params = %{user_cpf: "00000000000", items: [item1, item2]}
iex> Exlivery.create_or_update_order(params)
...> {:error, "User not found"}
```

Invalid Item(s)`:
```elixir
invalid_params = %{user_cpf: cpf, items: [%{item1 | quantity: 0}, item2]}
iex> Exlivery.create_or_update_order(invalid_params)
...> {:error, "Invalid Items"}
```

Invalid `items` parameter:
```elixir
iex> invalid_params = %{user_cpf: cpf, items: []}
iex> Exlivery.create_or_update_order(invalid_params)
...> {:error, "Invalid parameters"}
```

## Tests

This project has tests, just enter the command below at your terminal, in the same folder in this project.
```sh
.../exlivery> mix test
```