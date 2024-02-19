defmodule Stack.Stash do
  use GenServer

  @me __MODULE__

  def start_link(initial_list) do
    GenServer.start_link(__MODULE__, initial_list, name: @me)
  end

  def get() do
    GenServer.call(@me, { :get })
  end

  def update(new_list) do
    GenServer.cast(@me, { :update, new_list})
  end

  # implements
  def init(initial_list) do
    { :ok, initial_list}
  end

  def handle_call({ :get }, _from, current_list) do
    { :reply, current_list, current_list }
  end

  def handle_cast({ :update, new_list }, _current_list) do
    { :noreply, new_list }
  end
end
