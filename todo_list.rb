require "./todo_item"

class TodoList
  attr_reader :name, :todo_items

  def initialize(name)
    @name = name
    @todo_items = []
  end

  def add_item(name)
    todo_items.push(TodoItem.new(name))
  end
end

todo_list = TodoList.new("groceries")
todo_list.add_item("milk")

puts todo_list.inspect
