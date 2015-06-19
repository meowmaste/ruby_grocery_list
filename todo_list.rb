require "./todo_item"

class TodoList
  attr_read :name, :todo_items

  def initialize(name)
    @name = name
    @todo_items = []
  end
end

todo_list = TodoList.new("groceries")
todo_item = TodoItem.new("milk")

puts todo_list.inspect
puts todo_item.inspect
