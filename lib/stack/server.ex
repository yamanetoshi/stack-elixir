defmodule Stack.Server do
  use GenServer

  @vsn "0"

  #####
  # 外部 API
  def start_link(_) do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__)
  end

  def pop do
    GenServer.call __MODULE__, :pop
  end

  def push(delta) do
    GenServer.cast __MODULE__, {:push, delta}
  end

  #####
  # GenServer の実装
  def init(_) do
    { :ok, Stack.Stash.get() }
  end

  def handle_call(:pop, _from, current_list) do
    [ head | tail ] = current_list
    { :reply, head, tail }
  end

  def handle_cast({:push, delta}, current_list) do
    { :noreply, current_list ++ [delta]}
  end

  def format_status(_reason, [ _pdict, state ]) do
    [data: [{'State', "My current state is '#{inspect state}', and I'm happy"}]]
  end

  def terminate(_reson, current_list) do
    Stack.Stash.update(current_list)
  end
end
