class Node

  attr_accessor :value, :next

  def initialize
    @value = nil
    @next = nil
  end

end

class LinkedList

  def initialize
    self.next = nil
  end
  
  # adds a new node containing value to the end of the list
  def append(value)
    node = Node.new
    node.value = value
    node.next = nil
    tail.next = node
  end

  # adds a new node containing value to the start of the list
  def prepend(value)
    node = Node.new
    node.value = value
    node.next = head
    self.next = node
  end

  # returns the total number of nodes in the list
  def size
    return 0 if head == nil
    count = 1
    node = head
    until node.next == nil
      node = node.next
      count += 1
    end
    count
  end
  
  # returns the first node in the list
  def head
    self.next
  end
  
  #tail returns the last node in the list
  def tail
    return nil if head == nil
    node = head
    node = node.next until node.next == nil
  end

  # returns the node at the given index
  def at(index)
    return nil if head == nil
    count = 0
    node = head
    until count == index
      node = node.next
      count += 1
    end
    node
  end

  # removes the last element from the list
  def pop
    return nil if head == nil
    node = head
    node = node.next until node.next.next == nil
    node.next == nil
  end

  # returns true if the passed in value is in the list and otherwise returns false.
  def contains?(value)
    return false if head == nil
    is_in_list = false
    node = head
    node = node.next until node.value == value || node.next == nil
    node.value == value ? return true : return false
  end

  # returns the index of the node containing value, or nil if not found.
  def find(value)
    return nil if head == nil
    index = 0
    node = head
    until node.value == value || node.next == nil
      node = node.next
      index += 1
    end
    node.value == value ? return index : return nil
  end

  #represent your LinkedList objects as strings, so you can print them out and preview them
    #in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil
  def to_s
    return nil if head == nil
    linked_list = "( #{head.value} ) -> "
    node = head
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
