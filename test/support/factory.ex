defmodule Exlivery.Factory do
  use ExMachina

  alias Exlivery.Orders.{Item, Order}
  alias Exlivery.Users.User

  def user_factory do
    %User{
      name: "Aldo",
      email: "aldo@banana.com",
      address: "Rua das Bananeiras",
      cpf: "12345678911",
      age: 30
    }
  end

  def item_factory do
    %Item{
      description: "Pizza de Calabresa",
      category: :pizza,
      quantity: 1,
      unity_price: Decimal.new("45.00")
    }
  end

  def order_factory do
    %Order{
      delivery_address: "Rua das Bananeiras",
      items: [
        build(:item),
        build(:item,
          description: "Temaki de Atum",
          category: :japonese_food,
          quantity: 2,
          unity_price: Decimal.new("20.50")
        )
      ],
      total_price: Decimal.new("86.00"),
      user_cpf: "12345678911"
    }
  end
end
