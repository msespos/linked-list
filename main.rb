class Node

  attr_accessor :value, :next

  def initialize
    @value = nil
    @next = nil
  end

end

class LinkedList

  def initialize
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
    node = head
    until node.next == nil
      node = node.next
    end
    node
  end

  # returns the node at the given index
  def at(index)
    count = 1
    node = head
    until count == index
      node = node.next
      count += 1
    end
    node
  end

  # removes the last element from the list
  def pop
  end
  
  #contains?(value) returns true if the passed in value is in the list and otherwise returns false.
  #find(value) returns the index of the node containing value, or nil if not found.
  #to_s represent your LinkedList objects as strings, so you can print them out and preview them 
    #in the console. The format should be: ( value ) -> ( value ) -> ( value ) -> nil

  #Extra Credit
  #insert_at(value, index) that inserts the node with the provided value at the given index
  #remove_at(index) that removes the node at the given index. 
    #(You will need to update the links of your nodes in the list when you remove a node.)

end
