class Node

  attr_accessor :value, :next

  def initialize
    @value = nil
    @next = nil
  end

end

class LinkedList

  def initialize
    @head = Node.new
  end
  
  # adds a new node containing value to the end of the list
  def append(value)
    node = Node.new
    node.value = value
    node.next = nil
    @head.next == nil ? @head.next = node : tail.next = node
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    node = Node.new
    node.value = value
    node.next = @head.next
    @head.next = node
  end

  # returns the total number of nodes in the list
  def size
    return 0 if @head.next == nil
    count = 1
    node = @head.next
    until node.next == nil
      node = node.next
      count += 1
    end
    count
  end
  
  # returns the first node in the list
  def first_node
    @head.next
  end
  
  #tail returns the last node in the list
  def tail
    return nil if @head.next == nil
    node = @head.next
    node = node.next until node.next == nil
    node
  end

  # returns the node at the given index
  def at(index)
    return nil if @head.next == nil || index >= size || index < 0
    position = 0
    node = @head.next
    until position == index
      node = node.next
      position += 1
    end
    node
  end

  # removes the last element from the list
  def pop
    return nil if @head.next == nil
    node = @head.next
    node = node.next until node.next.next == nil
    node.next = nil
  end

  # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    return false if @head.next == nil
    node = @head.next
    node = node.next until node.value == value || node.next == nil
    node.value == value ? true : false
  end

  # returns the index of the node containing value, or nil if not found.
  def find(value)
    return nil if @head.next == nil
    index = 0
    node = @head.next
    until node.value == value || node.next == nil
      node = node.next
      index += 1
    end
    node.value == value ? index : nil
  end

  #represent your LinkedList objects as strings, so you can print them out and preview them
    #in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    return "nil" if @head.next == nil
    linked_list = "( #{@head.next.value} ) -> "
    node = @head.next
    until node.next == nil
      node = node.next
      linked_list += "( #{node.value} ) -> "
    end
    linked_list += "nil"
  end

  #Extra Credit
  # inserts the node with the provided value at the given index
  def insert_at(value, index)
    if index > size || index < 0
      nil
    elsif index == 0 || @head.next == nil
      prepend(value)
    elsif index == size
      append(value)
    else
      node = @head.next
      position = 0
      until position == index - 1
        node = node.next
        position += 1
      end
      new_node = Node.new
      new_node.value = value
      new_node.next = node.next
      node.next = new_node
    end
  end

  # removes the node at the given index. 
  def remove_at(index)
    if @head.next == nil || index > size || index < 0
      nil
    elsif index == 0
      @head.next = @head.next.next
    elsif index == size
      pop
    else
      node = @head.next
      position = 0
      until position == index - 1
        node = node.next
        position += 1
      end
      node.next = node.next.next
    end
  end

end