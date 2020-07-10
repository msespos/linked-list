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
    return nil if @head.next == nil || index > size  
    count = 0
    node = @head.next
    until count == index || node.next == nil
      node = node.next
      count += 1
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
  #insert_at(value, index) that inserts the node with the provided value at the given index
  #remove_at(index) that removes the node at the given index. 
    #(You will need to update the links of your nodes in the list when you remove a node.)

end

list = LinkedList.new
p list.pop
p list.to_s
p list.size
p list.first_node
list.append(4)
p list.tail
p list.to_s
p list.size
p list.first_node
p list.tail
list.append(23)
p list.to_s
p list.size
p list.first_node
p list.tail
list.append(28)
p list.to_s
p list.size
p list.first_node
p list.tail
list.prepend(3)
p list.to_s
p list.size
p list.first_node
p list.tail
list.prepend(2)
p list.to_s
p list.size
p list.first_node
p list.tail
list.prepend(1)
p list.to_s
p list.size
p list.first_node
p list.tail
p list.at(0)
p list.at(1)
p list.at(4)
p list.at(5)
p list.at(28)
puts "POP!"
list.pop
p list.to_s
p list.contains?(23)
p list.contains?(28)
p list.find(23)
p list.find(28)