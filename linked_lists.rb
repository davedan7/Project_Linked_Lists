class IterativeLinkedList

	attr_reader :head

 	def push(data)
		node = Node.new(data)
		if head.nil?
 			@head = node
 		else
 			current = head
			until current.next_node.nil?
 				current = current.next_node 
 			end
			current.next_node = node
 		end
 	end

	def count
		count = 0
		if head.nil?
			return count
		else
			count += 1
			current = head
			until current.next_node == nil
				current = current.next_node
				count += 1
			end
			return count
		end
	end

	def tail
		if head.next_node.nil?
			head
		else
			current = head
			until current.next_node == nil
				current = current.next_node
			end
			current
		end
	end

	def position(index)
		count = 0
		current = head
		if index == 0
			head.data
		else
			until count == index
				current = current.next_node
				count += 1
			end
			current.data
		end
	end

	# def pop
	# 		previous = nil #added this
	# 		current = head
	# 		if current.next_node == nil
	# 				@head = nil
	# 		else
	# 				until current.next_node == nil
	# 						previous = current #added this
	# 						current = current.next_node
	# 				end
	# 				previous.next_node = nil #added this
	# 		end
	# end
	
	def pop
		current = head
		if current.next_node.nil?
			@head = nil
		else
			until current.next_node.next_node.nil?
				current = current.next_node
			end
			current.next_node = nil
		end
	end
	
	def delete(data)
		previous = nil
		current = head
		if current.data == data
			@head = nil
		else
			until current.data == data
				previous = current
				current = current.next_node
			end
			previous.next_node = nil
		end
	end

end

class RecursiveLinkedList
	attr_reader :head

 	def push(data, node = head)
 		if node.nil?
 			@head = Node.new(data) 		#If we didnt' create head here, it would be nil, and so would data (because data = nil)
 		elsif node.next_node.nil?
 				node.next_node = Node.new(data)
 		else
 				push(data, node.next_node)
 		end
 	end

	def count(node = head)
		if node.nil?
			0
		else
			1 + count(node.next_node)
		end
	end

	def position(index, node = head)
		return nil unless node
		if index == 0
			node.data
		else
			position(index - 1, node.next_node)
		end
			# if node
			# 	node.data
			# else
			# 	nil
			# end
	end

	def pop(node = head)
		if node.nil?
			@head = nil
		elsif node.next_node && node.next_node.next_node.nil?
			node.next_node = nil
		else
			pop(node.next_node)
		end
	end

end


class Node

	attr_accessor :next_node, :data

	def initialize(data, next_node = nil)
		@data = data
		@next_node = next_node
	end

end

#append
# if @head == nil
# 	head = Node.new(data)
# 	@head = head
# 	@node = head
#
# else
# 	@node.next_node = Node.new(data)
# 	until node.next_node
#
