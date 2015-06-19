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


  def remove_item(name)
    index = 0
    found = false

    todo_items.each do |todo_item|
      if todo_item.name == name
        found = true
      end
      if found
        break
      else
        index += 1
      end
    end
    if found
      todo_items.delete_at(index)
      return true
    else
      return false
    end
  end

  def mark_complete(name)

  end

end

todo_list = TodoList.new("groceries")
todo_list.add_item("milk")

puts todo_list.inspect

if todo_list.remove_item("eggs")
  puts "eggs were removed from the list"
end
